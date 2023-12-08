//
//  MainViewController.swift
//  VideoDownstreamApp
//
//  Created by Ueno Masamitsu on 2020/10/22.
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
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var edgeNameLabel: UILabel!
    @IBOutlet weak var resolutionLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!    
    @IBOutlet weak var frameRateLabel: UILabel!
    
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
    var videoDownstream: Downstream? = nil
    var isDownstreaming: Bool {
        self.videoDownstream != nil
    }
    var downstreams: [Downstream] = []
    var downstreamLock = NSLock()
    var videoDownstreamBaseTime : TimeInterval = 0
    
    var currentTimeFormat: DateFormatter!
    var frameRateCalc: FrameRateCalculator = FrameRateCalculator()
    
    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad - MainViewController")
        self.navigationItem.title = kViewTitle
        // View Events
        self.setupViewEvents()
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
