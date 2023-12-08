//
//  MainViewController+ViewEvents.swift
//  SensorGPSDownstreamApp
//
//  Created by Ueno Masamitsu on 2020/09/23.
//  Copyright © 2020 aptpod, Inc. All rights reserved.
//

import UIKit

extension MainViewController {
    
    func setupViewEvents() {
        self.edgeNameLabel.text = self.app.targetEdge?.name
        self.streamControlBtn.addTarget(self, action: #selector(streamControlBtnPushed(_:)), for: .touchUpInside)
        self.currentTimeFormat = DateFormatter()
        self.currentTimeFormat.dateFormat = Config.CURRENT_TIME_FORMAT_STRING
    }
    
    @IBAction func streamControlBtnPushed(_ sender: Any) {
        print("streamControlBtnPushed")
        self.startPlaying()
    }
    
    func updateStreamControlBtn() {
        DispatchQueue.main.async {
            if self.isDownstreaming {
                self.streamControlBtn.setTitle("STOP DOWNSTREAM", for: .normal)
                self.streamControlBtn.setTitleColor(Config.BUTTON_ACTIVE_TEXT_COLOR, for: .normal)
                self.startCurrentTimeCheckTimer()
            } else {
                self.streamControlBtn.setTitle("START DOWNSTREAM", for: .normal)
                self.streamControlBtn.setTitleColor(Config.BUTTON_DEACTIVE_TEXT_COLOR, for: .normal)
                self.stopCurrentTimeCheckTimer()
            }
        }
    }
    
    func startCurrentTimeCheckTimer() {
        guard self.displayLink == nil else { return }
        self.displayLink = CADisplayLink(target: self, selector: #selector(willRefreshDisplay(_:)))
        self.displayLink?.preferredFramesPerSecond = Config.CURRENT_TIME_REFRESH_RATE
        self.displayLink?.add(to: .current, forMode: .common)
    }
    
    @objc func willRefreshDisplay(_ displayLink: CADisplayLink) {
        let now = Date()
        self.currentTimeLabel.text = self.currentTimeFormat.string(from: now)
        
        self.sensorDataLock.lock()
        let sensorValues = NSMutableString("■Sensors")
        if let sensor = self.sensorUserAcceleration {
            sensorValues.append("\nAcceleration:\n")
            sensorValues.append("x: \(sensor.x)\n")
            sensorValues.append("y: \(sensor.y)\n")
            sensorValues.append("z: \(sensor.z)")
        }
        if let sensor = self.sensorGravity {
            sensorValues.append("\nGravity:\n")
            sensorValues.append("x: \(sensor.x)\n")
            sensorValues.append("y: \(sensor.y)\n")
            sensorValues.append("z: \(sensor.z)")
        }
        if let sensor = self.sensorRotationRate {
            sensorValues.append("\nRotationRate:\n")
            sensorValues.append("x: \(sensor.x)\n")
            sensorValues.append("y: \(sensor.y)\n")
            sensorValues.append("z: \(sensor.z)")
        }
        if let sensor = self.sensorAttitude {
            sensorValues.append("\nOrientationAngle:\n")
            sensorValues.append("yaw: \(sensor.x)\n")
            sensorValues.append("pitch: \(sensor.y)\n")
            sensorValues.append("roll: \(sensor.z)")
        }
        self.sensorValueLabel.text = String(sensorValues)
        self.sensorDataLock.unlock()
    }
    
    func stopCurrentTimeCheckTimer() {
        self.displayLink?.invalidate()
        self.displayLink = nil
    }
}
