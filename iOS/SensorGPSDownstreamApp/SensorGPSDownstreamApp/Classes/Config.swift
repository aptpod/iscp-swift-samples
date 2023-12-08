//
//  Config.swift
//  SensorGPSDownstreamApp
//
//  Created by Ueno Masamitsu on 2020/09/23.
//  Copyright © 2020 aptpod, Inc. All rights reserved.
//

import UIKit
import iSCP

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
    /// ストリームの切断時の有効な期間
    public static let STREAM_EXPIRY_INTERVAL: TimeInterval = 60
    
    // View Contents
    static let CURRENT_TIME_REFRESH_RATE: Int = 60
    static let CURRENT_TIME_FORMAT_STRING = "HH:mm:ss.SSS"
    static let CURRENT_TIME_DEFAULT_STRING = "00:00:00.000"
    static let BUTTON_ACTIVE_TEXT_COLOR: UIColor = UIColor.init(red: 215/255.0, green: 62/255.0, blue: 133/255.0, alpha: 1.0)
    static let BUTTON_DEACTIVE_TEXT_COLOR: UIColor = UIColor.white
    static let SEARCH_BAR_TEXT_COLOR: UIColor = UIColor.white
    
    // Sensor
    public static let SENSOR_USER_ACCELERATION_DATA_FILTER: DataFilter = DataFilter(name: "acceleration", type: Vector3DPayload.TYPE)
    public static let SENSOR_GRAVITY_DATA_FILTER: DataFilter = DataFilter(name: "gravity", type: Vector3DPayload.TYPE)
    public static let SENSOR_ROTATION_RATE_DATA_FILTER: DataFilter = DataFilter(name: "angular_velocity", type: Vector3DPayload.TYPE)
    public static let SENSOR_ATTITUDE_DATA_FILTER: DataFilter = DataFilter(name: "orientation", type: Vector3DPayload.TYPE)
    
    // GPS
    public static let GPS_COORDINATE_DATA_FILTER: DataFilter = DataFilter(name: "geolocation_coordinates", type: Vector2DPayload.TYPE)
    public static let GPS_TRUE_HEADING_DATA_FILTER: DataFilter = DataFilter(name: "geolocation_heading", type: Float64Payload.TYPE)
    
    // Map View
    static let MAP_VIEW_INFO_BTN_DEFAULT_COLOR = UIColor.init(red: 47/255.0, green: 172/255.0, blue: 255/255.0, alpha: 1.0)
    static let MAP_VIEW_INFO_BTN_DEFAULT_BG_COLOR = UIColor.clear
    static let MAP_VIEW_INFO_BTN_SELECTED_COLOR = UIColor.white
    static let MAP_VIEW_INFO_BTN_SELECTED_BG_COLOR = UIColor.init(red: 47/255.0, green: 172/255.0, blue: 255/255.0, alpha: 0.9)
    static let MAP_VIEW_USER_MARKER_BALLOON_TEXT_TINT_COLOR = UIColor.white
    static let MAP_VIEW_USER_MARKER_BALLOON_TINT_COLOR = UIColor.init(red: 47/255.0, green: 172/255.0, blue: 255/255.0, alpha: 1.0)
    static let MAP_VIEW_USER_MARKER_BALLOON_TEXT = "📱"
    static let MAP_VIEW_USER_MARKER_BOTTOM_TEXT = "Edge"
    static let MAP_VIEW_USER_MARKER_CAMERA_DEFAULT_DISTANCE: Double = 1000 // Meter
}
