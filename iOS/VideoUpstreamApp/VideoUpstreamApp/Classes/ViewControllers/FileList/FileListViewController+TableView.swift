//
//  FileListViewController+TableView.swift
//  VideoUpstreamApp
//
//  Created by Ueno Masamitsu on 2020/10/22.
//  Copyright © 2020 aptpod, Inc. All rights reserved.
//

import UIKit

fileprivate let kCellIdentifier = "defaultCell"

extension IntdashMeasurementFile {
    
    var title: String {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy/MM/dd HH:mm:ss", options: 0, locale: Locale(identifier: "ja_JP"))
        var duration: TimeInterval?
        if let endTime = self.endTime {
            duration = endTime - self.baseTime
        }
        return "\(formatter.string(from: Date(timeIntervalSince1970: self.baseTime))) - \(duration?.durationString ?? "") ( \(self.ntpBaseTime != nil ? "NTP" : "RTC") )"
    }
}

extension FileListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    //MARK:- UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.updateNavigationBarTitle()
        return self.measFiles.count
    }
    
    //MARK:- UITableViewDelegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier, for: indexPath)
        let file = self.measFiles[indexPath.row]
        cell.textLabel?.text = file.title
        var measID = "NULL"
        if let id = file.measurementID {
            measID = "\(id.prefix(8))..."
        }
        cell.detailTextLabel?.text = "\(file.isUploaded ? "[ UPLOADED ] " : "")\(file.fileSize?.dataSizeString ?? "0 Byte"), UUID: \(measID), NodeID: \(file.nodeID.prefix(8))..."
        return cell
    }
    
    // Left Button
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let file = self.measFiles[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Delete") { (_, _, completion) in
            // Delete Action
            AlertDialogView.showAlert(viewController: self, title: nil, message: "Delete [ \(file.title) ]?", boolCompletion: { [weak self] (result) in
                completion(true)
                guard result else { return }
                self?.remove(index: indexPath.row)
            })
        }
        action.backgroundColor = Config.CELL_DELETE_BTN_BG_COLOR
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func remove(index: Int) {
        self.loadingDialog = LoadingAlertDialogView.init(addView: self.app.window!, showMessageLabel: false)
        self.loadingDialog?.startAnimating()
        DispatchQueue.global().async {
            let file = self.measFiles[index]
            try? FileManager.default.removeItem(atPath: file.path)
            DispatchQueue.main.async {
                self.loadingDialog?.stopAnimating()
                self.loadingDialog = nil
                self.measFiles.remove(at: index)
                self.tableView.deleteRows(at: [IndexPath.init(row: index, section: 0)], with: .right)
                self.updateNavigationBarTitle()
            }
        }
    }
    
    // Right Button
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let file = self.measFiles[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Upload") { (_, _, completion) in
            // Upload Action
            guard file.isUploaded else {
                completion(true)
                self.upload(index: indexPath.row, allSend: false)
                return
            }
            AlertDialogView.showAlert(viewController: self, title: nil, message: "[ \(file.title) ] is already uploaded. Upload again?", boolCompletion: { (result) in
                completion(true)
                guard result else { return }
                self.upload(index: indexPath.row, allSend: true)
            })
        }
        action.backgroundColor = Config.CELL_UPLOAD_BTN_BG_COLOR
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func upload(index: Int, allSend: Bool) {
        self.loadingDialog = LoadingAlertDialogView.init(addView: self.app.window!, showMessageLabel: true)
        self.loadingDialog?.startAnimating()
        let file = self.measFiles[index]
        DispatchQueue.global().async { [weak self] in
            self?.uploadData(file: file, allSend: allSend, completion: { (error) in
                self?.resendCheckCompletion = nil
                DispatchQueue.main.async {
                    self?.loadingDialog?.stopAnimating()
                    self?.loadingDialog = nil
                    AlertDialogView.showAlert(viewController: self!, message: error == nil ? "Upload completed." : "Upload failed. \(error?.localizedDescription ?? "")")
                    if error == nil {
                        do {
                            try file.setUploadedFlag(true)
                        } catch { print("Failed to set uploadFlag. \(error)" )}
                    }
                    self?.tableView?.reloadRows(at: [IndexPath.init(row: index, section: 0)], with: .automatic)
                }
            })
        }
    }
}
