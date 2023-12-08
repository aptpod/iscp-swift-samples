//
//  Config.swift
//  SensorGPSUpstreamApp
//
//  Created by Ueno Masamitsu on 2020/09/15.
//  Copyright © 2020 aptpod, Inc. All rights reserved.
//

import UIKit
import iSCP
import CoreLocation
import CoreMotion

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
    public static let UPSTREAM_IS_SAVE_TO_SERVER = GPS_IS_SAVE_TO_SERVER || SENSOR_IS_SAVE_TO_SERVER
    public static let SENSOR_IS_SAVE_TO_SERVER = true
    public static let GPS_IS_SAVE_TO_SERVER = true
    /// データポイントフラッシュ方法
    public static let UPSTREAM_SENSOR_DATA_POINTS_FLUSH_POLICY: FlushPolicy = FlushPolicy.IntervalOrBufferSize()
    public static let UPSTREAM_GPS_DATA_POINTS_FLUSH_POLICY: FlushPolicy = FlushPolicy.IntervalOrBufferSize()
    /// ストリームの切断時の有効な期間
    public static let STREAM_EXPIRY_INTERVAL: TimeInterval = 60
    
    // Data File Manager
    public static let INTDASH_DATA_FILE_PARENT_PATH = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    /// 再送時の１リクエスト当たりのデータサイズ
    public static let RESEND_DATA_SIZE: UInt64 = 1_000_000
    
    // Sensor
    public static let SENSOR_USING_TYPE: CMAttitudeReferenceFrame = .xMagneticNorthZVertical
    public static let SENSOR_SAMPLING_RATE: Int = 50
    public static let SENSOR_IS_ENABLED_USER_ACCELERATION = true
    public static let SENSOR_IS_ENABLED_GRAVITY = true
    public static let SENSOR_IS_ENABLED_ROTATION_RATE = true
    public static let SENSOR_IS_ENABLED_ATTITUDE = true
    public static let SENSOR_FILE_NAME: String = "sensor"
    public static let SENSOR_USER_ACCELERATION_DATA_ID = DataID(name: "acceleration", type: Vector3DPayload.TYPE)
    public static let SENSOR_GRAVITY_DATA_ID = DataID(name: "gravity", type: Vector3DPayload.TYPE)
    public static let SENSOR_ROTATION_RATE_DATA_ID = DataID(name: "angular_velocity", type: Vector3DPayload.TYPE)
    public static let SENSOR_ATTITUDE_DATA_ID = DataID(name: "orientation", type: Vector3DPayload.TYPE)
    
    // GPS
    public static let GPS_LOCATION_ACCURACY: CLLocationAccuracy = kCLLocationAccuracyBest
    public static let GPS_FILE_NAME: String = "gps"
    public static let GPS_IS_ENABLED_COORDINATE = true
    public static let GPS_IS_ENABLED_TRUE_HEADING = true
    public static let GPS_COORDINATE_DATA_ID = DataID(name: "geolocation_coordinates", type: Vector2DPayload.TYPE)
    public static let GPS_TRUE_HEADING_DATA_ID = DataID(name: "geolocation_heading", type: Float64Payload.TYPE)
    
    // View Events
    static let CURRENT_TIME_REFRESH_RATE: Int = 2
    
    static let BUTTON_ACTIVE_TEXT_COLOR: UIColor = UIColor.init(red: 215/255.0, green: 62/255.0, blue: 133/255.0, alpha: 1.0)
    static let BUTTON_DEACTIVE_TEXT_COLOR: UIColor = UIColor.white
    static let SEARCH_BAR_TEXT_COLOR: UIColor = UIColor.white
    
    // File List
    public static let CELL_DELETE_BTN_BG_COLOR: UIColor = UIColor.init(red: 238/255.0, green: 52/255.0, blue: 51/255.0, alpha: 1.0)
    public static let CELL_UPLOAD_BTN_BG_COLOR: UIColor = UIColor.init(red: 47/255.0, green: 172/255.0, blue: 255/255.0, alpha: 1.0)
    
    
}
