//
//  MainViewController.swift
//  SensorGPSUpstreamApp
//
//  Created by Ueno Masamitsu on 2020/09/16.
//  Copyright © 2020 aptpod, Inc. All rights reserved.
//

import UIKit
import CoreLocation
import CoreMotion
import MapKit
import iSCP

class MainViewController: UIViewController {
    
    static let VIEW_IDENTIFIER = "mainView"
    
    // App Delegate
    let app: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //MARK: - ViewEvents
    @IBOutlet weak var streamControlBtn: UIButton!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var edgeNameLabel: UILabel!
    @IBOutlet weak var sensorValueLabel: UILabel!
    
    // Loading Dialog
    var loadingDialog: LoadingAlertDialogView?
    
    var displayLink: CADisplayLink?
    var isShowAlertDialog: Bool = false
    
    //MARK: - Intdash API
    var api: IntdashAPIManager = IntdashAPIManager.shared
    
    //MARK: - Connection
    var connection: Connection?
    var connectionLock = NSLock()
    
    //MARK: - Upstream
    var sensorUpstream: Upstream? = nil
    var gpsUpstream: Upstream? = nil
    var isUpstreaming: Bool {
        self.sensorUpstream != nil || self.sensorLostChunkManager != nil ||
        self.gpsUpstream != nil || self.gpsUpstream != nil
    }
    var upstreams = [Upstream]()
    var usedUpstreams = [Upstream]()
    var upstreamLock = NSLock()
    var baseTime: TimeInterval = 0
    var measurementID: String = ""
    var generatedSequences: UInt64 = 0
    var receivedSequences: UInt64 = 0
    var failedSendDataPoints = Dictionary<UUID,[DataPointGroup]>()
    
    // Measurement File Manager
    var measurementFile: IntdashMeasurementFile?
    var sensorFile: IntdashStreamFile?
    var gpsFile: IntdashStreamFile?
    var sensorSequenceIndex: Int = 0
    var gpsSequenceIndex: Int = 0
    var sensorLostChunkManager: IntdashLostChunkManager?
    var gpsLostChunkManager: IntdashLostChunkManager?
    
    //MARK: - GPSManager
    var locationManager = CLLocationManager()
    var locationBaseTime: TimeInterval = -1
    var locationSampleBaseTime: TimeInterval = -1
    var headBaseTime: TimeInterval = -1
    var headSampleBaseTime: TimeInterval = -1
    
    //MARK: - SensorManager
    var motionManager = CMMotionManager()
    var motionBaseTime: TimeInterval = -1
    var motionSampleBaseTime: TimeInterval = -1
    
    func resetSampleBaseTimes() {
        self.locationSampleBaseTime = -1
        self.headSampleBaseTime = -1
        self.motionSampleBaseTime = -1
    }
    
    //MARK: - MapView
    var userTrackingBtn: MKUserTrackingButton!
    
    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad - MainViewController")
        self.app.activeVC = self
        // View Events
        self.setupViewEvents()
        // Map View
        self.setupMapView()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("viewWillTransition - MainViewController")
        coordinator.animate(alongsideTransition: { (_) in }) { [weak self] (_) in
            // Did change device orientation.
            print("didChangeDeviceOrientation: \(self?.view.interfaceOrientation?.name ?? "NULL")")
            // GPS head
            self?.updateGpsHeadingOrientaiton()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear - MainViewController")
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear - MainViewController")
        self.navigationController?.navigationBar.isHidden = false
        // iSCP
        self.closeConnection()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear - MainViewController")
        // GPS Manager
        self.setupGPSManager()
        // Sensor Manager
        self.setupSensorManager()
        // Upstreamする際はNodeIDが必須。
        guard let nodeID = self.app.targetEdge?.uuid, !nodeID.isEmpty else {
            connectionError("Failed to get node id.")
            self.navigationController?.popViewController(animated: true)
            return
        }
        // iSCP
        self.openConnection(nodeID: nodeID)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewWillDisappear - MainViewController")
        // GPS Manager
        self.disposeGPSManager()
        // Sensor Manager
        self.disposeSensorManager()
    }    
    
    deinit {
        print("deinit - MainViewController")
    }
    
    //MARK: - View Transitions
    func goToFileListView() {
        DispatchQueue.main.async {
           if let vc = self.storyboard?.instantiateViewController(withIdentifier: FileListViewController.VIEW_IDENTIFIER) {
                self.navigationController?.pushViewController(vc, animated: true)
           }
        }
    }
    
    //MARK: - Measurement
    func startMeasurement() {
        guard self.connection != nil else { return }
        if !self.isUpstreaming {
            // Reset System Clock.
            MySystemClock.shared.resetRtc()
            self.loadingDialog = LoadingAlertDialogView.init(addView: self.app.window!, showMessageLabel: false)
            self.loadingDialog?.startAnimating()
            self.openUpstream { [weak self] error in
                DispatchQueue.main.async {
                    self?.loadingDialog?.stopAnimating()
                    self?.loadingDialog = nil
                }
                if let error = error {
                    print("Open upstream error. \(error.localizedDescription)")
                    AlertDialogView.showAlert(viewController: self!, title: "Open Upstream Error", message: "Perform measurements offline.")
                    self?.startOfflineMeasurement()
                }
                self?.updateStreamControlBtn()
            }
        } else {
            self.stopMeaurement()
        }
    }
    
    func stopMeaurement() {
        self.closeUpstream()
        self.updateStreamControlBtn()
    }
}
