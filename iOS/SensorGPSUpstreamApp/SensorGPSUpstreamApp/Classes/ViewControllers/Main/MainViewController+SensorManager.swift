//
//  MainViewController+SensorManager.swift
//  SensorGPSUpstreamApp
//
//  Created by Ueno Masamitsu on 2020/09/18.
//  Copyright © 2020 aptpod, Inc. All rights reserved.
//

import UIKit
import CoreMotion
import iSCP

extension MainViewController {
    
    func setupSensorManager() {
        DispatchQueue.main.async {
            self.motionManager.deviceMotionUpdateInterval = 1 / Double(Config.SENSOR_SAMPLING_RATE)
            self.motionManager.startDeviceMotionUpdates(using: Config.SENSOR_USING_TYPE, to: OperationQueue.current!) { [weak self] (motion, error) in
                let rtcTime = MySystemClock.shared.rtcDate.timeIntervalSince1970
                guard let motion = motion else { return }
                //print("motionManager didUpdateMotionValues sampleTime: \(motion.timestamp)")
                self?.outputSensors(motion: motion)
                self?.sendSensors(motion: motion, rtcTime: rtcTime)
            }
        }
    }
    
    func outputSensors(motion: CMDeviceMotion) {
        DispatchQueue.global().async {
            let sensorValues = NSMutableString("■Sensors")
            if Config.SENSOR_IS_ENABLED_USER_ACCELERATION {
                sensorValues.append("\nAcceleration:\n")
                sensorValues.append("x: \(self.toMs2(motion.userAcceleration.x))\n")
                sensorValues.append("y: \(self.toMs2(motion.userAcceleration.y))\n")
                sensorValues.append("z: \(self.toMs2(motion.userAcceleration.z))")
            }
            if Config.SENSOR_IS_ENABLED_GRAVITY {
                sensorValues.append("\nGravity:\n")
                sensorValues.append("x: \(self.toMs2(motion.gravity.x))\n")
                sensorValues.append("y: \(self.toMs2(motion.gravity.y))\n")
                sensorValues.append("z: \(self.toMs2(motion.gravity.z))")
            }
            if Config.SENSOR_IS_ENABLED_ROTATION_RATE {
                sensorValues.append("\nRotationRate:\n")
                sensorValues.append("x: \(self.toDegrees(motion.rotationRate.x))\n")
                sensorValues.append("y: \(self.toDegrees(motion.rotationRate.y))\n")
                sensorValues.append("z: \(self.toDegrees(motion.rotationRate.z))")
            }
            if Config.SENSOR_IS_ENABLED_ATTITUDE {
                sensorValues.append("\nOrientationAngle:\n")
                sensorValues.append("yaw: \(self.toDegrees(motion.attitude.yaw))\n")
                sensorValues.append("pitch: \(self.toDegrees(motion.attitude.pitch))\n")
                sensorValues.append("roll: \(self.toDegrees(motion.attitude.roll))")
            }
            DispatchQueue.main.async {
                self.sensorValueLabel.text = String(sensorValues)
            }
        }
    }
    
    func disposeSensorManager() {
        if self.motionManager.isDeviceMotionActive {
            self.motionManager.stopDeviceMotionUpdates()
        }
    }
    
    func sendSensors(motion: CMDeviceMotion, rtcTime: TimeInterval) {
        guard self.isUpstreaming else { return }
        // 計測開始時間から経過時間を算出します。
        if self.motionSampleBaseTime < 0 {
            self.motionBaseTime = rtcTime
            self.motionSampleBaseTime = motion.timestamp
        }
        let elapsedTime = ((motion.timestamp - self.motionSampleBaseTime) + self.motionBaseTime) - self.baseTime
        guard elapsedTime >= 0 else {
            print("Elapsed time error. \(elapsedTime)")
            return
        }
        DispatchQueue.global().async {
            var dataPointGroups = [DataPointGroup]()
            var dataSize: UInt64 = 0
            if Config.SENSOR_IS_ENABLED_USER_ACCELERATION {
                // 事前に定義したデータIDとペイロードフォーマットでデータポイントを作成します。
                let dataID = Config.SENSOR_USER_ACCELERATION_DATA_ID
                let payload = Vector3DPayload(
                    x: self.toMs2(motion.userAcceleration.x),
                    y: self.toMs2(motion.userAcceleration.y),
                    z: self.toMs2(motion.userAcceleration.z)).encode()
                dataSize += UInt64(payload.count)
                let dataPointGroup = DataPointGroup(dataID: dataID, dataPoints: [DataPoint(elapsedTime: elapsedTime, payload: payload)])
                dataPointGroups.append(dataPointGroup)
            }
            if Config.SENSOR_IS_ENABLED_GRAVITY {
                // 送信するデータポイントを作成します。
                // 事前に定義したデータIDとペイロードフォーマットでデータポイントを作成します。
                let dataID = Config.SENSOR_GRAVITY_DATA_ID
                let payload = Vector3DPayload(
                    x: self.toMs2(motion.gravity.x),
                    y: self.toMs2(motion.gravity.y),
                    z: self.toMs2(motion.gravity.z)).encode()
                dataSize += UInt64(payload.count)
                let dataPointGroup = DataPointGroup(dataID: dataID, dataPoints: [DataPoint(elapsedTime: elapsedTime, payload: payload)])
                dataPointGroups.append(dataPointGroup)
            }
            if Config.SENSOR_IS_ENABLED_ROTATION_RATE {
                // 事前に定義したデータIDとペイロードフォーマットでデータポイントを作成します。
                let dataID = Config.SENSOR_ROTATION_RATE_DATA_ID
                let payload = Vector3DPayload(
                    x: self.toDegrees(motion.rotationRate.x),
                    y: self.toDegrees(motion.rotationRate.y),
                    z: self.toDegrees(motion.rotationRate.z)).encode()
                dataSize += UInt64(payload.count)
                let dataPointGroup = DataPointGroup(dataID: dataID, dataPoints: [DataPoint(elapsedTime: elapsedTime, payload: payload)])
                dataPointGroups.append(dataPointGroup)
            }
            if Config.SENSOR_IS_ENABLED_ATTITUDE {
                // 事前に定義したデータIDとペイロードフォーマットでデータポイントを作成します。
                let dataID = Config.SENSOR_ATTITUDE_DATA_ID
                let payload = Vector3DPayload(
                    x: self.toDegrees(motion.attitude.yaw),
                    y: self.toDegrees(motion.attitude.pitch),
                    z: self.toDegrees(motion.attitude.roll)).encode()
                dataSize += UInt64(payload.count)
                let dataPointGroup = DataPointGroup(dataID: dataID, dataPoints: [DataPoint(elapsedTime: elapsedTime, payload: payload)])
                dataPointGroups.append(dataPointGroup)
            }
            if !dataPointGroups.isEmpty {
                if let upstream = self.sensorUpstream {
                    // データポイントはグループとしてひとまとめにして送信可能です。
                    self.sendDataPoint(upstream, dataPointGroups: dataPointGroups)
                }
                else if let lostChunkManager = self.sensorLostChunkManager {
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
    
    // G -> m/s2
    func toMs2(_ g: Double) -> Double {
        let ret = g * 9.80665
        return ret
    }

    // radians/second -> degrees/second
    func toDegrees(_ radians: Double) -> Double {
        let ret = 180 / Double.pi * radians
        return ret
    }
}
