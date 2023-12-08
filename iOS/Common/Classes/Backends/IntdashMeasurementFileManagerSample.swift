//
//  IntdashMeasurementFileManager.swift
//
//  Created by uenomasamitsu on 2023/10/24.
//  Copyright © 2023 aptpod, Inc. All rights reserved.
//

import Foundation

enum IntdashMeasurementFileError: Error {
    case valueInitError
}

// iSCPのデータポイントを保存するサンプルです。
// ファイル構造
// intdash                                  // データの保存先の最上位のファイル名。
// | - {SERVER_URL}                         // 参照するサーバー。
//     | - {SIGN_IN_USER_ID}                // サインインに利用したユーザーのID。サインインしたユーザー毎にデータを参照できるようにします。
//          | - {BASE_TIME}.meas            // ISCPMeasurementFileとして保存されるファイル名。BASE_TIMEはUNIXTIME
//              | - info                    // 計測情報。総データサイズ、NTPの時刻などを保持
//                  | - streams             // ストリームの一覧。サンプルでは1つしか登場しない想定。
//                      | - video.jpeg      // データの種類を示すフォルダ。{種別}.{データ詳細}
//                          | - sequences
//                          | - 0           // インデックス。ストリームが複数出現する可能性があるので分ける。
//                              | - info
//                              | - chunks
//                                  | - 1   // StoreDataChunkのバイナリ、ファイル名がシーケンス番号
//                              | - losts
//                                  | - 1   // chunkの追加と共に生成、ACKが返却された場合削除し、欠損の判定に利用。再送できた場合に削除します。
public class IntdashMeasurementFileManager {
    
    static func getMeasurementFileListPath(parentPath: String, serverURL: String, userID: String) -> String {
        return "\(parentPath)/intdash/\(serverURL)/\(userID.lowercased())"
    }
    
    static func generateFile(parentPath: String, serverURL: String, userID: String, baseTime: TimeInterval, nodeID: String) throws -> IntdashMeasurementFile {
        let file = IntdashMeasurementFile(parentPath: getMeasurementFileListPath(parentPath: parentPath, serverURL: serverURL, userID: userID), baseTime: baseTime, nodeID: nodeID)
        try file.write()
        return file
    }
    
    static func load(parentPath: String, serverURL: String, userID: String) -> [IntdashMeasurementFile] {
        print("load(parentPath: \(parentPath), serverURL: \(serverURL), userID: \(userID)) - IntdashMeasurementFileManager")
        let path = getMeasurementFileListPath(parentPath: parentPath, serverURL: serverURL, userID: userID)
        var measFiles = [IntdashMeasurementFile]()
        if let files = try? FileManager.default.contentsOfDirectory(atPath: path) {
            for i in 0..<files.count {
                print("[\(i)]: \(files[i])")
            }
            let measNames = files.filter { $0.contains(".meas") }
            for name in measNames {
                guard let meas = try? IntdashMeasurementFile.load("\(path)/\(name)") else { continue }
                measFiles.append(meas)
            }
        }
        measFiles.sort { (m1, m2) -> Bool in m1.baseTime > m2.baseTime }
        return measFiles
    }
}

public class IntdashMeasurementFile : Codable {
    
    private(set) var path: String = ""
    
    static func infoPath(_ path: String) -> String {
        return "\(path)/info"
    }
    var infoPath: String {
        return IntdashMeasurementFile.infoPath(self.path)
    }
    var streamListPath : String {
        return "\(self.path)/streams"
    }
    
    private(set) var streams: [IntdashStreamFile] = []
    
    enum CodingKeys: String, CodingKey {
        case baseTime
        case nodeID
        case measurementId
        case projectId
        case endTime
        case ntpBaseTime
        case fileSize
        case isUploaded
    }
    
    let baseTime: TimeInterval
    let nodeID: String
    private(set) var measurementID: String?
    func setMeasurementID(_ id: String) throws {
        self.measurementID = id
        try self.write()
    }
    private(set) var projectID: String?
    func setProjectID(_ id: String) throws {
        self.projectID = id
        try self.write()
    }
    private(set) var endTime: TimeInterval?
    func setEndTime(_ time: TimeInterval) throws {
        self.endTime = time
        try self.write()
    }
    func updateEndTime() {
        var time: TimeInterval? = nil
        for file in self.streams {
            for s in file.sequences {
                guard let (chunk, _) = try? s.loadChunk(sequenceNumber: s.finalSequenceNumber) else { continue }
                var duration: TimeInterval = 0
                for g in chunk.dataPointGroups {
                    for d in g.dataPoints {
                        let t = d.elapsedTime.nsToTimeInterval
                        if duration < t {
                            duration = t
                        }
                    }
                }
                if time == nil { time = duration }
                else if time! < duration { time = duration }
            }
        }
        guard let duration = time else { return }
        try? self.setEndTime(self.baseTime+duration)
    }
    private(set) var ntpBaseTime: TimeInterval?
    func setNTPBaseTime(_ time: TimeInterval) throws {
        self.ntpBaseTime = time
        try self.write()
    }
    private(set) var fileSize: UInt64?
    private func setFileSize(_ size: UInt64) throws {
        self.fileSize = size
        try self.write()
    }
    /// ファイルサイズをファイルから取得し更新する
    func updateFileSize() {
        var fileSize: UInt64? = nil
        for file in self.streams {
            let size = file.fileSize
            fileSize = fileSize == nil ? size : fileSize! + size
        }
        guard let size = fileSize else { return }
        try? self.setFileSize(size)
        
    }
    private(set) var isUploaded: Bool = false
    func setUploadedFlag(_ flag: Bool) throws {
        self.isUploaded = flag
        try self.write()
    }
    
