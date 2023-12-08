//
//  FileListViewController+ViewEvents.swift
//  SensorGPSUpstreamApp
//
//  Created by Ueno Masamitsu on 2020/09/16.
//  Copyright © 2020 aptpod, Inc. All rights reserved.
//

import UIKit

extension FileListViewController {
    
    func setupViewEvents() {
        let clearBtn = UIBarButtonItem.init(title: "Clear", style: .plain, target: self, action: #selector(clearBtnPushed(_:)))
        self.navigationItem.setRightBarButton(clearBtn, animated: true)
    }
    
    @IBAction func clearBtnPushed(_ sender: Any){
        print("clearBtnPushed()")
        AlertDialogView.showAlert(viewController: self, title: "Check", message: "Delete all the files?") { (result) in
            print("Check to clear file list result: \(result)")
            if result {
                self.loadingDialog = LoadingAlertDialogView.init(addView: self.app.window!, showMessageLabel: true)
                self.loadingDialog?.startAnimating()
                let files = self.measFiles
                DispatchQueue.global().async { [weak self] in
                    let fm = FileManager.default
                    print("Remove measurement size: \(files.count)")
                    for i in 0 ..< files.count {
                        let file = files[i]
                        print("Remove[\(i)]: \(file.measurementID ?? ""), path: \(file.path)")
                        try? fm.removeItem(atPath: file.path)
                    }
                    self?.measFiles.removeAll()
                    DispatchQueue.main.async {
                        self?.loadingDialog?.stopAnimating()
                        self?.loadingDialog = nil
                        self?.tableView.reloadData()
                    }
                }
            }
        }
    }
}
