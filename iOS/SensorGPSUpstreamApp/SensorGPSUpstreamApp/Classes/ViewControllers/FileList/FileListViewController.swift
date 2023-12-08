//
//  FileListViewController.swift
//  SensorGPSUpstreamApp
//
//  Created by Ueno Masamitsu on 2020/09/16.
//  Copyright © 2020 aptpod, Inc. All rights reserved.
//

import UIKit

class FileListViewController: UIViewController {
    
    static let VIEW_IDENTIFIER = "fileListView"
    
    // App Delegate
    let app: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Intdash API
    var api: IntdashAPIManager = IntdashAPIManager.shared
    
    var measFiles: [IntdashMeasurementFile] = []
    var resendCheckCompletion: ((Bool)->())?
    var processTime: TimeInterval = 0
    // TODO: キャンセル処理。サンプルでは未実装。
    var isCanceled = false
    
    // Loading Dialog
    var loadingDialog: LoadingAlertDialogView?
    
    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad() - FileListViewController")
        // View Events
        self.setupViewEvents()
        // TableView
        self.setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear() - FileListViewController")
        self.loadMeasDataList()
    }

    deinit {
        print("deinit - FileListViewController")
    }
    
    //MARK: - View Events
    
    func updateNavigationBarTitle() {
        self.navigationItem.title = "FileList [ \(self.measFiles.count) ]"
    }
    
    func loadMeasDataList() {
        print("loadMeasDataList() - FileListViewController")
        guard let userID = self.api.signInUserInfo?.uuid else {
            print("Failed to get userID.")
            return
        }
        self.loadingDialog = LoadingAlertDialogView.init(addView: self.app.window!, showMessageLabel: false)
        self.loadingDialog?.startAnimating()
        DispatchQueue.global().async { [weak self] in
            self?.measFiles = IntdashMeasurementFileManager.load(parentPath: Config.INTDASH_DATA_FILE_PARENT_PATH, serverURL: self!.api.serverURL, userID: userID)
            DispatchQueue.main.async {
                self?.loadingDialog?.stopAnimating()
                self?.loadingDialog = nil
                self?.tableView.reloadData()
            }
        }
    }
}
