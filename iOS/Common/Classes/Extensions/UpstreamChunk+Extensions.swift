//
//  UpstreamChunk+Extensions.swift
//  VideoUpstreamApp
//
//  Created by uenomasamitsu on 2023/10/26.
//  Copyright © 2023 aptpod, Inc. All rights reserved.
//

import Foundation
import iSCP

extension UpstreamChunk {
    
    func convertStoreData() -> (Pb_StoreDataChunk, Int) {
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
        return (chunk, pointCnt)
    }
}

fileprivate extension TimeInterval {
    var int64NS: Int64 {
        return Int64(self * 1000_000_000.0)
    }
}
