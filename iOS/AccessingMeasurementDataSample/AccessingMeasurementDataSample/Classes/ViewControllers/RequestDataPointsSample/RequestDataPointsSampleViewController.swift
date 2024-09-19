//
//  RequestDataPointsSampleViewController.swift
//  AccessingMeasurementDataSample
//
//  Created by Ueno Masamitsu on 2021/02/05.
//  Copyright © 2021 aptpod, Inc. All rights reserved.
//

import UIKit
import intdash

fileprivate let kViewTitle = "Data Points"

class RequestDataPointsSampleViewController: UIViewController {
    
    static let VIEW_IDENTIFIER = "requestDataPointsSampleView"
    
    // App Delegate
    let app: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dispCntLabel: UILabel! 
    
    //MARK: - Intdash API
    var api: IntdashAPIManager = IntdashAPIManager.shared

    var dataPointList: [Pb_DataResponseProto] = []
    
    var listDataLock = NSLock()
    var reloadRequestFlag: Bool = false
    
    // Loading Dialog
    var loadingDialog: LoadingAlertDialogView?
    
    var measurementID: String = ""
    var baseTime: TimeInterval = 0
    var duration: TimeInterval = 0
    var elapsedTime: TimeInterval = 0
    
    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad - RequestDataPointsSampleViewController")
        self.navigationItem.title = kViewTitle
        // TableView
        self.setupTableView()
        guard let measurement = self.app.targetMeasurement, let baseTime = measurement.baseTimeDate, let duration = measurement.durationValue else {
            print("Failed to get measurement data.")
            AlertDialogView.showAlert(viewController: self, message: "Failed to get measurement data.")
            self.navigationController?.popViewController(animated: true)
            return
        }
        self.measurementID = measurement.uuid
        self.baseTime = baseTime.timeIntervalSince1970
        self.duration = duration
        // DataPoints
        self.updateDataPoints(elapsedTime: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear - RequestDataPointsSampleViewController")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear - RequestDataPointsSampleViewController")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear - RequestDataPointsSampleViewController")
       
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewWillDisappear - RequestDataPointsSampleViewController")
    }

    deinit {
        print("deinit - RequestDataPointsSampleViewController")
    }
    
    //MARK: - ViewEvents
    
    @IBAction func resetBtnPushed(_ sender: Any) {
        print("resetBtnPushed")
        self.updateDataPoints(elapsedTime: 0)
    }
    
    @IBAction func nextBtnPushed(_ sender: Any) {
        print("nextBtnPushed")
        self.updateDataPoints(elapsedTime: self.elapsedTime)
    }
    
    func updateDataPoints(elapsedTime: TimeInterval) {
        let start = self.baseTime + elapsedTime
        // データポイントリクエスト時の終点（end）と同時刻のデータは含めないため、終点を含める様にマージンをセットします。
        let end = self.baseTime + self.duration + Config.INTDASH_REQUEST_DATA_POINTS_MIN_TIME_INTERVAL
        guard start < end else {
            self.dataPointList = []
            self.tableView.reloadData()
            return
        }
        // 要求するデータのフィルターを作成する
        let filters = makeRequestDataPointsFilters()
        self.loadingDialog = LoadingAlertDialogView.init(addView: self.app.window!, showMessageLabel: false)
        self.loadingDialog?.startAnimating()
        DispatchQueue.global().async { [weak self] in
            /// 1回のリクエストでは取得できない多数のデータポイントを取得する方法2種
            /// A: 時間範囲の起点（start）と終点（end）を指定し、
            ///    1回のリクエストで取得するデータポイント数(limit)を設定してリクエストする(このサンプルで行っている方法)。
            ///    レスポンスとしてデータポイントのリストを得たら、次のリクエストで、
            ///    前のリクエストで取得したデータポイントの中で最大の経過時間（最も遅い時刻を持つデータポイントの経過時間）を、
            ///    起点（start）として指定し、リストの続きを取得する。
            ///    レスポンスに含まれるデータポイントが0個になるまでこれを繰り返す。
            ///
            /// B: 1回のリクエストで取得するデータポイント数は制限せず、一定の時間範囲（例：10秒間。ただしマージンを減算）を指定してリクエストする。
            ///    レスポンスとしてデータポイントのリストを得たら、次のリクエストで、リストの続き（次の10秒間に含まれるデータポイント）を取得する。
            ///    必要なだけこれを繰り返す。
            ///    例) 10秒間ずつデータポイントを取得する場合の例
            ///    let kRequestDuration: TimeInterval = 10
            ///    startTime = baseTime + elapsedTime
            ///    endTime = startTime + kRequestDuration
            ///    // Request...
            ///    elapsedTime += kRequestDuration
            ///    // 次のデータを取得
            ///
            IntdashAPIManager.shared.requestListDataPoints(name: self?.measurementID ?? "", filters: filters, start: start, end: end, order: .asc) { response, error in
                let dataPoints = response ?? []
                print("Data points size: \(dataPoints.count)")
                self?.dataPointList = dataPoints
                var timestamp: TimeInterval = 0
                // データの最終経過時間を取得
                for point in dataPoints {
                    let t = point.time.timeIntervalSince1970
                    if timestamp < t {
                        timestamp = t
                    }
                }
                if timestamp > 0 {
                    self?.elapsedTime = timestamp - self!.baseTime
                    print("timestamp: \(timestamp), elapsedTime: \(self!.elapsedTime), \(self!.elapsedTime + self!.baseTime), \(Date(timeIntervalSince1970: timestamp).rfc3339String)")
                }
                DispatchQueue.main.async {
                    self?.loadingDialog?.stopAnimating()
                    self?.loadingDialog = nil
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    func makeRequestDataPointsFilters() -> [String] {
        // リクエストするデータポイントのフィルターを作成する
        let filters = [String]()
        // 何も指定しない場合は全チャンネル、全データを取得されます
        // IDは数値または文字列で指定する
//        filters.append(dataType: .generalSensor, channelNum: self.app.targetChannel, id: IntdashData.DataGeneralSensor.SensorId.acceleration.rawValue)
//        filters.append(dataType: .generalSensor, channelNum: self.app.targetChannel, id: IntdashData.DataGeneralSensor.SensorId.gravity.rawValue)
//        filters.append(dataType: .generalSensor, channelNum: self.app.targetChannel, id: IntdashData.DataGeneralSensor.SensorId.rotationRate.rawValue)
//        filters.append(dataType: .generalSensor, channelNum: self.app.targetChannel, id: IntdashData.DataGeneralSensor.SensorId.orientationAngle.rawValue)
//        filters.append(dataType: .generalSensor, channelNum: self.app.targetChannel, id: IntdashData.DataGeneralSensor.SensorId.geoLocationCoordinate.rawValue)
//        filters.append(dataType: .generalSensor, channelNum: self.app.targetChannel, id: IntdashData.DataGeneralSensor.SensorId.geoLocationHeading.rawValue)
//        filters.append(dataType: .jpeg, channelNum: self.app.targetChannel, id: nil)
//        filters.append(dataType: .float, channelNum: self.app.targetChannel, ids: ["lat", "lng", "head"])
        return filters
    }
}
