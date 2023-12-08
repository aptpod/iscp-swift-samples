//
//  MainViewController+OfflineRecord.swift
//  VideoUpstreamApp
//
//  Created by uenomasamitsu on 2023/10/26.
//  Copyright © 2023 aptpod, Inc. All rights reserved.
//

import Foundation

extension MainViewController {
    
    func startOfflineMeasurement() {
        print("startOfflineMeasurement() - MainViewController")
        let baseTime = MySystemClock.shared.rtcDate.timeIntervalSince1970
        self.baseTime = baseTime
        guard Config.UPSTREAM_IS_SAVE_TO_SERVER else { return }
        do {
            self.measurementFile = try IntdashMeasurementFileManager.generateFile(parentPath: Config.INTDASH_DATA_FILE_PARENT_PATH, serverURL: self.api.serverURL, userID: self.app.signInUserID, baseTime: baseTime, nodeID: self.app.targetEdge?.uuid ?? "")
            try self.measurementFile?.setProjectID(self.api.projectID)
            // for Video(JPEG) Stream
            self.videoLostChunkManager = try IntdashLostChunkManager(self.measurementFile!.genereateStreamFile(fileName: Config.JPEG_FILE_NAME))
        } catch {
            print("Failed to save data to local storage. \(error.localizedDescription)")
            AlertDialogView.showAlert(viewController: self, title: "Data Storage Error", message: "Failed to save data to local storage.")
        }
    }
    
    func stopOfflineMeasurement() {
        print("stopOfflineMeasurement() - MainViewController")
        if let lostChunkManager = self.videoLostChunkManager {
            self.videoLostChunkManager = nil
            do {
                try lostChunkManager.close()
            } catch {
                print("Failed to save data to local storage. \(error.localizedDescription)")
                AlertDialogView.showAlert(viewController: self, title: "Data Storage Error", message: "Failed to save data to local storage.")
            }
        }
    }
}
