//
//  SelectEdgeViewController+TableView.swift
//  VideoUpstreamApp
//
//  Created by uenomasamitsu on 2023/10/24.
//  Copyright © 2023 aptpod, Inc. All rights reserved.
//

import UIKit

fileprivate let kCellIdentifier = "defaultCell"

extension SelectEdgeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    //MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dispEdgeList.count
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier, for: indexPath)
        let edge = self.dispEdgeList[indexPath.row]
        cell.textLabel?.text = edge.name
        cell.detailTextLabel?.text = edge.uuid
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let edge = self.dispEdgeList[indexPath.row]
        print("Did selected edge name: \(edge.name)")
        self.app.targetEdge = edge
        // 最後に利用したエッジとして保存
        self.edgeID = edge.uuid
        self.goToNextView()
    }
}
