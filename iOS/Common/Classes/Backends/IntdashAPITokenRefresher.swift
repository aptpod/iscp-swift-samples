//
//  IntdashAPITokenRefresher.swift
//
//  Created by uenomasamitsu on 2023/10/23.
//  Copyright © 2023 aptpod, Inc. All rights reserved.
//

import Foundation
#if os(iOS)
import UIKit
#endif

protocol IntdashAPITokenRefresherDelegate: AnyObject {
    func tokenRefresherWillRequestRefresh(_ tokenRefresher: IntdashAPITokenRefresher)
}

/// トークンをリフレッシュするクラス
class IntdashAPITokenRefresher {
    
    weak var delegate: IntdashAPITokenRefresherDelegate?

    /// オートリフレッシュ用タイマー
    private var timer: Timer?
    
    /// タイマー間隔
    private var timerInterval: TimeInterval = 60 * 10

    init() {
        #if os(iOS)
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillResignActive(_:)), name: UIApplication.willResignActiveNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(applicationDidBecomeActive(_:)), name: UIApplication.didBecomeActiveNotification, object: nil)
        #elseif os(OSX)
        self.startRefreshTimer()
        #endif
    }

    deinit {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    @objc private func applicationWillResignActive(_ notification: Notification) {
        self.stopRefreshTimer()
    }

    @objc private func applicationDidBecomeActive(_ notification: Notification) {
        delegate?.tokenRefresherWillRequestRefresh(self)
        
        self.startRefreshTimer()
    }
    
    @objc private func timerDidFire(_ timer: Timer) {
        delegate?.tokenRefresherWillRequestRefresh(self)
    }
    
    func setTimerInterval(_ interval: TimeInterval) {
        self.timerInterval = interval
        self.startRefreshTimer()
    }
    
    private func startRefreshTimer() {
        self.stopRefreshTimer()
        if Thread.isMainThread  {
            // オートリフレッシュ用タイマー
            self.timer = Timer.scheduledTimer(timeInterval: self.timerInterval, target: self, selector: #selector(self.timerDidFire(_:)), userInfo: nil, repeats: true)
            #if os(OSX)
            RunLoop.main.add(self.timer!, forMode: .common)
            #endif
        } else {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                // オートリフレッシュ用タイマー
                self.timer = Timer.scheduledTimer(timeInterval: self.timerInterval, target: self, selector: #selector(self.timerDidFire(_:)), userInfo: nil, repeats: true)
                #if os(OSX)
                RunLoop.main.add(self.timer!, forMode: .common)
                #endif
            }
        }
    }
    
    private func stopRefreshTimer() {
        timer?.invalidate()
        timer = nil
    }
}
