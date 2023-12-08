//
//  MainViewController+EncodeFunc.swift
//  VideoUpstreamApp
//
//  Created by Ueno Masamitsu on 2020/10/23.
//  Copyright © 2020 aptpod, Inc. All rights reserved.
//

import UIKit
import iSCP

extension MainViewController {
    
    func encodeImage(image: UIImage, timestamp: TimeInterval) {
        /// ToDo
        /// `IntdashMediaSDK` を利用するとH.264やH.265等のエンコードが行えます。
        guard let jpeg = image.jpegData(compressionQuality: Config.JPEG_COMPRESS_QUALITY) else {
            print("Failed to encode image.")
            return
        }
//        DispatchQueue.main.async {
//            // Decode Image Preview
//            if let decodeImage = UIImage.init(data: jpeg) {
//                self.previewImageView.image = decodeImage
//                self.resolutionLabel.text = String.init(format: "%.0fx%.0f", decodeImage.size.width, decodeImage.size.height)
//                self.timestampLabel.text = self.timestampFormat.string(from: Date(timeIntervalSince1970: timestamp))
//            }
//        }        
        self.sendJPEG(jpeg: jpeg, timestamp: timestamp)
    }
    
    func sendJPEG(jpeg: Data, timestamp: TimeInterval) {
        guard self.isUpstreaming else { return }
        // 計測開始時間から経過時間を算出します。
        let elapsedTime = timestamp - self.baseTime
        guard elapsedTime >= 0 else {
            print("Elapsed time error. \(elapsedTime)")
            return
        }
        DispatchQueue.global().async {
            // 事前に定義したフォーマットでデータポイントを作成します。
            let payload = JPEGPayload(data: jpeg).encode()
            let dataPoint = DataPoint(elapsedTime: elapsedTime, payload: payload)
            if let upstream = self.videoUpstream {
                // 事前に定義したデータIDでデータポイントを送信します。
                self.sendDataPoint(upstream, dataID: Config.JPEG_DATA_ID, dataPoint: dataPoint)
            }
            else if let lostChunkManager = self.videoLostChunkManager {
                do {
                    // オフライン計測の場合はデータを保存します。
                    try lostChunkManager.append(dataID: Config.JPEG_DATA_ID, dataPoint: dataPoint)
                } catch {
                    print("Failed to save data points to local storage. \(error.localizedDescription)")
                }
            }
        }
        
    }
}
