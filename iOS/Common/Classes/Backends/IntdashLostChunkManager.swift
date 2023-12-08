//
//  IntdashLostChunkManager.swift
//  VideoUpstreamApp
//
//  Created by uenomasamitsu on 2023/10/26.
//  Copyright © 2023 aptpod, Inc. All rights reserved.
//

import Foundation
import iSCP

class IntdashLostChunkManager {
    
    let streamFile: IntdashStreamFile
    
    /// オフライン計測時の1チャンクのサイズ
    var chunkSize: UInt64 = 1_000_000
    
    private var dataPointGroups = [DataPointGroup]()
    private var dataSize: UInt64 = 0
    private var sequenceNumberGenerator = SequenceNumberGenerator()
    private var sequenceIndex = 0
    
    init(_ streamFile: IntdashStreamFile) throws {
        self.streamFile = streamFile
        let (_, index) = try streamFile.generateSequence()
        self.sequenceIndex = index
    }
    
    func append(dataID: DataID, dataPoint: DataPoint) throws {
        try self.append(dataPointGroups: [DataPointGroup(dataID: dataID, dataPoints: [dataPoint])], dataSize: UInt64(dataPoint.payload.count))
    }
    
    func append(dataPointGroups: [DataPointGroup], dataSize: UInt64) throws {
        self.dataPointGroups.append(contentsOf: dataPointGroups)
        self.dataSize += dataSize
        if self.dataSize >= self.chunkSize {
            let groups = self.dataPointGroups
            if let sequenceNumber = self.sequenceNumberGenerator.next() {
                try self.write(sequenceIndex: self.sequenceIndex, sequenceNumber: sequenceNumber, dataPointGroups: groups, dataSize: self.dataSize)
            } else {
                // シーケンス番号が上限まで行った場合は新しいシーケンスを発行する。
                let (_, index) = try streamFile.generateSequence()
                self.sequenceIndex = index
                self.sequenceNumberGenerator = SequenceNumberGenerator()
                let sequenceNumber = self.sequenceNumberGenerator.next()!
                try self.write(sequenceIndex: self.sequenceIndex, sequenceNumber: sequenceNumber, dataPointGroups: groups, dataSize: self.dataSize)
            }
            self.dataPointGroups = []
            self.dataSize = 0
        }
    }
    
    /// 計測終了時にバッファとして残っているデータポイントを保存します。
    func close() throws {
        if self.dataSize >= 0 {
            let groups = self.dataPointGroups
            if let sequenceNumber = self.sequenceNumberGenerator.next() {
                try self.write(sequenceIndex: self.sequenceIndex, sequenceNumber: sequenceNumber, dataPointGroups: groups, dataSize: self.dataSize)
            } else {
                // シーケンス番号が上限まで行った場合は新しいシーケンスを発行する。
                let (_, index) = try streamFile.generateSequence()
                self.sequenceIndex = index
                self.sequenceNumberGenerator = SequenceNumberGenerator()
                let sequenceNumber = self.sequenceNumberGenerator.next()!
                try self.write(sequenceIndex: self.sequenceIndex, sequenceNumber: sequenceNumber, dataPointGroups: groups, dataSize: self.dataSize)
            }
            self.dataPointGroups = []
            self.dataSize = 0
        }
    }
    
    private func write(sequenceIndex: Int, sequenceNumber: UInt32, dataPointGroups: [DataPointGroup], dataSize: UInt64) throws {
        var chunk = Pb_StoreDataChunk()
        chunk.sequenceNumber = sequenceNumber
        var pointCnt = 0
        var groups = [Pb_StoreDataPointGroup]()
        for g in dataPointGroups {
            var ng = Pb_StoreDataPointGroup()
            var dataId = Pb_StoreDataID()
            dataId.name = g.dataID.name
            dataId.type = g.dataID.type
            ng.dataID = dataId
            var nps = [Pb_StoreDataPoint]()
            for p in g.dataPoints {
                var np = Pb_StoreDataPoint()
                np.elapsedTime = p.elapsedTime.int64NS
                np.payload = p.payload
                nps.append(np)
                pointCnt += 1
            }
            ng.dataPoints = nps
            groups.append(ng)
        }
        chunk.dataPointGroups = groups
        try self.streamFile.appendChunk(sequenceIndex: sequenceIndex, chunk: chunk, dataSize: dataSize, dataPointCnt: pointCnt)
    }
}

fileprivate extension TimeInterval {
    var int64NS: Int64 {
        return Int64(self * 1000_000_000.0)
    }
}
