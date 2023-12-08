//
//  MainViewController+Connection.swift
//  SensorGPSUpstreamApp
//
//  Created by uenomasamitsu on 2023/10/26.
//  Copyright © 2023 aptpod, Inc. All rights reserved.
//

import Foundation
import iSCP

extension MainViewController: ConnectionDelegate {

    public func openConnection(nodeID: String, completion: ((Bool)->())? = nil) {
        print("openConnection() - MainViewController")
        // Exclusion Control
        self.connectionLock.lock()
        defer { self.connectionLock.unlock() }
        
        guard self.connection == nil else {
            connectionError("Already used connection.")
            completion?(false)
            return
        }
        
        // 接続情報のセットアップをします。
        let urls = kTargetServer.components(separatedBy: "://")
        var address: String
        var enableTLS = false
        if urls.count == 1 {
            address = urls[0]
        } else {
            enableTLS = urls[0] == "https"
            address = urls[1]
        }
        // WebSocketを使って接続するように指定します。
        let transportConfig: ITransportConfig = Transport.WebSocket.Config(
            enableTLS: enableTLS
        )
        Connection.connect(
            address: address,
            transportConfig: transportConfig,
            tokenSource: { [weak self] token in
                // アクセス用のトークンを指定します。接続時に発生するイベントにより使用されます。
                self?.api.getEnableToken(token)
            },
            nodeID: nodeID) { [weak self] con, error in
                guard let con = con else {
                    // 接続失敗。
                    print("Failed to connect iSCP. \(error?.localizedDescription ?? "")")
                    self?.connectionError("Failed to connect iSCP. \(error?.localizedDescription ?? "")")
                    completion?(false)
                    return
                }
                // 接続成功。
                self?.connection = con
                self?.connection?.delegate = self // ConnectionDelegate
                completion?(true)
        }
    }
    
    //MARK: - ConnectionDelegate
    func didReconnect(connection: Connection) {
        print("didReconnect() - ConnectionDelegate")
    }
    
    func didDisconnect(connection: Connection) {
        print("didDisconnect() - ConnectionDelegate")
    }
    
    func didFailWithError(connection: Connection, error: Error) {
        print("didFailWithError(error: \(error.localizedDescription)) - ConnectionDelegate")
    }
    
    public func connectionError(_ message: String) {
        guard !self.isShowAlertDialog else { return }
        self.isShowAlertDialog = true
        print(message)
        AlertDialogView.showAlert(viewController: self, title: "Connection Error", message: message) { [weak self] in
            self?.isShowAlertDialog = false
        }
    }
  
    public func closeConnection(completion: ((Bool)->())? = nil) {
        print("closeConnection() - MainViewController")
        // Exclusion Control
        self.connectionLock.lock()
        defer { self.connectionLock.unlock() }
        
        guard let connection = self.connection else {
            completion?(false)
            return
        }
        self.connection = nil
        connection.close { error in
            if error != nil {
                print("Failed to close connection. \(error!)")
                completion?(false)
            } else {
                print("Success to close connection.")
                completion?(true)
            }
        }
    }
}
