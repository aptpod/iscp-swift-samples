//
//  Config.swift
//  VideoUpstreamApp
//
//  Created by Ueno Masamitsu on 2020/10/22.
//  Copyright © 2020 aptpod, Inc. All rights reserved.
//

import UIKit
import iSCP
import AVFoundation

class Config {
    
    /// アプリごとのOAuth2.0 Web認証用のコールバックスキーム。intdashサーバー管理者に登録を依頼してください。
    ///
    /// この値は `Info.plist` でも設定してください。※ただし`:`以降は不要です。(`example.app`のみ）
    public static let CALLBACK_URL_SCHEME: String = "example.app://oauth2/callback"
    /*
     |Key                  |Type       |Value                       |
     |---------------------|-----------|----------------------------|
     |- URL types          |Array      |                            |
     |  - Item 0 (Viewer)  |Dictionary |                            |
     |    - Document Role  |String     |Viewer                      |
     |    - URL identifier |String     |$(PRODUCT_BUNDLE_IDENTIFIER)|
     |    - URL Schemes    |Array      |                            |
     |      - Item 0       |String     |example.app                 |
    */
    
    // iSCP Options
    public static let ISCP_LOG_LEVEL: ISCPLogLevel = .info
    // データをサーバーに保存したい場合は、このフラグをオンにする必要があります。
    public static let UPSTREAM_IS_SAVE_TO_SERVER = VIDEO_IS_SAVE_TO_SERVER
    public static let VIDEO_IS_SAVE_TO_SERVER = true
    /// データポイントフラッシュ方法
    public static let UPSTREAM_VIDEO_DATA_POINTS_FLUSH_POLICY: FlushPolicy = FlushPolicy.Immediately()
    /// ストリームの切断時の有効な期間
    public static let STREAM_EXPIRY_INTERVAL: TimeInterval = 60
    
    // Data File Manager
    public static let INTDASH_DATA_FILE_PARENT_PATH = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    /// 再送時の１リクエスト当たりのデータサイズ
    public static let RESEND_DATA_SIZE: UInt64 = 1_000_000
    
    // Capture Device
    public static let CAMERA_DEVICE_TYPE: AVCaptureDevice.DeviceType = .builtInWideAngleCamera
    public static let CAMERA_CAPTURE_POSITION: AVCaptureDevice.Position = .back
    public static let CAMERA_PIXEL_FORMAT_TYPE = kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange
    public static let CAMERA_CAPTURE_PRESET: AVCaptureSession.Preset = .cif352x288
    
    // JPEG
    public static let JPEG_COMPRESS_QUALITY: CGFloat = 0.1
    public static let JPEG_DATA_ID: DataID = DataID(name: "jpeg", type: JPEGPayload.TYPE) // 送信するデータ情報
    public static let JPEG_FILE_NAME: String = "video.jpeg"
    
    // View Events
    static let CURRENT_TIME_REFRESH_RATE: Int = 2
    static let TIMESTAMP_FORMAT_STRING = "HH:mm:ss.SSS"
    static let TIMESTAMP_DEFAULT_STRING = "00:00:00.000"
    
    static let BUTTON_ACTIVE_TEXT_COLOR: UIColor = UIColor.init(red: 215/255.0, green: 62/255.0, blue: 133/255.0, alpha: 1.0)
    static let BUTTON_DEACTIVE_TEXT_COLOR: UIColor = UIColor.white
    static let SEARCH_BAR_TEXT_COLOR: UIColor = UIColor.white
    
    // File List
    public static let CELL_DELETE_BTN_BG_COLOR: UIColor = UIColor.init(red: 238/255.0, green: 52/255.0, blue: 51/255.0, alpha: 1.0)
    public static let CELL_UPLOAD_BTN_BG_COLOR: UIColor = UIColor.init(red: 47/255.0, green: 172/255.0, blue: 255/255.0, alpha: 1.0)
    
    
}