    private let lock = NSLock()
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        if let v = try TimeInterval(values.decode(String.self, forKey: .baseTime)) { self.baseTime = v } else { throw IntdashMeasurementFileError.valueInitError } // 必須 try? は利用しない
        self.nodeID = try values.decode(String.self, forKey: .nodeID) // 必須 try? は利用しない
        self.measurementID = (try? values.decode(String.self, forKey: .measurementId)) ?? nil
        self.projectID = (try? values.decode(String.self, forKey: .projectId)) ?? nil
        if let s = (try? values.decode(String.self, forKey: .endTime)), let v = TimeInterval(s) { self.endTime = v }
        if let s = (try? values.decode(String.self, forKey: .ntpBaseTime)), let v = TimeInterval(s) { self.ntpBaseTime = v }
        self.fileSize = (try? values.decode(UInt64?.self, forKey: .fileSize)) ?? nil
        self.isUploaded = (try? values.decode(Bool.self, forKey: .isUploaded)) ?? false
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(String(self.baseTime), forKey: .baseTime)
        try container.encode(self.nodeID, forKey: .nodeID)
        if let v = self.measurementID { try container.encode(v, forKey: .measurementId) }
        if let v = self.projectID { try container.encode(v, forKey: .projectId) }
        if let v = self.endTime { try container.encode(String(v), forKey: .endTime) }
        if let v = self.ntpBaseTime { try container.encode(String(v), forKey: .ntpBaseTime) }
        if let v = self.fileSize { try container.encode(v, forKey: .fileSize) }
        try container.encode(self.isUploaded, forKey: .isUploaded)
    }
    
    init(parentPath: String, baseTime: TimeInterval, nodeID: String) {
        self.path = "\(parentPath)/\(baseTime.unixtimeString).meas"
        self.baseTime = baseTime
        self.nodeID = nodeID
    }
    
    func write() throws {
        defer { self.lock.unlock() }
        self.lock.lock()
        if !FileManager.default.fileExists(atPath: self.path) {
            try FileManager.default.createDirectory(atPath: self.path, withIntermediateDirectories: true, attributes: nil)
        }
        let data = try JSONEncoder().encode(self)
        try data.write(to: URL(fileURLWithPath: self.infoPath))
    }
    
    static func load(_ path: String) throws -> IntdashMeasurementFile {
        let data = try Data.init(contentsOf: URL.init(fileURLWithPath: infoPath(path)))
        let file = try JSONDecoder().decode(IntdashMeasurementFile.self, from: data)
        file.path = path
        let names = ((try? FileManager.default.contentsOfDirectory(atPath: file.streamListPath)) ?? [])
        for name in names {
            let s = try IntdashStreamFile.load("\(file.streamListPath)/\(name)")
            file.streams.append(s)
        }
        // ファイルサイズがない場合がファイルから計算
        if file.fileSize == nil {
            file.updateFileSize()
        }
        // 終了時間がない場合はファイルから検索
        if file.endTime == nil {
            file.updateEndTime()
        }
        return file
    }
    
    func genereateStreamFile(fileName: String) -> IntdashStreamFile {
        let path = "\(self.streamListPath)/\(fileName)"
        let stream = IntdashStreamFile(path: path)
        self.streams.append(stream)
        return stream
    }

}

public class IntdashStreamFile {
    
    private(set) var path: String = ""
    var sequenceListPath: String {
        "\(self.path)/sequences"
    }
    
    var streamName: String {
        URL(fileURLWithPath: path).lastPathComponent
    }
    
    var sequences: [IntdashSequenceFile] = []
    
    var fileSize: UInt64 {
        var size: UInt64 = 0
        for s in self.sequences {
            size += s.fileSize
        }
        return size
    }
    
    /// 総チャンク数
    var totalChunkCnt: Int {
        var cnt = 0
        for s in self.sequences {
            cnt += s.totalChunkCnt
        }
        return cnt
    }
    
