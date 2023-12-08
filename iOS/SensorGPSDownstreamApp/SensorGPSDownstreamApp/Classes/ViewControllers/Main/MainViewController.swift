//
//  MainViewController.swift
//  SensorGPSDownstreamApp
//
//  Created by Ueno Masamitsu on 2020/09/23.
//  Copyright © 2020 aptpod, Inc. All rights reserved.
//

import UIKit
import MapKit
import iSCP

fileprivate let kViewTitle = "Main"

class MainViewController: UIViewController {
    
    static let VIEW_IDENTIFIER = "mainView"
    
    // App Delegate
    let app: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //MARK:- ViewEvents
    @IBOutlet weak var streamControlBtn: UIButton!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var edgeNameLabel: UILabel!
    @IBOutlet weak var sensorValueLabel: UILabel!
    @IBOutlet weak var mapViewInfoBtn: UIButton!
    
    // Loading Dialog
    var loadingDialog: LoadingAlertDialogView?
    
    var displayLink: CADisplayLink?
    var isShowAlertDialog: Bool = false
    
    //MARK: - Intdash API
    var api: IntdashAPIManager = IntdashAPIManager.shared
    
    //MARK: - Connection
    var connection: Connection?
    var connectionLock = NSLock()
    
    //MARK: - Downstream
    var sensorDownstream: Downstream? = nil
    var gpsDownstream: Downstream? = nil
    var isDownstreaming: Bool {
        self.sensorDownstream != nil || self.gpsDownstream != nil
    }
    var downstreams: [Downstream] = []
    var downstreamLock = NSLock()
    var sensorDownstreamBaseTime : TimeInterval = 0
    var gpsDownstreamBaseTime : TimeInterval = 0
    
    // Sensor Data
    var sensorDataLock = NSLock()
    var sensorUserAcceleration: Vector3DPayload?
    var sensorGravity: Vector3DPayload?
    var sensorRotationRate: Vector3DPayload?
    var sensorAttitude: Vector3DPayload?
    
    // Map View
    var lastCoordinate: Vector2DPayload?
    var lastHeading: Float64Payload?
    var isUserTracking: Bool = false {
        didSet { self.didUpdateUserTrackingFlag() }
    }
    var userAnnotation: MKPointAnnotation?
    
    var currentTimeFormat: DateFormatter!
    
    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad - MainViewController")
        self.navigationItem.title = kViewTitle        
        // View Events
        self.setupViewEvents()
        // Map View
        self.setupMapView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear - MainViewController")
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear - MainViewController")
        // Downstream
        self.stopDownstream()
        // Map View
        self.userAnnotation = nil
        self.lastCoordinate = nil
        self.lastHeading = nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear - MainViewController")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewWillDisappear - MainViewController")
    }
    
    deinit {
        print("deinit - MainViewController")
    }
    
    //MARK: - Playing
    func startPlaying() {
       if !self.isDownstreaming {
           self.loadingDialog = LoadingAlertDialogView.init(addView: self.app.window!, showMessageLabel: false)
           self.loadingDialog?.startAnimating()
           let nodeID = "" // Downstreamのみ行う場合はNodeIDは不要。
           self.openConnection(nodeID: nodeID) { [weak self] result in
               guard result else { return }
               self?.startDownstream { error in
                   DispatchQueue.main.async {
                       self?.loadingDialog?.stopAnimating()
                       self?.loadingDialog = nil
                   }
                   if let error = error {
                       print("Open downstream error. \(error.localizedDescription)")
                       AlertDialogView.showAlert(viewController: self!, title: "Open Downstream Error", message: error.localizedDescription)
                       return
                   }
                   self?.updateStreamControlBtn()
               }
           }
       } else {
           self.stopPlaying()
       }
    }
       
    func stopPlaying() {
        self.stopDownstream()
        self.closeConnection()
        self.updateStreamControlBtn()
    }
}
