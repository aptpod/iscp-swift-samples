//
//  MainViewController+Downstream.swift
//  SensorGPSDownstreamApp
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
        
        // for Sensor Stream
        group.enter()
        connection.openDownstream(
            downstreamFilters: [
                DownstreamFilter(sourceNodeID: nodeID,
                                 dataFilters: [
                                    Config.SENSOR_USER_ACCELERATION_DATA_FILTER, Config.SENSOR_GRAVITY_DATA_FILTER, Config.SENSOR_ROTATION_RATE_DATA_FILTER, Config.SENSOR_ATTITUDE_DATA_FILTER
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
                self?.sensorDownstreamBaseTime = Date().timeIntervalSince1970
                self?.sensorDownstream = downstream
                self?.downstreams.append(downstream)
                downstream.delegate = self
        }
        
        // for GPS Stream
        group.enter()
        connection.openDownstream(
            downstreamFilters: [
                DownstreamFilter(sourceNodeID: nodeID,
                                 dataFilters: [
                                    Config.GPS_COORDINATE_DATA_FILTER, Config.GPS_TRUE_HEADING_DATA_FILTER
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
                self?.gpsDownstreamBaseTime = Date().timeIntervalSince1970
                self?.gpsDownstream = downstream
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
        guard self.sensorDownstream != nil || self.gpsDownstream != nil else {
            return
        }
        print("stopDownstream()")
        self.sensorDownstream = nil
        self.gpsDownstream = nil
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
        if self.sensorDownstream == downstream {
            for g in message.dataPointGroups {
                print("downstream[\(downstream.id)] dataID name: \(g.dataID.name), type: \(g.dataID.type), \(g.dataPoints.count) data points - DownstreamDelegate")
                if g.dataID.name == Config.SENSOR_USER_ACCELERATION_DATA_FILTER.name && g.dataID.type == Config.SENSOR_USER_ACCELERATION_DATA_FILTER.type {
                    for i in 0..<g.dataPoints.count {
                        let d = g.dataPoints[i]
                        // ペイロードをフォーマットに添ってデコードします。
                        let (model, error) = Vector3DPayload.decode(payload: d.payload)
                        guard let model = model else {
                            print("Failed to decode payload. \(error?.localizedDescription ?? "")")
                            return
                        }
                        self.sensorUserAcceleration = model
                    }
                }
                else if g.dataID.name == Config.SENSOR_GRAVITY_DATA_FILTER.name && g.dataID.type == Config.SENSOR_GRAVITY_DATA_FILTER.type {
                    for i in 0..<g.dataPoints.count {
                        let d = g.dataPoints[i]
                        // ペイロードをフォーマットに添ってデコードします。
                        let (model, error) = Vector3DPayload.decode(payload: d.payload)
                        guard let model = model else {
                            print("Failed to decode payload. \(error?.localizedDescription ?? "")")
                            return
                        }
                        self.sensorGravity = model
                    }
                }
                else if g.dataID.name == Config.SENSOR_ROTATION_RATE_DATA_FILTER.name && g.dataID.type == Config.SENSOR_ROTATION_RATE_DATA_FILTER.type {
                    for i in 0..<g.dataPoints.count {
                        let d = g.dataPoints[i]
                        // ペイロードをフォーマットに添ってデコードします。
                        let (model, error) = Vector3DPayload.decode(payload: d.payload)
                        guard let model = model else {
                            print("Failed to decode payload. \(error?.localizedDescription ?? "")")
                            return
                        }
                        self.sensorRotationRate = model
                    }
                }
                else if g.dataID.name == Config.SENSOR_ATTITUDE_DATA_FILTER.name && g.dataID.type == Config.SENSOR_ATTITUDE_DATA_FILTER.type {
                    for i in 0..<g.dataPoints.count {
                        let d = g.dataPoints[i]
                        // ペイロードをフォーマットに添ってデコードします。
                        let (model, error) = Vector3DPayload.decode(payload: d.payload)
                        guard let model = model else {
                            print("Failed to decode payload. \(error?.localizedDescription ?? "")")
                            return
                        }
                        self.sensorAttitude = model
                    }
                }
            }
        }
        else if self.gpsDownstream == downstream {
            for g in message.dataPointGroups {
                print("downstream[\(downstream.id)] dataID name: \(g.dataID.name), type: \(g.dataID.type), \(g.dataPoints.count) data points - DownstreamDelegate")
                if g.dataID.name == Config.GPS_COORDINATE_DATA_FILTER.name && g.dataID.type == Config.GPS_COORDINATE_DATA_FILTER.type {
                    for i in 0..<g.dataPoints.count {
                        let d = g.dataPoints[i]
                        // ペイロードをフォーマットに添ってデコードします。
                        let (model, error) = Vector2DPayload.decode(payload: d.payload)
                        guard let model = model else {
                            print("Failed to decode payload. \(error?.localizedDescription ?? "")")
                            return
                        }
                        self.setCoordinate(model)
                    }
                }
                else if g.dataID.name == Config.GPS_TRUE_HEADING_DATA_FILTER.name && g.dataID.type == Config.GPS_TRUE_HEADING_DATA_FILTER.type {
                    for i in 0..<g.dataPoints.count {
                        let d = g.dataPoints[i]
                        // ペイロードをフォーマットに添ってデコードします。
                        let (model, error) = Float64Payload.decode(payload: d.payload)
                        guard let model = model else {
                            print("Failed to decode payload. \(error?.localizedDescription ?? "")")
                            return
                        }
                        self.setTrueHeading(model)
                    }
                }
            }
        }
    }
    
    func didReceiveMetadata(downstream: Downstream, message: DownstreamMetadata) {
        switch message.metadata {
        case .baseTime(let baseTime):
            print("didReceiveMetadata baseTime name: \(baseTime.name), baseTime: \(baseTime.baseTime), elapsedTime: \(baseTime.elapsedTime) - DownstreamDelegate")
            if self.sensorDownstream == downstream {
                self.sensorDownstreamBaseTime = baseTime.baseTime
            }
            else if self.gpsDownstream == downstream {
                self.gpsDownstreamBaseTime = baseTime.baseTime
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
    }
    
    func didResume(downstream: Downstream) {
        print("didResume(downstream: \(downstream.id)) - DownstreamDelegate")
    }
}