    /// 欠損数
    var lostChunkCnt: Int {
        var cnt = 0
        for s in self.sequences {
            cnt += s.lostChunkCnt
        }
        return cnt
    }
    
    private let lock = NSLock()
    
    init(path: String) {
        self.path = path
    }
    
    static func load(_ path: String) throws -> IntdashStreamFile {
        let file = IntdashStreamFile(path: path)
        let names = ((try? FileManager.default.contentsOfDirectory(atPath: file.sequenceListPath)) ?? [])
        for name in names {
            let s = try IntdashSequenceFile.load(path: "\(file.sequenceListPath)/\(name)")
            file.sequences.append(s)
        }
        return file
    }
        
    
    func getSequence(index: Int = 0) -> IntdashSequenceFile? {
        defer { self.lock.unlock() }
        self.lock.lock()
        guard index < self.sequences.count else { return nil }
        return self.sequences[index]
    }
    
    func generateSequence() throws -> (IntdashSequenceFile, Int)  {
        defer { self.lock.unlock() }
        self.lock.lock()
        let cnt = self.sequences.count
        let sequencePath = "\(self.sequenceListPath)/\(cnt)"
        try FileManager.default.createDirectory(at: URL.init(fileURLWithPath: sequencePath), withIntermediateDirectories: true)
        let sequence = IntdashSequenceFile(path: sequencePath)
        try sequence.write()
        self.sequences.append(sequence)
        return (sequence, cnt)
    }
    
    func appendChunk(sequenceIndex: Int, chunk: Pb_StoreDataChunk, dataSize: UInt64, dataPointCnt: Int) throws {
        guard sequenceIndex < self.sequences.count else { return }
        let sequence = self.sequences[sequenceIndex]
        try sequence.appendChunk(chunk: chunk, dataSize: dataSize, dataPointCnt: dataPointCnt)
    }
    
    func removeChunk(sequenceIndex: Int, sequenceNumber: UInt32) {
        guard sequenceIndex < self.sequences.count else { return }
        let sequence = self.sequences[sequenceIndex]
        sequence.removeChunk(sequenceNumber: sequenceNumber)
    }
}

public class IntdashSequenceFile : Codable {
    
    private(set) var path: String = ""
    
    static func infoPath(_ path: String) -> String {
        return "\(path)/info"
    }
    var infoPath: String {
        return IntdashSequenceFile.infoPath(path)
    }
    private var chunkListPath: String {
        return "\(self.path)/chunks"
    }
    private var lostListPath: String {
        return "\(self.path)/losts"
    }
    
    enum CodingKeys: String, CodingKey {
        case sequenceID
        case totalDataPointCnt
        case fileSize
    }
    
    private(set) var sequenceID: String?
    func setSequenceID(_ id: String?) throws {
        self.sequenceID = id?.lowercased()
        try self.write()
    }
    private(set) var totalDataPointCnt: Int = 0
    private(set) var fileSize: UInt64 = 0
    
    // Ack受信後の書き込みを防ぐ
    private(set) var receivedSequenceNumber: UInt32 = 0
    
    /// 総チャンク数
    var totalChunkCnt: Int {
        defer { self.lock.unlock() }
        self.lock.lock()
        return ((try? FileManager.default.contentsOfDirectory(atPath: self.chunkListPath)) ?? []).count
    }
    
    /// 欠損数
    var lostChunkCnt: Int {
        defer { self.lock.unlock() }
        self.lock.lock()
        return ((try? FileManager.default.contentsOfDirectory(atPath: self.lostListPath)) ?? []).count
    }
    
    /// チャンク
    var sequences: [Int] {
        defer { self.lock.unlock() }
        self.lock.lock()
        var sequences = [Int]()
        let fileNames: [String] = (try? FileManager.default.contentsOfDirectory(atPath: self.chunkListPath)) ?? []
        for name in fileNames {
            if let sequenceNumber = Int(name) {
                sequences.append(sequenceNumber)
            }
        }
        sequences.sort { $0 < $1 } // 昇順に
        return sequences
    }
    
    var finalSequenceNumber: Int {
        return self.sequences.max() ?? 0
    }
    
    /// 欠損チャンク
    var lostSequences: [Int] {
        var sequences = [Int]()
        let fileNames: [String] = (try? FileManager.default.contentsOfDirectory(atPath: self.lostListPath)) ?? []
        for name in fileNames {
            if let sequenceNumber = Int(name) {
                sequences.append(sequenceNumber)
            }
        }
        sequences.sort { $0 < $1 } // 昇順に
        return sequences
    }
    
    private let lock = NSLock()
    
