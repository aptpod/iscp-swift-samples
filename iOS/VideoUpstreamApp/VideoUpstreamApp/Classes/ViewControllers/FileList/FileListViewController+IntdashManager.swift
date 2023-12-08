//
//  FileListViewController+IntdashManager.swift
//  VideoUpstreamApp
//
//  Created by Ueno Masamitsu on 2020/10/22.
//  Copyright © 2020 aptpod, Inc. All rights reserved.
//

import Foundation

// 再送の流れ
// 1. 計測IDの存在確認。存在しなければ発行。
// 2. NTPと同期した基準時刻の存在確認。存在すれば送信。
// 2.1. 基準時刻は送信しただけでは利用されない為、計測情報を更新する。
// 3. シーケンスIDの存在確認。
// 3.1. シーケンスIDが存在しなければシーケンスIDを発行し、シーケンス番号登録。
// 3.2. シーケンスIDが存在する場合はローカルに持っているシーケンス番号を反映する。
// 4. データポイント(チャンク)のアップロード。
// 5. 計測を送信完了状態にする。
extension FileListViewController {
    
    func uploadData(file: IntdashMeasurementFile, allSend: Bool, completion: @escaping (Error?)->()) {
        print("uploadData(baseTime: \(file.baseTime), measurementID: \(file.measurementID ?? "")")
        let processTime = Date().timeIntervalSince1970
        self.processTime = processTime
        // 1. 計測IDの存在確認。存在しなければ発行。
        self.requestMeasurementID(processTime: processTime, file: file) { [weak self] measID, error in
            guard !self!.isCanceled && self!.processTime == processTime else {
                print("Upload canceled.")
                return
            }
            guard let measID = measID else {
                completion(error)
                return
            }
            // 2. NTPと同期した基準時刻の存在確認。存在すれば送信。
            self?.sendNTPBaseTime(processTime: processTime, file: file, measurementID: measID, completion: { [weak self] error in
                guard !self!.isCanceled && self!.processTime == processTime else {
                    print("Upload canceled.")
                    return
                }
                guard error == nil else {
                    completion(error)
                    return
                }
                let group = DispatchGroup()
                var error: Error?
                for stream in file.streams {
                    print("Upload stream[\(stream.streamName)] data.")
                    for sequence in stream.sequences {
                        group.enter()
                        self?.sendData(processTime: processTime, measurementID: measID, projectID: file.projectID, file: sequence, allSend: allSend) { e in
                            defer { group.leave() }
                            if let e = e {
                                print("Upload stream[\(stream.streamName)] data error. \(e.localizedDescription)")
                                error = e
                                return
                            }
                            print("Upload stream[\(stream.streamName)] data end.")
                        }
                    }
                }
                group.notify(queue: .global()) {
                    guard !self!.isCanceled && self!.processTime == processTime else {
                        print("Upload canceled.")
                        return
                    }
                    if let error = error {
                        print("Upload file failed. \(error.localizedDescription)")
                        completion(error)
                        return
                    }
                    // 5. 計測を送信完了状態にする。
                    self?.requestCompleteMeasurement(file: file, measurementID: measID, completion: completion)
                }
            })
        }
    }
    
    private func requestCompleteMeasurement(file: IntdashMeasurementFile, measurementID: String, completion: @escaping (Error?)->()) {
        let projectID = file.projectID ?? ""
        let requestCompleteMeasurementCompletion: ((Error?) -> ()) = { error in
            if let error = error {
                print("requestCompleteMeasurement failed. \(error.localizedDescription), measurementUuid: \(measurementID)")
                completion(error)
                return
            }
            print("Upload file[\(file.measurementID!)] successfully.")
            completion(nil)
        }
        if projectID.isEmpty {
            print("requestCompleteMeasurement measurementUuid: \(measurementID)")
            self.api.requestCompleteMeasurement(measurementUuid: measurementID, completion: requestCompleteMeasurementCompletion)
        }
        else {
            print("requestCompleteProjectMeasurement projectUuid: \(projectID), measurementUuid: \(measurementID)")
            self.api.requestCompleteProjectMeasurement(projectUuid: projectID, measurementUuid: measurementID, completion: requestCompleteMeasurementCompletion)
        }
    }
    
