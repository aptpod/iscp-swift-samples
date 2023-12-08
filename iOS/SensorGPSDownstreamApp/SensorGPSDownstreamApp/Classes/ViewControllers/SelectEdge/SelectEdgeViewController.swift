//
//  SelectEdgeViewController.swift
//  SensorGPSDownstreamApp
//
//  Created by Ueno Masamitsu on 2020/09/24.
//  Copyright © 2020 aptpod, Inc. All rights reserved.
//

import UIKit
import intdash

fileprivate let kViewTitle = "Select Edge"

class SelectEdgeViewController: UIViewController {
    
    static let VIEW_IDENTIFIER = "selectEdgeView"
    
    // App Delegate
    let app: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var edgeCntLabel: UILabel!
    
    //MARK: - Intdash API
    var api: IntdashAPIManager = IntdashAPIManager.shared
    
    var edgeList: [Edge] { self.app.edgeList }
    var dispEdgeList: [Edge] = []
    
    var listDataLock = NSLock()
    var reloadRequestFlag: Bool = false
    
    // Loading Dialog
    var loadingDialog: LoadingAlertDialogView?
    
    var edgeIDKey: String { "\(self.api.serverURL).\(self.app.signInUserID).edgeID" }
    var edgeID: String? {
        get { UserDefaults.standard.string(forKey: self.edgeIDKey) }
        set { UserDefaults.standard.setValue(newValue, forKey: self.edgeIDKey) }
    }
    
    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad() - SelectEdgeViewController")
        self.app.activeVC = self
        self.navigationItem.title = kViewTitle
        // SignOutBtn
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(signOutBtnPushed(_:)))
        // SearchBar
        self.setupSearchBar()
        // TableView
        self.setupTableView()
        // EdgeList
        self.updateEdgeList {
            // 最後に利用したエッジが存在すれば自動選択
            let lastEdgeID = self.edgeID
            var found: Edge?
            for edge in self.edgeList {
                if edge.uuid == lastEdgeID {
                    found = edge
                    break
                }
            }
            guard let edge = found else { return }
            print("Automatic selection of last used edge. \(edge.name) [ \(edge.uuid) ]")
            self.app.targetEdge = edge
            self.goToNextView()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear() - SelectEdgeViewController")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear() - SelectEdgeViewController")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear() - SelectEdgeViewController")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewWillDisappear() - SelectEdgeViewController")
    }

    deinit {
        print("deinit - SelectEdgeViewController")
    }
    
    //MARK: - View Transitions
    
    func goToNextView() {
        DispatchQueue.main.async {
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: MainViewController.VIEW_IDENTIFIER) {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    //MARK: - View Events
    
    @objc func signOutBtnPushed(_ sender: Any) {
        print("signOutBtnPushed()")
        self.edgeID = nil
        self.app.signOut()
    }
    
    func updateEdgeList(completion: (()->())? = nil) {
        self.loadingDialog = LoadingAlertDialogView.init(addView: self.app.window!, showMessageLabel: false)
        self.loadingDialog?.startAnimating()
        DispatchQueue.global().async { [weak self] in
            defer { self?.listDataLock.unlock() }
            self?.listDataLock.lock()
            self?.api.requestListEdges { [weak self] (response, error) in
                self?.app.edgeList = response ?? []
                DispatchQueue.main.async {
                    self?.loadingDialog?.stopAnimating()
                    self?.loadingDialog = nil
                    self?.reloadDispEdgeList(filterText: self?.searchBar.text)
                    completion?()
                }
            }
        }
    }
}
