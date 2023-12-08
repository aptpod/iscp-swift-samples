//
//  MainViewController+ViewEvents.swift
//  VideoDownstreamApp
//
//  Created by Ueno Masamitsu on 2020/10/22.
//  Copyright © 2020 aptpod, Inc. All rights reserved.
//

import UIKit

extension MainViewController: FrameRateCalculatorDelegate {
    
    func setupViewEvents() {
        self.edgeNameLabel.text = self.app.targetEdge?.name
        self.streamControlBtn.addTarget(self, action: #selector(streamControlBtnPushed(_:)), for: .touchUpInside)
        self.currentTimeFormat = DateFormatter()
        self.currentTimeFormat.dateFormat = Config.CURRENT_TIME_FORMAT_STRING
        self.frameRateCalc.delegate = self
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
        self.frameRateCalc.start()
    }
    
    @objc func willRefreshDisplay(_ displayLink: CADisplayLink) {
        let now = Date()
        self.currentTimeLabel.text = self.currentTimeFormat.string(from: now)
    }
    
    func stopCurrentTimeCheckTimer() {
        self.displayLink?.invalidate()
        self.displayLink = nil
        self.frameRateCalc.stop()
    }
    
    //MARK: - FrameRateCalculatorDelegate
    func didCalculateFrameRate(_ calculator: FrameRateCalculator, fps: Int) {
        self.frameRateLabel.text = "\(fps) FPS"
    }
}
