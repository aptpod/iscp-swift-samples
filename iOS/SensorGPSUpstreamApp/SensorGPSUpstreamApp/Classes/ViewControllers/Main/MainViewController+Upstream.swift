//
//  MainViewController+Upstream.swift
//  SensorGPSUpstreamApp
//
//  Created by uenomasamitsu on 2023/10/26.
//  Copyright © 2023 aptpod, Inc. All rights reserved.
//

import Foundation
import iSCP

extension MainViewController: UpstreamDelegate {
    
    public func openUpstream(completion: ((Error?)->())? = nil) {
        print("openUpstream() - MainViewController")
        guard let connection = self.connection else {
            completion?(NSError(domain: "Offline.", code: #line))
            return
        }
        let baseTime = MySystemClock.shared.rtcDate.timeIntervalSince1970
        guard Config.UPSTREAM_IS_SAVE_TO_SERVER else {
            self.invokeOpenUpstream(connection: connection, baseTime: baseTime, completion: completion)
            return
        }
        do {
            self.measurementFile = try IntdashMeasurementFileManager.generateFile(parentPath: Config.INTDASH_DATA_FILE_PARENT_PATH, serverURL: self.api.serverURL, userID: self.app.signInUserID, baseTime: baseTime, nodeID: connection.nodeID)
            try self.measurementFile?.setProjectID(self.api.projectID)
        } catch {
            print("Failed to save data to local storage. \(error.localizedDescription)")
            AlertDialogView.showAlert(viewController: self, title: "Data Storage Error", message: "Failed to save data to local storage.")
        }
        self.api.requestCreateMeasurement(basetime: baseTime, basetimeType: .edgeRtc, edgeUuid: connection.nodeID) { [weak self] measID, error in
            guard error == nil, let measID = measID else {
                print("requestCreateMeasurement error. \(error?.localizedDescription ?? "")")
                completion?(error)
                return
            }
            print("requestCreateMeasurement successfully. measID: \(measID)")
            do {
                try self?.measurementFile?.setMeasurementID(measID)
            } catch {
                print("Measurement file error. \(error.localizedDescription)")
                completion?(error)
                return
            }
            self?.invokeOpenUpstream(connection: connection, baseTime: baseTime, measurementID: measID, completion: completion)
        }
    }
    
    func invokeOpenUpstream(connection: Connection, baseTime: TimeInterval, measurementID: String = "", completion: ((Error?)->())? = nil) {
        self.upstreamLock.lock()
        self.baseTime = baseTime
        self.resetSampleBaseTimes()
        self.measurementID = measurementID
        self.generatedSequences = 0
        self.receivedSequences = 0
        let group = DispatchGroup()
        var openUpstreamError: Error?
        
        // for Sensor Stream
        group.enter()        
        connection.openUpstream(sessionID: measurementID, expiryInterval: Config.STREAM_EXPIRY_INTERVAL, persist: Config.SENSOR_IS_SAVE_TO_SERVER, flushPolicy: Config.UPSTREAM_SENSOR_DATA_POINTS_FLUSH_POLICY, completion: { [weak self] (upstream, error) in
            defer { group.leave() }
            guard let upstream = upstream, error == nil else {
                print("Open sensor upstream failed. \(error?.localizedDescription ?? "")")
                if error != nil {
                    openUpstreamError = error
                }
                return
            }
            print("Successfully open sensor upstream(id: \(upstream.id), serverTime: \(Date(timeIntervalSince1970: upstream.serverTime))")
            if Config.SENSOR_IS_SAVE_TO_SERVER, let measFile = self?.measurementFile {
                do {
                    self?.sensorFile = measFile.genereateStreamFile(fileName: Config.SENSOR_FILE_NAME)
                    let (sequenceFile, index) = try self!.sensorFile!.generateSequence()
                    self?.sensorSequenceIndex = index
                    try sequenceFile.setSequenceID(upstream.id.uuidString)
                }
                catch {
                    print("Measurement file error. \(error.localizedDescription)")
                    openUpstreamError = error
                    upstream.close()
                    return
                }
            }
            upstream.delegate = self
            self?.sensorUpstream = upstream
            self?.upstreams.append(upstream)
            self?.usedUpstreams.append(upstream)
        })
                
        // for GPS Stream
        group.enter()
        connection.openUpstream(sessionID: measurementID, expiryInterval: Config.STREAM_EXPIRY_INTERVAL, persist: Config.GPS_IS_SAVE_TO_SERVER, flushPolicy: Config.UPSTREAM_GPS_DATA_POINTS_FLUSH_POLICY, completion: { [weak self] (upstream, error) in
            defer { group.leave() }
            guard let upstream = upstream, error == nil else {
                print("Open gps upstream failed. \(error?.localizedDescription ?? "")")
                if error != nil {
                    openUpstreamError = error
                }
                return
            }
            print("Successfully open gps upstream(id: \(upstream.id), serverTime: \(Date(timeIntervalSince1970: upstream.serverTime))")
            if Config.GPS_IS_SAVE_TO_SERVER, let measFile = self?.measurementFile {
                do {
                    self?.gpsFile = measFile.genereateStreamFile(fileName: Config.GPS_FILE_NAME)
                    let (sequenceFile, index) = try self!.sensorFile!.generateSequence()
                    self?.gpsSequenceIndex = index
                    try sequenceFile.setSequenceID(upstream.id.uuidString)
                }
                catch {
                    print("Measurement file error. \(error.localizedDescription)")
                    openUpstreamError = error
                    upstream.close()
                    return
                }
            }
            upstream.delegate = self
            self?.gpsUpstream = upstream
            self?.upstreams.append(upstream)
            self?.usedUpstreams.append(upstream)
        })
        
        group.notify(queue: .global()) { [weak self] in
            defer {
                self?.upstreamLock.unlock()
                completion?(openUpstreamError)
            }
            guard openUpstreamError == nil else {
                return
            }
            // Send first data
            self?.sendBaseTime(measurementID: measurementID, name: "edge_rtc", priority: 20, baseTime: baseTime)
            self?.syncNTP(baseTime: baseTime, measurementID: measurementID)
        }
    }
    
    func syncNTP(baseTime: TimeInterval, measurementID: String) {
        DispatchQueue.global().async {
            MySystemClock.shared.updateNTPTime { (error) in
                guard error == nil else {
                    print("Failed to get offset between ntp and system clock. \(error!.localizedDescription)")
                    return
                }
                let elapsedRtc = MySystemClock.shared.rtcDate.timeIntervalSince1970 - baseTime
                let ntpTime = MySystemClock.shared.ntpDate.timeIntervalSince1970 - elapsedRtc
                if Config.UPSTREAM_IS_SAVE_TO_SERVER, let measFile = self.measurementFile {
                    do {
                        try measFile.setNTPBaseTime(ntpTime)
                    }
                    catch {
                        print("Measurement file error. \(error.localizedDescription)")
                    }
                }
                self.sendBaseTime(measurementID: measurementID, name: "ntp", priority: 40, baseTime: ntpTime)
            }
        }
    }
    
    func sendBaseTime(measurementID: String, name: String, priority: UInt32, baseTime: TimeInterval) {
        let metadata = BaseTime(sessionID: measurementID, name: name, priority: priority, elapsedTime: 0, baseTime: baseTime)
        self.connection?.sendBaseTime(baseTime: metadata, persist: Config.UPSTREAM_IS_SAVE_TO_SERVER) { error in
            if let err = error {
                print("Failed to send baseTime: \(err.localizedDescription)")
                return
            }
            print("Success to send baseTime.")
        }
    }
    
    public func closeUpstream() {
        guard self.sensorUpstream != nil || self.gpsUpstream != nil else {
            self.stopOfflineMeasurement()
            return
        }
        print("closeUpstream() - MainViewController")
        self.sensorUpstream = nil
        self.gpsUpstream = nil
        self.upstreamLock.lock()
        let upstreams = self.upstreams
        let usedUpstrems = self.usedUpstreams
        let measurementID = self.measurementID
        self.upstreams = [Upstream]()
        self.usedUpstreams = [Upstream]()
        self.failedSendDataPoints.removeAll()
        self.upstreamLock.unlock()
        DispatchQueue.global().async {
            var group = DispatchGroup()
            for i in 0..<upstreams.count {
                let u = upstreams[i]
                let closeSession = i == (upstreams.count-1)
                group.enter()
                u.close(closeSession: closeSession) { error in
                    defer { group.leave() }
                    if error != nil {
                        print("Failed to close upstream(ID: \(u.id)). \(error!.localizedDescription)")
                        return
                    }
                    print("Scucess to close upstream(ID: \(u.id))")
                }
            }
            group.notify(queue: .global()) { [weak self] in
                self?.upstreamLock.lock()
                let generatedSequences = self!.generatedSequences
                let receivedSequences = self!.receivedSequences
                self?.upstreamLock.unlock()
                if !measurementID.isEmpty {
                    if generatedSequences == receivedSequences {
                        print("requestCompleteMeasurement measurementUuid: \(measurementID)")
                        self?.api.requestCompleteMeasurement(measurementUuid: measurementID) { error in
                            guard error == nil else {
                                print("requestCompleteMeasurement error. \(error?.localizedDescription ?? "")")
                                return
                            }
                            print("requestCompleteMeasurement successfully.")
                        }
                    } else {
                        print("dropped measurement data. measurementID: \(measurementID), generatedSequences: \(generatedSequences), receivedSequences: \(receivedSequences)")
                        group = DispatchGroup()
                        for u in usedUpstrems {
                            group.enter()
                            let state = u.getState()
                            let sequenceUuid = u.id.uuidString
                            let expectedDataPoints = state.totalDataPoints
                            let finalSequenceNumber = state.lastIssuedSequenceNumber
                            print("requestUpdateMeasurementSequence sequenceUuid: \(sequenceUuid), measurementUuid: \(measurementID), expectedDataPoints: \(expectedDataPoints), finalSequenceNumber: \(finalSequenceNumber)")
                            self?.api.requestUpdateMeasurementSequence(sequenceUuid: sequenceUuid, measurementUuid: measurementID, expectedDataPoints: Int(expectedDataPoints), finalSequenceNumber: Int(finalSequenceNumber)) { error in
                                defer { group.leave() }
                                guard error == nil else {
                                    print("requestUpdateMeasurementSequence error. \(error?.localizedDescription ?? "") streamId: \(u.id), expectedDataPoints: \(expectedDataPoints), finalSequenceNumber: \(finalSequenceNumber)")
                                    return
                                }
                                print("requestUpdateMeasurementSequence successfully. streamId: \(u.id), expectedDataPoints: \(expectedDataPoints), finalSequenceNumber: \(finalSequenceNumber)")
                            }
                        }
                        group.notify(queue: .global()) {
                            print("requestEndMeasurement measurementUuid: \(measurementID)")
                            self?.api.requestEndMeasurement(measurementUuid: measurementID) { error in
                                guard error == nil else {
                                    print("requestEndMeasurement error. \(error?.localizedDescription ?? "")")
                                    return
                                }
                                print("requestEndMeasurement successfully.")
                            }
                        }
                    }
                }
            }
        }
    }
    
    func sendDataPoint(_ upstream: Upstream, dataID: DataID, dataPoint: DataPoint) {
        if let err = upstream.writeDataPoint(dataID: dataID, dataPoint: dataPoint) {
            print("Failed to send upstream[\(upstream.id)] data points. \(err.localizedDescription)")
            var buffer: [DataPointGroup] = []
            if self.failedSendDataPoints.keys.contains(upstream.id) {
                buffer = self.failedSendDataPoints[upstream.id] ?? []
            }
            buffer.append(DataPointGroup(dataID: dataID, dataPoints: [dataPoint]))
            self.failedSendDataPoints[upstream.id] = buffer
            return
        }
    }
    
    func sendDataPoint(_ upstream: Upstream, dataPointGroups: [DataPointGroup]) {
        if let err = upstream.writeDataPoints(dataPointGroups: dataPointGroups) {
            print("Failed to send upstream[\(upstream.id)] data points. \(err.localizedDescription)")
            var buffer: [DataPointGroup] = []
            if self.failedSendDataPoints.keys.contains(upstream.id) {
                buffer = self.failedSendDataPoints[upstream.id] ?? []
            }
            buffer.append(contentsOf: dataPointGroups)
            self.failedSendDataPoints[upstream.id] = buffer
            return
        }
    }
    
    //MARK: - UpstreamDelegate
    func didGenerateChunk(upstream: iSCP.Upstream, message: iSCP.UpstreamChunk) {
        print("didGenerateChunk(streamId: \(upstream.id), sequenceNumber: \(message.sequenceNumber), dataPointCount: \(message.dataPointCount), payloadSize: \(message.payloadSize)) - UpstreamDelegate")
        if upstream == self.sensorUpstream, upstream.persist {
            // データ保存
            let (storeDataChunk, dataPointCnt) = message.convertStoreData()
            do {
                try self.sensorFile?.appendChunk(sequenceIndex: self.sensorSequenceIndex, chunk: storeDataChunk, dataSize: message.payloadSize, dataPointCnt: dataPointCnt)
            } catch {
                print("Failed to save data points to local storage. \(error.localizedDescription)")
            }
        } else if upstream == self.gpsUpstream, upstream.persist {
            // データ保存
            let (storeDataChunk, dataPointCnt) = message.convertStoreData()
            do {
                try self.gpsFile?.appendChunk(sequenceIndex: self.gpsSequenceIndex, chunk: storeDataChunk, dataSize: message.payloadSize, dataPointCnt: dataPointCnt)
            } catch {
                print("Failed to save data points to local storage. \(error.localizedDescription)")
            }
        }
    }
    
    func didReceiveAck(upstream: Upstream, message: UpstreamChunkAck) {
        print("didReceiveAck(streamId: \(upstream.id), sequenceNumber: \(message.sequenceNumber), resultCode: \(message.resultCode), resultString: \(message.resultString)) - UpstreamDelegate")
        if upstream == self.sensorUpstream, upstream.persist {
            // 欠損情報削除
            self.sensorFile?.removeChunk(sequenceIndex: self.sensorSequenceIndex, sequenceNumber: message.sequenceNumber)
        } else if upstream == self.gpsUpstream, upstream.persist {
            // 欠損情報削除
            self.gpsFile?.removeChunk(sequenceIndex: self.gpsSequenceIndex, sequenceNumber: message.sequenceNumber)
        }
    }
    
    func didFailWithError(upstream: Upstream, error: Error) {
        print("didFailWithError(upstream: \(upstream.id), error: \(error.localizedDescription)) - UpstreamDelegate")
    }
    
    func didCloseWithError(upstream: Upstream, error: Error) {
        print("didCloseWithError(upstream: \(upstream.id), error: \(error.localizedDescription)) - UpstreamDelegate")
        self.connection?.reopenUpstream(upstream, handoverDataPoints: true, completion: { [weak self] newStream, error in
            guard let self = self else { return }
            guard let newStream = newStream, error == nil else {
                print("reopenUpstream failed. \(error?.localizedDescription ?? "")")
                return
            }
            defer {
                self.upstreamLock.unlock()
            }
            self.upstreamLock.lock()
            var sequence: IntdashSequenceFile?
            if self.sensorUpstream == upstream {
                self.sensorUpstream = newStream
                if upstream.persist, let file = self.sensorFile {
                    do {
                        let (s, i) = try file.generateSequence()
                        self.sensorSequenceIndex = i
                        sequence = s
                    } catch {
                        print("Failed to save data to local storage. \(error.localizedDescription)")
                        AlertDialogView.showAlert(viewController: self, title: "Data Storage Error", message: "Failed to save data to local storage.")
                    }
                }
            } else if self.gpsUpstream == upstream {
                self.gpsUpstream = newStream
                if upstream.persist, let file = self.gpsFile {
                    do {
                        let (s, i) = try file.generateSequence()
                        self.gpsSequenceIndex = i
                        sequence = s
                    } catch {
                        print("Failed to save data to local storage. \(error.localizedDescription)")
                        AlertDialogView.showAlert(viewController: self, title: "Data Storage Error", message: "Failed to save data to local storage.")
                    }
                }
            }
            if let index = self.upstreams.firstIndex(of: upstream) {
                self.upstreams.remove(at: index)
            } else {
                return
            }
            self.upstreams.append(newStream)
            self.usedUpstreams.append(newStream)
            newStream.delegate = self
            // 未送信のデータを持っていれば送信する
            if var dataPointGroups = self.failedSendDataPoints[upstream.id] {
                self.sendDataPoint(newStream, dataPointGroups: dataPointGroups)
                dataPointGroups.removeAll()
            }
            print("reopenUpstream successfull. new upstream[\(newStream.id)]")
            DispatchQueue.global().async {
                do {
                    try sequence?.setSequenceID(newStream.id.uuidString)
                } catch {
                    print("Measurement file error. \(error.localizedDescription)")
                }
                // 不要になったストリームを閉じる(解放する)
                upstream.close()
            }
        })
    }
    
    func didResume(upstream: Upstream) {
        print("didResume(upstream: \(upstream.id)) - UpstreamDelegate")
    }
}