    private func sendData(processTime: TimeInterval, measurementID: String, projectID: String?, file: IntdashSequenceFile, allSend: Bool, completion: @escaping (Error?)->()) {
        let sequences = allSend ? file.sequences : file.lostSequences
        // 3. シーケンスIDの存在確認。
        self.requestSequenceID(measurementID: measurementID, projectID: projectID, file: file) { sequenceID, error in
            guard let sequenceID = sequenceID else {
                completion(error)
                return
            }
            // 4. データポイント(チャンク)のアップロード。
            self.uploadChunks(processTime: processTime, measurementID: measurementID, projectID: projectID, sequenceID: sequenceID, file: file, sequences: sequences, completion: completion)
        }
    }
    
    private func uploadChunks(processTime: TimeInterval, measurementID: String, projectID: String?, sequenceID: String, file: IntdashSequenceFile, sequences: [Int], index: Int = 0, completion: @escaping ((Error?) -> ())) {
        guard index < sequences.count else {
            completion(nil)
            return
        }
        var index = index
        var dataSize: UInt64 = 0
        var chunks = [Pb_StoreDataChunk]()
        while index < sequences.count {
            let s = sequences[index]
            do {
                let (chunk, size) = try file.loadChunk(sequenceNumber: s)
                chunks.append(chunk)
                print("append chunk sequenceNumber: \(chunk.sequenceNumber), dataID.name: \(chunk.dataPointGroups.first?.dataID.name ?? ""), dataID.type: \(chunk.dataPointGroups.first?.dataID.type ?? ""), sequenceUuid: \(sequenceID)")
                dataSize += size
                if dataSize >= Config.RESEND_DATA_SIZE {
                    break
                }
                index += 1
            } catch {
                print("Failed to load chunk data. \(error.localizedDescription)")
                completion(error)
                return
            }
        }
        let projectID = projectID ?? ""
        let requestCreateMeasurementChunksCompletion: ((Error?)->()) = { [weak self] error in
            if let error = error {
                print("requestCreateMeasurementChunks error. sequenceUuid: \(sequenceID), index: \(index), \(error.localizedDescription)")
                completion(error)
                return
            }
            print("requestCreateMeasurementChunks successfull. sequenceUuid: \(sequenceID), index: \(index)")
            guard !self!.isCanceled && self!.processTime == processTime else {
                completion(nil)
                return
            }
            // TODO: 進捗表示処理
            //
            self?.uploadChunks(processTime: processTime, measurementID: measurementID, projectID: projectID, sequenceID: sequenceID, file: file, sequences: sequences, index: index+1, completion: completion)
        }
        if projectID.isEmpty {
            print("requestCreateMeasurementChunks measUuid: \(measurementID), sequenceUuid: \(sequenceID), \(chunks.count) chunks, \(dataSize) bytes, index: \(index).")
            self.api.requestCreateMeasurementChunks(measUuid: measurementID, sequenceUuid: sequenceID, chunks: chunks, completion: requestCreateMeasurementChunksCompletion)
        } else {
            print("requestCreateMeasurementChunks measUuid: \(measurementID), sequenceUuid: \(sequenceID), \(chunks.count) chunks, \(dataSize) bytes, index: \(index).")
            self.api.requestCreateProjectMeasurementChunks(projectUuid: projectID, measUuid: measurementID, sequenceUuid: sequenceID, chunks: chunks, completion: requestCreateMeasurementChunksCompletion)
        }
    }
    
