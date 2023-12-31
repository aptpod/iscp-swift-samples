//
//  AppDelegate.swift
//  VideoUpstreamApp
//
//  Created by Ueno Masamitsu on 2021/02/03.
//  Copyright © 2021 aptpod, Inc. All rights reserved.
//

import UIKit
import iSCP
import intdash

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var activeVC: UIViewController?
    
    var edgeList: [Edge] = []
    var targetEdge: Edge?
    var signInUserName: String = ""
    var signInUserID: String = ""

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("didFinishLaunchingWithOptions - AppDelegate")
        
        // Log Level.
        ISCPLog.shared.level = Config.ISCP_LOG_LEVEL
        
        // Reset the clock for the RTC.
        MySystemClock.shared.resetRtc()
        
        return true
    }
    
    public func signOut() {
        DispatchQueue.main.async { [weak self] in
            IntdashAPIManager.shared.clearSession()
            self?.activeVC?.dismiss(animated: true, completion: nil)
            self?.activeVC = nil
        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        print("applicationWillResignActive - AppDelegate")
        // Sleep on
        application.isIdleTimerDisabled = false
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        print("applicationDidBecomeActive - AppDelegate")
        // Sleep off
        application.isIdleTimerDisabled = true
    }

}

