//
//  SelectMeasurementViewController.swift
//  AccessingMeasurementDataSample
//
//  Created by Ueno Masamitsu on 2021/02/05.
//  Copyright © 2021 aptpod, Inc. All rights reserved.
//

import UIKit
import intdash

fileprivate let kViewTitle = "Select Measurement"

class SelectMeasurementViewController: UIViewController {
    
    static let VIEW_IDENTIFIER = "selectMeasurementView"
    
    // App Delegate
    let app: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var dispCntLabel: UILabel!
    
    //MARK: - Intdash API
    var api: IntdashAPIManager = IntdashAPIManager.shared
    
    var measurementList: [Measurement] = []
    var dispMeasurementList: [Measurement] = []
    
    var listDataLock = NSLock()
    var reloadRequestFlag: Bool = false
    
    // Loading Dialog
    var loadingDialog: LoadingAlertDialogView?
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad - SelectMeasurementViewController")
        self.navigationItem.title = kViewTitle
        // SearchBar
        self.setupSearchBar()
        // TableView
        self.setupTableView()
        // MeasurementList
        self.updateMeasurementList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear - SelectMeasurementViewController")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear - SelectMeasurementViewController")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear - SelectMeasurementViewController")
        
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewWillDisappear - SelectMeasurementViewController")
    }
    
    deinit {
        print("deinit - SelectMeasurementViewController")
    }
    
    //MARK: - View Transitions
    
    func goToNextView() {
        DispatchQueue.main.async {
            DispatchQueue.main.async {
                if let vc = self.storyboard?.instantiateViewController(withIdentifier: RequestDataPointsSampleViewController.VIEW_IDENTIFIER) {
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
    //MARK: - View Events
    
    func updateMeasurementList() {
        guard let edgeUuid = self.app.targetEdge?.uuid else {
            print("Failed to get target uuid.")
            return
        }
        self.loadingDialog = LoadingAlertDialogView.init(addView: self.app.window!, showMessageLabel: false)
        self.loadingDialog?.startAnimating()
        DispatchQueue.global().async { [weak self] in
            defer { self?.listDataLock.unlock() }
            self?.listDataLock.lock()
            let start = Date().timeIntervalSince1970 - Config.INTDASH_REQUEST_MEASUREMENT_LIST_DURATION
            let end = Date().timeIntervalSince1970
            IntdashAPIManager.shared.requestListMeasurements(edgeUuid: edgeUuid, start: start, end: end, durationStart: Config.INTDASH_REQUEST_MEASUREMENT_DURATION_START, limit: Config.INTDASH_REQUEST_MEASUREMENT_LIMIT) { response, error in
                self?.measurementList = response ?? []
                DispatchQueue.main.async {
                    self?.loadingDialog?.stopAnimating()
                    self?.loadingDialog = nil
                    self?.reloadMeasurementList(filterText: self?.searchBar.text)
                }
            }
        }
    }
}
