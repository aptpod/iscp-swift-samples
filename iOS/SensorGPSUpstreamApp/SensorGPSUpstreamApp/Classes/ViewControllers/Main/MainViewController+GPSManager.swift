//
//  MainViewController+GPSManager.swift
//  SensorGPSUpstreamApp
//
//  Created by Ueno Masamitsu on 2020/09/18.
//  Copyright © 2020 aptpod, Inc. All rights reserved.
//

import UIKit
import CoreLocation
import iSCP

extension MainViewController: CLLocationManagerDelegate {
    
    func setupGPSManager() {
        DispatchQueue.main.async {
            self.locationManager.desiredAccuracy = Config.GPS_LOCATION_ACCURACY
            self.locationManager.delegate = self
            if CLLocationManager.authorizationStatus() == .notDetermined || CLLocationManager.authorizationStatus() == .denied {
                self.locationManager.requestWhenInUseAuthorization()
            } else {
                self.locationManager.startUpdatingLocation()
                self.locationManager.startUpdatingHeading()
                self.updateGpsHeadingOrientaiton()
            }            
        }
    }
    
    func disposeGPSManager() {
        self.locationManager.stopUpdatingLocation()
        self.locationManager.stopUpdatingHeading()
        self.locationManager.delegate = self
    }
    
    func updateGpsHeadingOrientaiton() {
        switch self.view.interfaceOrientation {
        case .landscapeLeft:
            self.locationManager.headingOrientation = .landscapeRight
        case .landscapeRight:
            self.locationManager.headingOrientation = .landscapeLeft
        case .portrait:
            self.locationManager.headingOrientation = .portrait
        case .portraitUpsideDown:
            self.locationManager.headingOrientation = .portraitUpsideDown
        default: break
        }
    }
    
    //MARK:- CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("didChangeAuthorization \(status.rawValue) - CLLocationManager")
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation()
            manager.startUpdatingHeading()
            self.locationManager = manager
            self.updateGpsHeadingOrientaiton()
            break
        default: break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let rtcTime = MySystemClock.shared.rtcDate.timeIntervalSince1970
        if let location = locations.last {
            print("locationManager didUpdateLocations sampleTime: \(location.timestamp.timeIntervalSince1970) latitude: \(location.coordinate.latitude), longitude: \(location.coordinate.longitude) - CLLocationManager")
            self.sendLocation(location: location, rtcTime: rtcTime)
        }
    }
    
    func sendLocation(location: CLLocation, rtcTime: TimeInterval) {
        guard self.isUpstreaming else { return }
        // 計測開始時間から経過時間を算出します。
        if self.locationSampleBaseTime < 0 {
            self.locationBaseTime = rtcTime
            self.locationSampleBaseTime = location.timestamp.timeIntervalSince1970
        }
        let elapsedTime = ((location.timestamp.timeIntervalSince1970 - self.locationSampleBaseTime) + self.locationBaseTime) - self.baseTime
        guard elapsedTime >= 0 else {
            print("Elapsed time error. \(elapsedTime)")
            return
        }
        DispatchQueue.global().async {
            var dataPointGroups = [DataPointGroup]()
            var dataSize: UInt64 = 0
            if Config.GPS_IS_ENABLED_COORDINATE {
                // 事前に定義したデータIDとペイロードフォーマットでデータポイントを作成します。
                let dataID = Config.GPS_COORDINATE_DATA_ID
                let payload = Vector2DPayload(
                    x: location.coordinate.latitude,
                    y: location.coordinate.longitude).encode()
                dataSize += UInt64(payload.count)
                let dataPointGroup = DataPointGroup(dataID: dataID, dataPoints: [DataPoint(elapsedTime: elapsedTime, payload: payload)])
                dataPointGroups.append(dataPointGroup)
            }
            if !dataPointGroups.isEmpty {
                if let upstream = self.gpsUpstream {
                    // データポイントはグループとしてひとまとめにして送信可能です。
                    self.sendDataPoint(upstream, dataPointGroups: dataPointGroups)
                }
                else if let lostChunkManager = self.gpsLostChunkManager {
                    do {
                        // オフライン計測の場合はデータを保存します。
                        try lostChunkManager.append(dataPointGroups: dataPointGroups, dataSize: dataSize)
                    } catch {
                        print("Failed to save data points to local storage. \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        let rtcTime = MySystemClock.shared.rtcDate.timeIntervalSince1970
        guard newHeading.headingAccuracy >= 0 else { return }
        print("locationManager didUpdateHeading sampleTime: \(newHeading.timestamp.timeIntervalSince1970) trueHeading: \(newHeading.trueHeading) - CLLocationManager")
        self.sendHeading(trueHeading: newHeading.trueHeading, rtcTime: rtcTime, sampleTime: newHeading.timestamp.timeIntervalSince1970)
    }
    
    func sendHeading(trueHeading: Double, rtcTime: TimeInterval, sampleTime: TimeInterval) {
        guard self.isUpstreaming else { return }
        // 計測開始時間から経過時間を算出します。
        if self.headSampleBaseTime < 0 {
            self.headBaseTime = rtcTime
            self.headSampleBaseTime = sampleTime
        }
        let elapsedTime = ((sampleTime - self.headSampleBaseTime) + self.headBaseTime) - self.baseTime
        guard elapsedTime >= 0 else {
            print("Elapsed time error. \(elapsedTime)")
            return
        }
        DispatchQueue.global().async {
            var dataPointGroups = [DataPointGroup]()
            var dataSize: UInt64 = 0
            if Config.GPS_IS_ENABLED_TRUE_HEADING {
                // 事前に定義したデータIDとペイロードフォーマットでデータポイントを作成します。
                let dataID = Config.GPS_TRUE_HEADING_DATA_ID
                let payload = Float64Payload(data: trueHeading).encode()
                dataSize += UInt64(payload.count)
                let dataPointGroup = DataPointGroup(dataID: dataID, dataPoints: [DataPoint(elapsedTime: elapsedTime, payload: payload)])
                dataPointGroups.append(dataPointGroup)
            }
            if !dataPointGroups.isEmpty {
                if let upstream = self.gpsUpstream {
                    // データポイントはグループとしてひとまとめにして送信可能です。
                    self.sendDataPoint(upstream, dataPointGroups: dataPointGroups)
                }
                else if let lostChunkManager = self.gpsLostChunkManager {
                    do {
                        // オフライン計測の場合はデータを保存します。
                        try lostChunkManager.append(dataPointGroups: dataPointGroups, dataSize: dataSize)
                    } catch {
                        print("Failed to save data points to local storage. \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}
