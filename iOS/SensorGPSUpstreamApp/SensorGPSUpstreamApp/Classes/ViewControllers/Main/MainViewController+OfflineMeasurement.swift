//
//  MainViewController+OfflineMeasurement.swift
//  SensorGPSUpstreamApp
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
            // for Sensor Stream
            self.sensorLostChunkManager = try IntdashLostChunkManager(self.measurementFile!.genereateStreamFile(fileName: Config.SENSOR_FILE_NAME))
            // for GPS Stream
            self.gpsLostChunkManager = try IntdashLostChunkManager(self.measurementFile!.genereateStreamFile(fileName: Config.SENSOR_FILE_NAME))
        } catch {
            print("Failed to save data to local storage. \(error.localizedDescription)")
            AlertDialogView.showAlert(viewController: self, title: "Data Storage Error", message: "Failed to save data to local storage.")
        }
    }
    
    func stopOfflineMeasurement() {
        print("stopOfflineMeasurement() - MainViewController")
        if let lostChunkManager = self.sensorLostChunkManager {
            self.sensorLostChunkManager = nil
            do {
                try lostChunkManager.close()
            } catch {
                print("Failed to save data to local storage. \(error.localizedDescription)")
                AlertDialogView.showAlert(viewController: self, title: "Data Storage Error", message: "Failed to save data to local storage.")
            }
        } else if let lostChunkManager = self.gpsLostChunkManager {
            self.gpsLostChunkManager = nil
            do {
                try lostChunkManager.close()
            } catch {
                print("Failed to save data to local storage. \(error.localizedDescription)")
                AlertDialogView.showAlert(viewController: self, title: "Data Storage Error", message: "Failed to save data to local storage.")
            }
        }
    }
}
