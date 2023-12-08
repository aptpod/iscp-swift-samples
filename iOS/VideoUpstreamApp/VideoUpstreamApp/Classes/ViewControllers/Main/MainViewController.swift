//
//  MainViewController.swift
//  VideoUpstreamApp
//
//  Created by Ueno Masamitsu on 2020/10/22.
//  Copyright © 2020 aptpod, Inc. All rights reserved.
//

import UIKit
import AVFoundation
import iSCP

class MainViewController: UIViewController {
    
    static let VIEW_IDENTIFIER = "mainView"
    
    // App Delegate
    let app: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //MARK: - ViewEvents
    @IBOutlet weak var streamControlBtn: UIButton!
    @IBOutlet weak var currentTimeLabel: UILabel!    
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var edgeNameLabel: UILabel!
    @IBOutlet weak var resolutionLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    
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
    var videoUpstream: Upstream? = nil
    var isUpstreaming: Bool {
        self.videoUpstream != nil || self.videoLostChunkManager != nil
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
    var videoFile: IntdashStreamFile?
    var videoSequenceIndex: Int = 0
    var videoLostChunkManager: IntdashLostChunkManager?
    
    //MARK: - CaptureDeviceFunc
    var captureDevice: AVCaptureDevice?
    var captureSession: AVCaptureSession?
    var captureConnection: AVCaptureConnection?
    
    var timestampFormat: DateFormatter!
    
    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad() - MainViewController")
        self.app.activeVC = self
        // View Events
        self.setupViewEvents()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("viewWillTransition() - MainViewController")
        coordinator.animate(alongsideTransition: { (_) in }) { [weak self] (_) in
            // Did change device orientation.
            print("didChangeDeviceOrientation: \(self?.view.interfaceOrientation?.name ?? "NULL")")
            // Capture orientation
            self?.updateCaptureOrientation()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear() - MainViewController")
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear() - MainViewController")
        self.navigationController?.navigationBar.isHidden = false
        // iSCP
        self.closeConnection()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear() - MainViewController")
        // Capture
        self.startCapturing()
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
        print("viewWillDisappear() - MainViewController")
        // Capture
        self.stopCapturing()
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
