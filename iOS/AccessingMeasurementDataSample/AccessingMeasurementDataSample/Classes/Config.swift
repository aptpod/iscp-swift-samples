//
//  Config.swift
//  SensorGPSDownstreamSample
//
//  Created by Ueno Masamitsu on 2020/09/23.
//  Copyright © 2020 aptpod, Inc. All rights reserved.
//

import UIKit
import intdash

class Config {
    
    /// アプリごとのOAuth2.0 Web認証用のコールバックスキーム。intdashサーバー管理者に登録を依頼してください。
    ///
    /// この値は `Info.plist` でも設定してください。
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
    
    // Intdash Serivce Options
    /// 計測一覧の時間範囲（現在からさかのぼって何秒前の計測を一覧に含めるか）
    static let INTDASH_REQUEST_MEASUREMENT_LIST_DURATION: TimeInterval = 60 * 60 * 24 * 7 // 1週間
    /// 一度に要求する計測の最大数
    static let INTDASH_REQUEST_MEASUREMENT_LIMIT: Int = 1000
    /// 要求する計測の長さの最小値
    static let INTDASH_REQUEST_MEASUREMENT_DURATION_START: TimeInterval = 0.001
    /// 一度に要求するデータポイントの最大数
    static let INTDASH_REQUEST_DATA_POINTS_LIMIT: Int = 100
    /// 次のデータポイントまでの最小時間
    static let INTDASH_REQUEST_DATA_POINTS_MIN_TIME_INTERVAL: TimeInterval = 0.000001
    
    // View Contents
    static let SEARCH_BAR_TEXT_COLOR: UIColor = UIColor.white
    static let MEASUREMENT_BASETIME_STRING_FORMAT = "yyyy/MM/dd HH:mm:ss"
    static let MEASUREMENT_DATA_TIME_STRING_FORMAT = "yyyy/MM/dd HH:mm:ss.SSSSSS"
}
