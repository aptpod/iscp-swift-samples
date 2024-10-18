//
//  MainViewController+Downstream.swift
//  VideoDownstreamApp
//
//  Created by uenomasamitsu on 2023/10/27.
//  Copyright © 2023 aptpod, Inc. All rights reserved.
//

import Foundation
import iSCP

extension MainViewController: DownstreamDelegate {
    
    func startDownstream(completion: ((Error?)->())? = nil) {
        guard let connection = self.connection else {
            completion?(NSError(domain: "Offline.", code: #line))
            return
        }
        
        guard let nodeID = self.app.targetEdge?.uuid, !nodeID.isEmpty else {
            completion?(NSError(domain: "Failed to get node id.", code: #line))
            return
        }
        self.downstreamLock.lock()
        let group = DispatchGroup()
        var openDownstreamError: Error?
                
        // for Video(JPEG) Stream
        group.enter()
        connection.openDownstream(
            downstreamFilters: [
                DownstreamFilter(sourceNodeID: nodeID, 
                                 dataFilters: [
                                    Config.JPEG_DATA_FILTER 
                                 ])
            ],
            expiryInterval: Config.STREAM_EXPIRY_INTERVAL) { [weak self] downstream, error in
                defer { group.leave() }
                guard let downstream = downstream, error == nil else {
                    print("Open downstream failed. \(error?.localizedDescription ?? "")")
                    if error != nil {
                        openDownstreamError = error
                    }
                    return
                }
                self?.videoDownstreamBaseTime = Date().timeIntervalSince1970
                self?.videoDownstream = downstream
                self?.downstreams.append(downstream)
                downstream.delegate = self
        }
        
        group.notify(queue: .global()) { [weak self] in
            defer {
                self?.downstreamLock.unlock()
            }
            completion?(openDownstreamError)
        }
    }
    
    func stopDownstream() {
        guard self.videoDownstream != nil else {
            return
        }
        print("stopDownstream()")
        self.videoDownstream = nil
        self.downstreamLock.lock()
        let downstreams = self.downstreams
        self.downstreams = [Downstream]()
        self.downstreamLock.unlock()
        DispatchQueue.global().async {
            for d in downstreams {
                d.close { error in
                    if error != nil {
                        print("Failed to close downstream(ID: \(d.id)). \(error!.localizedDescription)")
                        return
                    }
                    print("Success to close downstream(ID: \(d.id))")
                }
            }
        }
    }
    
    //MARK: - DownstreamDelegate
    func didReceiveChunk(downstream: Downstream, message: DownstreamChunk) {
        NSLog("didReceiveChunk downstream[\(downstream.id)], \(message.dataPointGroups.count) groups. - DownstreamDelegate")
        if self.videoDownstream == downstream {
            for g in message.dataPointGroups {
                print("downstream[\(downstream.id)] dataID name: \(g.dataID.name), type: \(g.dataID.type), \(g.dataPoints.count) data points - DownstreamDelegate")
                if g.dataID.name == Config.JPEG_DATA_FILTER.name && g.dataID.type == Config.JPEG_DATA_FILTER.type {
                    for i in 0..<g.dataPoints.count {
                        let d = g.dataPoints[i]
                        // ペイロードをフォーマットに添ってデコードします。
                        let (model, error) = JPEGPayload.decode(payload: d.payload)
                        guard let model = model else {
                            print("Failed to decode payload. \(error?.localizedDescription ?? "")")
                            return
                        }
                        self.decodeJPEG(jpeg: model.data, timestamp: self.videoDownstreamBaseTime + d.elapsedTime)
                    }
                }
            }
        }
    }
    
    func didReceiveMetadata(downstream: Downstream, message: DownstreamMetadata) {
        switch message.metadata {
        case .baseTime(let baseTime):
            print("didReceiveMetadata baseTime name: \(baseTime.name), baseTime: \(baseTime.baseTime), elapsedTime: \(baseTime.elapsedTime) - DownstreamDelegate")
            if self.videoDownstream == downstream {
                self.videoDownstreamBaseTime = baseTime.baseTime
            }
        case .upstreamOpen(let upstreamOpen):
            print("didReceiveMetadata upstreamOpen streamID: \(upstreamOpen.streamID) - DownstreamDelegate")
        case .upstreamResume(let upstreamResume):
            print("didReceiveMetadata upstreamResume streamID: \(upstreamResume.streamID) - DownstreamDelegate")
        case .upstreamNormalClose(let upstreamNormalClose):
            print("didReceiveMetadata upstreamNormalClose streamID: \(upstreamNormalClose.streamID), finalSequenceNumber: \(upstreamNormalClose.finalSequenceNumber), totalDataPoints: \(upstreamNormalClose.totalDataPoints) - DownstreamDelegate")
        case .upstreamAbnormalClose(let upstreamAbnormalClose):
            print("didReceiveMetadata upstreamAbnormalClose streamID: \(upstreamAbnormalClose.streamID) - DownstreamDelegate")
        default:
            print("didReceiveMetadata \(message.metadata!) - DownstreamDelegate")
            break
        }
    }
    
    func didFailWithError(downstream: Downstream, error: Error) {
        print("didFailWithError(downstream: \(downstream.id), error: \(error.localizedDescription)) - DownstreamDelegate")
    }
    
    func didCloseWithError(downstream: Downstream, error: Error) {
        print("didCloseWithError(downstream: \(downstream.id), error: \(error.localizedDescription)) - DownstreamDelegate")
        self.connection?.reopenDownstream(downstream, completion: { [weak self] newStream, error in
            guard let self = self else { return }
            guard let newStream = newStream, error == nil else {
                print("reopenDownstream failed. \(error?.localizedDescription ?? "")")
                return
            }
            defer {
                self.downstreamLock.unlock()
            }
            self.downstreamLock.lock()
            if let index = self.downstreams.firstIndex(of: downstream) {
                self.downstreams.remove(at: index)
            }
            self.downstreams.append(newStream)
            if self.videoDownstream == downstream {
                self.videoDownstream = newStream
                print("reopen video downstream successfull. downstream[\(newStream.id)]")
            }
            newStream.delegate = self
            DispatchQueue.global().async {
                // 不要になったストリームを閉じる(解放する)
                downstream.close()
            }
        })
    }
    
    func didResume(downstream: Downstream) {
        print("didResume(downstream: \(downstream.id)) - DownstreamDelegate")
    }
}