    private func requestSequenceID(measurementID: String, projectID: String?, file: IntdashSequenceFile, completion: @escaping (String?, Error?)->()) {
        let totalDataPointCnt = file.totalDataPointCnt
        let finalSequenceNumber = file.finalSequenceNumber
        let projectID = projectID ?? ""
        if let sequenceID = file.sequenceID {
            // 3.2. シーケンスIDが存在する場合はローカルに持っているシーケンス番号を反映する。
            let requestUpdateMeasurementSequenceCompletion: ((Error?) -> ()) = { error in
                if let error = error {
                    print("requestUpdateMeasurementSequence failed. \(error.localizedDescription), sequenceUuid: \(sequenceID)")
                } else {
                    print("requestUpdateMeasurementSequence successfull. sequenceUuid: \(sequenceID)")
                }
                completion(sequenceID, nil)
            }
            if projectID.isEmpty {
                print("requestUpdateMeasurementSequence sequenceUuid: \(sequenceID), measurementUuid: \(measurementID), expectedDataPoints: \(totalDataPointCnt), finalSequenceNumber: \(finalSequenceNumber)")
                self.api.requestUpdateMeasurementSequence(sequenceUuid: sequenceID, measurementUuid: measurementID, expectedDataPoints: totalDataPointCnt, finalSequenceNumber: finalSequenceNumber, completion: requestUpdateMeasurementSequenceCompletion)
            } else {
                print("requestUpdateProjectMeasurementSequence projectUuid: \(projectID), sequenceUuid: \(sequenceID), measurementUuid: \(measurementID), expectedDataPoints: \(totalDataPointCnt), finalSequenceNumber: \(finalSequenceNumber)")
                self.api.requestUpdateProjectMeasurementSequence(projectUuid: projectID, sequenceUuid: sequenceID, measurementUuid: measurementID, expectedDataPoints: totalDataPointCnt, finalSequenceNumber: finalSequenceNumber, completion: requestUpdateMeasurementSequenceCompletion)
            }
            return
        }
        // 3.1. シーケンスIDが存在しなければシーケンスIDを発行しシーケンス番号登録。
        let newSequenceID = UUID().uuidString.lowercased() // こちらからシーケンスを作成する場合は任意のもので良い。
        let requestReplaceMeasurementSequenceCompletion: ((Error?) -> ()) = { error in
            if let e = error {
                print("requestReplaceMeasurementSequence failed. \(e.localizedDescription), sequenceUuid: \(newSequenceID)")
                completion(nil, error)
                return
            }
            print("requestReplaceMeasurementSequence successfull. sequenceUuid: \(newSequenceID)")
            do {
                try file.setSequenceID(newSequenceID)
                completion(newSequenceID, nil)
            } catch {
                print("Failed to save measurementID. \(error.localizedDescription)")
                completion(nil, error)
            }
        }
        if projectID.isEmpty {
            print("requestReplaceMeasurementSequence sequenceUuid: \(newSequenceID), expectedDataPoints: \(totalDataPointCnt), finalSequenceNumber: \(finalSequenceNumber)")
            self.api.requestReplaceMeasurementSequence(sequenceUuid: newSequenceID, measUuid: measurementID, expectedDataPoints: totalDataPointCnt, finalSequenceNumber: finalSequenceNumber, completion: requestReplaceMeasurementSequenceCompletion)
        } else {
            print("requestReplaceProjectMeasurementSequence projectUuid: \(projectID), sequenceUuid: \(newSequenceID), expectedDataPoints: \(totalDataPointCnt), finalSequenceNumber: \(finalSequenceNumber)")
            self.api.requestReplaceProjectMeasurementSequence(projectUuid: projectID, sequenceUuid: newSequenceID, measUuid: measurementID, expectedDataPoints: totalDataPointCnt, finalSequenceNumber: finalSequenceNumber, completion: requestReplaceMeasurementSequenceCompletion)
        }
    }
    