    /// MEMO: ここに変数のキーがない際の初期値を記述する。`Double` は `String` に変換して利用する。
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.sequenceID = try values.decode(String?.self, forKey: .sequenceID)
        self.totalDataPointCnt = try values.decode(Int.self, forKey: .totalDataPointCnt)
        self.fileSize = try values.decode(UInt64.self, forKey: .fileSize)
    }
    
    /// MEMO: ここに保存する変数を記述する。`Double` は `String` に変換して利用する。
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.sequenceID, forKey: .sequenceID)
        try container.encode(self.totalDataPointCnt, forKey: .totalDataPointCnt)
        try container.encode(self.fileSize, forKey: .fileSize)
    }
    
    init(path: String) {
        self.path = path
    }
    
    static func load(path: String) throws -> IntdashSequenceFile {
        let data = try Data.init(contentsOf: URL.init(fileURLWithPath: infoPath(path)))
        let file = try JSONDecoder().decode(IntdashSequenceFile.self, from: data)
        file.path = path
        return file
    }
    
    func write(_ withLock: Bool = true) throws {
        defer { if withLock { self.lock.unlock() } }
        if withLock { self.lock.lock() }
        if !FileManager.default.fileExists(atPath: self.path) {
            try FileManager.default.createDirectory(atPath: self.path, withIntermediateDirectories: true, attributes: nil)
        }
        let data = try JSONEncoder().encode(self)
        try data.write(to: URL(fileURLWithPath: self.infoPath))
    }
    
    func appendChunk(chunk: Pb_StoreDataChunk, dataSize: UInt64, dataPointCnt: Int) throws {
        defer { self.lock.unlock() }
        self.lock.lock()
        // Chunk
        let data = try chunk.serializedData()
        if !FileManager.default.fileExists(atPath: self.chunkListPath) {
            try? FileManager.default.createDirectory(atPath: self.chunkListPath, withIntermediateDirectories: true, attributes: nil)
        }
        let chunkURL = URL(fileURLWithPath: "\(self.chunkListPath)/\(chunk.sequenceNumber)")
        try data.write(to: chunkURL)
        // Lost
        if !FileManager.default.fileExists(atPath: self.lostListPath) {
            try? FileManager.default.createDirectory(atPath: self.lostListPath, withIntermediateDirectories: true, attributes: nil)
        }
        // 既にAckを受信していたら書き込まない
        if chunk.sequenceNumber > self.receivedSequenceNumber {
            let lostURL = URL(fileURLWithPath: "\(self.lostListPath)/\(chunk.sequenceNumber)")
            try Data().write(to: lostURL)
        } else {
            print("already received ack. sequenceID: \(sequenceID ?? "NULL"), sequenceNumber: \(chunk.sequenceNumber), receivedSequenceNumber: \(self.receivedSequenceNumber)")
        }
        // FileSize
        self.fileSize += dataSize
        // DataPoint
        self.totalDataPointCnt += dataPointCnt
        // Update
        try self.write(false)
        print("appendChunk(sequenceID: \(sequenceID ?? "NULL"), sequenceNumber: \(chunk.sequenceNumber), \(data.count) bytes, fileSize: \(self.fileSize), totalDataPointCnt: \(self.totalDataPointCnt))")
    }
    
    func loadChunk(sequenceNumber: Int) throws -> (Pb_StoreDataChunk, UInt64) {
        let chunkPath = "\(self.chunkListPath)/\(sequenceNumber)"
        let data = try Data.init(contentsOf: URL(fileURLWithPath: chunkPath))
        return (try Pb_StoreDataChunk.init(serializedData: data), UInt64(data.count))
    }
    
    func removeChunk(sequenceNumber: UInt32) {
        defer { self.lock.unlock() }
        self.lock.lock()
        let lostChunkPath = "\(self.lostListPath)/\(sequenceNumber)"
        print("removeChunk(sequenceID: \(sequenceID ?? "NULL"), sequenceNumber: \(sequenceNumber), targetPath: \(lostChunkPath))")
        if FileManager.default.fileExists(atPath: lostChunkPath) {
            do {
                try FileManager.default.removeItem(atPath: lostChunkPath)
            } catch {
                print("removeChunk(sequenceID: \(sequenceID ?? "NULL"), sequenceNumber: \(sequenceNumber), targetPath: \(lostChunkPath)) failed. \(error)")
            }
        } else {
            print("removeChunk(sequenceID: \(sequenceID ?? "NULL"), sequenceNumber: \(sequenceNumber), targetPath: \(lostChunkPath)) not found file.")
        }
        if self.receivedSequenceNumber < sequenceNumber {
            self.receivedSequenceNumber = sequenceNumber
        }
    }
}

private extension TimeInterval {
    var unixtimeString: String {
        return String(format: "%0.6f", self).components(separatedBy: ".").joined()
    }
}

fileprivate extension Int64 {
    var nsToTimeInterval: TimeInterval {
        return TimeInterval(self) / 1000_000_000.0
    }
}
