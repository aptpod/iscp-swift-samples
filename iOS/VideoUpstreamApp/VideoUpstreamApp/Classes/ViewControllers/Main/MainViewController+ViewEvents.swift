//
//  MainViewController+ViewEvents.swift
//  VideoUpstreamApp
//
//  Created by Ueno Masamitsu on 2020/10/22.
//  Copyright © 2020 aptpod, Inc. All rights reserved.
//

import UIKit

extension MainViewController {
    
    func setupViewEvents() {
        self.edgeNameLabel.text = self.app.targetEdge?.name
        self.streamControlBtn.addTarget(self, action: #selector(streamControlBtnPushed(_:)), for: .touchUpInside)
        self.timestampFormat = DateFormatter()
        self.timestampFormat.dateFormat = Config.TIMESTAMP_FORMAT_STRING
    }
    
    @IBAction func selectEdgeBtnPushed(_ sender: Any) {
        print("selectEdgeBtnPushed()")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func moveToFileListViewBtnPushed(_ sender: Any) {
        print("moveToFileListViewBtnPushed()")
        self.goToFileListView()
    }
    
    @IBAction func streamControlBtnPushed(_ sender: Any) {
        print("streamControlBtnPushed()")
        self.startMeasurement()
    }
    
    func updateStreamControlBtn() {
        DispatchQueue.main.async {
            if self.isUpstreaming {
                self.streamControlBtn.setTitle("STOP UPSTREAM", for: .normal)
                self.streamControlBtn.setTitleColor(Config.BUTTON_ACTIVE_TEXT_COLOR, for: .normal)
                self.startCurrentTimeCheckTimer()
            } else {
                self.streamControlBtn.setTitle("START UPSTREAM", for: .normal)
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
        guard self.baseTime > 0 else { return }
        let time = Date().timeIntervalSince1970 - self.baseTime
        self.currentTimeLabel.text = time.timeString
    }
    
    func stopCurrentTimeCheckTimer() {
        self.displayLink?.invalidate()
        self.displayLink = nil
    }
}