    private func sendNTPBaseTime(processTime: TimeInterval, file: IntdashMeasurementFile, measurementID: String, completion: @escaping ((Error?) -> ())) {
        guard let ntpBaseTime = file.ntpBaseTime else {
            completion(nil)
            return
        }
        // NTPのベースタイムがあれば送る。
        print("sendNTPBaseTime()")
        let projectID = file.projectID ?? ""
        let requestUpdateMeasurementBaseTimeCompletion: ((Error?) -> ()) = { [weak self] error in
            guard !self!.isCanceled && self!.processTime == processTime else {
                completion(nil)
                return
            }
            guard error == nil else {
                print("requestUpdateMeasurementBaseTime failed. \(error!.localizedDescription)")
                completion(error)
                return
            }
            // 2.1. 基準時刻は送信しただけでは利用されない為、計測情報を更新する。
            print("requestUpdateMeasurement measurementUuid: \(measurementID), basetime: \(ntpBaseTime), basetimeType: ntp")
            let requestUpdateMeasurementCompletion: ((Error?) -> ()) = { error in
                if error != nil {
                    print("requestUpdateMeasurement failed. \(error!.localizedDescription)")
                    completion(error)
                    return
                }
                print("requestUpdateMeasurement sucessfull.")
                completion(nil)
            }
            print("requestUpdateMeasurement measurementUuid: \(measurementID), basetime: \(ntpBaseTime), basetimeType: ntp")
            if projectID.isEmpty {
                self?.api.requestUpdateMeasurement(measurementUuid: measurementID, basetime: Date(timeIntervalSince1970: ntpBaseTime), basetimeType: .ntp, completion: requestUpdateMeasurementCompletion)
            } else {
                self?.api.requestUpdateProjectMeasurement(projectUuid: projectID, measurementUuid: measurementID, basetime: Date(timeIntervalSince1970: ntpBaseTime), basetimeType: .ntp, completion: requestUpdateMeasurementCompletion)
            }
        }
        if projectID.isEmpty {
            print("requestUpdateMeasurementBaseTime baseTime: \(ntpBaseTime), measurementUuid: \(measurementID), type: ntp")
            self.api.requestUpdateMeasurementBaseTime(baseTime: ntpBaseTime, measurementUuid: measurementID, type: .ntp, completion: requestUpdateMeasurementBaseTimeCompletion)
        } else {
            print("requestUpdateProjectMeasurementBaseTime projectUuid: \(projectID), baseTime: \(ntpBaseTime), measurementUuid: \(measurementID), type: ntp")
            self.api.requestUpdateProjectMeasurementBaseTime(projectUuid: projectID, baseTime: ntpBaseTime, measurementUuid: measurementID, type: .ntp, completion: requestUpdateMeasurementBaseTimeCompletion)
        }
    }
    
    private func requestMeasurementID(processTime: TimeInterval, file: IntdashMeasurementFile, completion: @escaping ((String?, Error?) -> ())) {
        if let id = file.measurementID {
            completion(id, nil)
            return
        }
        print("requestMeasurementID()")
        // 計測ID払出し
        let baseTime = file.baseTime
        let nodeID = file.nodeID
        let projectID = file.projectID ?? ""
        let completion: ((String?, Error?) -> ()) = { [weak self] measId, error in
            guard !self!.isCanceled && self!.processTime == processTime else {
                completion(nil, nil)
                return
            }
            guard let measId = measId else {
                print("requestCreateMeasurement failed. \(error?.localizedDescription ?? "")")
                completion(nil, error)
                return
            }
            print("requestCreateMeasurement successfully. \(measId)")
            do {
                try file.setMeasurementID(measId)
                completion(measId, nil)
            } catch {
                print("Failed to save measurementID. \(error.localizedDescription)")
                completion(nil, error)
            }
        }
        if projectID.isEmpty {
            print("requestCreateMeasurement basetime: \(baseTime), basetimeType: edgeRtc, nodeID: \(nodeID)")
            self.api.requestCreateMeasurement(basetime: baseTime, basetimeType: .edgeRtc, edgeUuid: nodeID, completion: completion)
        } else {
            print("requestCreateProjectMeasurement projectUuid: \(projectID), basetime: \(baseTime), basetimeType: edgeRtc, nodeID: \(nodeID)")
            self.api.requestCreateProjectMeasurement(projectUuid: projectID, basetime: baseTime, basetimeType: .edgeRtc, edgeUuid: nodeID, completion: completion)
        }
    }
}
