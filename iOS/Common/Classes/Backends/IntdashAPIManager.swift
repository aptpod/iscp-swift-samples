//
//  IntdashAPIManager.swift
//
//  Created by uenomasamitsu on 2023/10/23.
//  Copyright © 2023 aptpod, Inc. All rights reserved.
//

import Foundation
import intdash
import CommonCrypto

typealias Measurement = intdash.Measurement
fileprivate let kContentTypeiSCPv2Protobuf: [String: String] =  [
    "Content-Type" : "application/vnd.iscp.v2.protobuf",
    "Accept" : "application/vnd.iscp.v2.protobuf"
]
fileprivate let kContentTypeProtobuf: [String: String] = [
    "Content-Type" : "application/protobuf",
    "Accept" : "application/protobuf"
]
fileprivate let kContentTypeJson: [String: String] = [
    "Content-Type" : "application/json",
    "Accept" : "application/json"
]
let requestListEdgesLimit: Int? = 200

public enum IntdashAPIManagerError : Error {
    case dataConversionFailed
    case tokenNotFound
    case responseCodeError(code: Int)
}

public protocol IntdashAPIManagerDelegate : AnyObject {
    func didStartRefreshAccessToken(_ manager: IntdashAPIManager)
    func didFinishRefreshAccessToken(_ manager: IntdashAPIManager, result: Bool, error: Error?)
}

public class IntdashAPIManager : IntdashAPITokenRefresherDelegate {
    
    /// アクセストークンの有効期限が切れたときの通知
    static public let didTokenExpired = NSNotification.Name("IntdashAPIManager.didTokenExpired")
    
    static let shared = IntdashAPIManager()
    
    public var serverURL: String = kTargetServer {
        didSet {
            self.setMetadata()
        }
    }
    
    public var serverPath: String = "/api" {
        didSet {
            self.setMetadata()
        }
    }
    
    /// serverURL + serverPath
    public var basePath: String {
        return serverURL + serverPath
    }
    
    /// クライアントID
    public var clientId: String = kIntdashClientId
    
    /// プロジェクトID
    public var projectID: String = kProjectId
    
    public var apiResponseQueue: DispatchQueue = .global() {
        didSet {
            self.setMetadata()
        }
    }
    
    public weak var delegate: IntdashAPIManagerDelegate?
    
    /// アクセストークン
    private (set) public var accessToken: String? {
        didSet {
            self.setMetadata()
        }
    }
    /// リフレッシュトークン
    private (set) public var refreshToken: String?
    /// リフレッシュトークンの有効期限（期限切れまでの秒数）
    private (set) public var refreshTokenExpiresIn: TimeInterval?
    /// アクセストークンの有効期限（期限切れまでの秒数）
    private (set) public var expiresIn: TimeInterval?
    /// アクセストークンの取得日時。
    private (set) public var acquiredTime: Date?
    
    /// サインインしたユーザー情報
    /// `requestMeInfo` を処理すると自動でセットされる
    private (set) public var signInUserInfo: User?
    
    /// OAuth2.0のアクセストークンをリフレッシュ可能かどうか。
    public var isRefreshTokenRefreshable: Bool {
        guard let acquiredTime = acquiredTime else {
            return false
        }

        // 残り秒数
        guard let expiresIn = refreshTokenExpiresIn else {
            return false
        }

        // 経過秒数と比較
        let elapsedTime = Date().timeIntervalSince(acquiredTime)
        return elapsedTime < expiresIn
    }
    
    public var isAccessTokenEnabled : Bool {
        guard let acquiredTime = acquiredTime else {
            return false
        }
        // 残り秒数
        guard let expiresIn = expiresIn else {
            return false
        }
        
        // 経過秒数と比較
        let elapsedTime = Date().timeIntervalSince(acquiredTime)
        return elapsedTime < expiresIn
    }
    
    private var tokenRefresher: IntdashAPITokenRefresher!
    private var refreshTokenLock = NSLock()
    
    //MARK: - init
    public init() {
        self.setup()
    }
    
    private func setup() {
        self.restoreSession()
        self.tokenRefresher = IntdashAPITokenRefresher()
        self.tokenRefresher.delegate = self
    }
    
    private func setMetadata() {
        intdashAPI.basePath = self.basePath
        intdashAPI.apiResponseQueue = self.apiResponseQueue
        intdashAPI.customHeaders["Authorization"] = "Bearer \(self.accessToken ?? "")"
    }
    
    //MARK: - SessionInfo
    
    fileprivate enum SessionInfo: String {
        case serverURL = "IntdashAPIManager.serverURL"
        case serverPath = "IntdashAPIManager.serverPath"
        
        case accessToken = "IntdashAPIManager.accessToken"
        case refreshToken = "IntdashAPIManager.refreshToken"
        case expiresIn = "IntdashAPIManager.expiresIn"
        case refreshTokenExpiresIn = "IntdashAPIManager.refreshTokenExpiresIn"
        case acquiredTime = "IntdashAPIManager.acquiredTime"
    }
    
    public func saveSession() {
        let ud = UserDefaults.standard
        ud.set(self.serverURL, forKey: SessionInfo.serverURL.rawValue)
        ud.set(self.serverPath, forKey: SessionInfo.serverPath.rawValue)
        
        ud.set(self.accessToken, forKey: SessionInfo.accessToken.rawValue)
        ud.set(self.refreshToken, forKey: SessionInfo.refreshToken.rawValue)
        ud.set(self.expiresIn, forKey: SessionInfo.expiresIn.rawValue)
        ud.set(self.refreshTokenExpiresIn, forKey: SessionInfo.refreshTokenExpiresIn.rawValue)
        ud.set(self.acquiredTime, forKey: SessionInfo.acquiredTime.rawValue)
    }
    
    public func restoreSession() {
        let ud = UserDefaults.standard
        self.serverURL = ud.string(forKey: SessionInfo.serverURL.rawValue) ?? self.serverURL
        self.serverPath = ud.string(forKey: SessionInfo.serverPath.rawValue) ?? self.serverPath
        
        self.accessToken = ud.string(forKey: SessionInfo.accessToken.rawValue)
        self.refreshToken = ud.string(forKey: SessionInfo.refreshToken.rawValue)
        self.expiresIn = ud.double(forKey: SessionInfo.expiresIn.rawValue)
        self.refreshTokenExpiresIn = ud.double(forKey: SessionInfo.refreshTokenExpiresIn.rawValue)
        self.acquiredTime = ud.object(forKey: SessionInfo.acquiredTime.rawValue) as? Date
    }
    
    public func clearSession(_ withServerInfo: Bool = false) {
        let ud = UserDefaults.standard
        if withServerInfo {
            ud.set(nil, forKey: SessionInfo.serverURL.rawValue)
            ud.set(nil, forKey: SessionInfo.serverPath.rawValue)
        }
        ud.set(nil, forKey: SessionInfo.accessToken.rawValue)
        ud.set(nil, forKey: SessionInfo.refreshToken.rawValue)
        ud.set(nil, forKey: SessionInfo.expiresIn.rawValue)
        ud.set(nil, forKey: SessionInfo.refreshTokenExpiresIn.rawValue)
        ud.set(nil, forKey: SessionInfo.acquiredTime.rawValue)
        // 再読み込み
        self.restoreSession()
    }
    
    /// 有効なトークンを取得します
    ///
    /// トークンの有効期限が切れていればトークンのリフレッシュを行います
    public func getEnableToken(_ completion: @escaping ((String?) -> ())) {
        self.refreshTokenLock.lock()
        if self.isAccessTokenEnabled {
            self.refreshTokenLock.unlock()
            completion(self.accessToken)
            return
        }
        self.requestRefreshToken { [weak self] date, error in
            self?.refreshTokenLock.unlock()
            completion(self?.isAccessTokenEnabled == true ? self?.accessToken : nil)
        }
    }
        
    //MARK: - IntdashAPITokenRefresherDelegate
    func tokenRefresherWillRequestRefresh(_ tokenRefresher: IntdashAPITokenRefresher) {
        print("tokenRefresherWillRequestRefresh - IntdashAPITokenRefresherDelegate")
        self.refreshTokenLock.lock()
        if isRefreshTokenRefreshable {
            print("requestRefreshToken - IntdashAPIManager")
            delegate?.didStartRefreshAccessToken(self)
            requestRefreshToken { [weak self] date, error in
                guard let self = self else { return }
                self.refreshTokenLock.unlock()
                if let error = error {
                    print("requestRefreshToken failed. \(error.localizedDescription) - IntdashAPIManager")
                    if self.isAccessTokenEnabled == false {
                        // トークンがリフレッシュできなかったので通知
                        NotificationCenter.default.post(name: IntdashAPIManager.didTokenExpired, object: nil)
                    }
                    self.delegate?.didFinishRefreshAccessToken(self, result: false, error: nil)
                    return
                }
                print("requestRefreshToken successful. expired: \(String(describing: date)) - IntdashAPIManager")
                self.delegate?.didFinishRefreshAccessToken(self, result: true, error: nil)
            }
        } else {
            self.refreshTokenLock.unlock()
            // トークンがリフレッシュできなかったので通知
            NotificationCenter.default.post(name: IntdashAPIManager.didTokenExpired, object: nil)
        }
    }
    
    //MARK: - AuthOAuth2API
    /// 外部認証を行うURLを生成する
    public func generateOAuth2AuthorizationURL(callbackURLScheme: String, completion: @escaping (_ url: String?, _ codeVerifier: String? , _ state: String?, _ error: Error?)->()) {
        let codeVerifier = IntdashAPIManager.generateCodeVerifier()
        guard let codeChallenge = IntdashAPIManager.convertCodeChallenge(codeVerifier: codeVerifier) else {
            completion(nil, nil, nil, IntdashAPIManagerError.dataConversionFailed)
            return
        }
        let state = IntdashAPIManager.generateState()
        let res = AuthOAuth2API.oauth2AuthorizationWithRequestBuilder(
            clientId: self.clientId,
            responseType: .code,
            redirectUri: callbackURLScheme,
            state: state,
            codeChallenge: codeChallenge,
            codeChallengeMethod: .s256)
        let url = res.URLString + "&prompt=login"
        completion(url, codeVerifier, state, nil)
    }
    
    /// stateを生成する
    ///
    /// From [Section 10 of [RFC6749]](https://tools.ietf.org/html/rfc6749#section-10.12)
    static func generateState(_ length: Int = 32) -> String {
        let targetCharacters =
        "abcdefghijklmnopqrstuvwxyz" +
        "0123456789"
        
        var randomString = ""
        for _ in 0..<length {
            let random = arc4random_uniform(UInt32(targetCharacters.count))
            let index = targetCharacters.index(targetCharacters.startIndex, offsetBy: Int(random))
            randomString += String(targetCharacters[index])
        }
        return randomString
    }
    
    /// code_verifier を生成する
    ///
    /// From [Section 4.1 of [RFC7636]](https://tools.ietf.org/html/rfc7636#section-4.1)
    ///
    /// code_verifier = high-entropy cryptographic random STRING using the unreserved characters [A-Z] / [a-z] / [0-9] / "-" / "." / "_" / "~"
    /// from [Section 2.3 of [RFC3986]](https://tools.ietf.org/html/rfc3986#section-2.3), with a minimum length of 43 characters and a maximum length of 128 characters.
    static func generateCodeVerifier(_ length: Int = 128) -> String {
        let unreservedCharacters =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ" +
        "abcdefghijklmnopqrstuvwxyz" +
        "0123456789" +
        "-" + "." + "_" + "~"
        
        var randomString = ""
        for _ in 0..<length {
            let random = arc4random_uniform(UInt32(unreservedCharacters.count))
            let index = unreservedCharacters.index(unreservedCharacters.startIndex, offsetBy: Int(random))
            randomString += String(unreservedCharacters[index])
        }
        return randomString
    }
    
    /// code_verifier を code_challenge に変換する
    ///
    /// From [Section 4.2 of [RFC7636]](https://tools.ietf.org/html/rfc7636#section-4.2)
    ///
    /// code_challenge = BASE64URL-ENCODE(SHA256(ASCII(code_verifier)))
    /// Only supports S256, with a minimum length of 43 characters and a maximum length of 128 characters.
    static func convertCodeChallenge(codeVerifier: String) -> String? {
        guard let ascii = codeVerifier.data(using: .ascii) else { return nil }
        let hash = ascii.sha256
        return hash.base64URLEncodedString()
    }
    
    /// 外部認証で取得した認証コードを使用してアクセストークンを取得します。
    /// 認証に成功すると、セッション情報にアクセストークンがセットされます。
    /// - parameter code: 外部認証で取得した認証コード
    /// - parameter codeVerifier: 生成された検証コード
    ///   `generateOAuth2AuthorizationURL(callbackURLScheme:completion:)` のコールバックで返却される `codeVerifier` を使用してください。
    /// - parameter callbackURLScheme: リダイレクトURI(コールバックスキーマ)
    /// - parameter completion: 処理終了時のコールバック
    /// - parameter date: アクセストークンの有効期限
    /// - parameter error: エラー情報
    func requestAccessToken(code: String, codeVerifier: String, callbackURLScheme: String, tenantUuid: String? = nil, completion: @escaping (_ date: Date?, _ error: Error?)->()) {
        AuthOAuth2API.issueToken(
            grantType: .authorizationCode,
            tenantUuid: tenantUuid,
            clientId: self.clientId,
            redirectUri: callbackURLScheme,
            codeVerifier: codeVerifier,
            code: code) { [weak self] data, error in
                self?.processAccessTokenResponse(data, error, completion)
            }
    }
    
    /// アクセストークンのリフレッシュを行います。
    func requestRefreshToken(completion: @escaping (_ date: Date?, _ error: Error?)->()) {
        AuthOAuth2API.issueToken(
            grantType: .refreshToken,
            refreshToken: self.refreshToken,
            clientId: self.clientId) { [weak self] data, error in
                self?.processAccessTokenResponse(data, error, completion)
            }
    }
    
    func processAccessTokenResponse(_ data: InlineResponse200?, _ error: Error?, _ completion: @escaping (_ date: Date?, _ error: Error?)->()) {
        if let error = error {
            completion(nil, error)
            return
        }
        let response = data!
        self.accessToken = response.accessToken
        self.refreshToken = response.refreshToken
        if let time = response.refreshTokenExpiresIn {
            self.refreshTokenExpiresIn = TimeInterval(time)
        }
        if let time = response.expiresIn {
            self.expiresIn = TimeInterval(time)
        }
        let now = Date()
        self.acquiredTime = now
        var expirationDate: Date?
        if let time = self.expiresIn {
            expirationDate = now.addingTimeInterval(time)
            self.tokenRefresher.setTimerInterval(time / 2) // 期限切れの半分の時間でリフレッシュ
        }
        self.saveSession()
        completion(expirationDate, nil)
    }
    
    //MARK: - AuthMeAPI
    func requestMeInfo(_ completion: @escaping (_ user: User?, _ error: Error?)->()) {
        getEnableToken { [weak self] _ in
            AuthMeAPI.getMe { [weak self] user, error in
                if user != nil {
                    self?.signInUserInfo = user
                }
                completion(user, error)
            }
        }
    }
    
    //MARK: - VersionsVersionAPI
    func requestVersion(_ completion: @escaping(_ version: String?, _ error: Error?) -> ()) {
        // 認証不要
        VersionsVersionAPI.getVersion { data, error in
            completion(data?.version, error)
        }
    }
    
    //MARK: - BrokerISCPAPI
    func requestiSCPTickets(completion: @escaping (_ ticket: String?, _ error: Error?)->()) {
        getEnableToken { _ in
            BrokerISCPAPI.issueISCPTicket { data, error in
                completion(data?.ticket, error)
            }
        }
    }
    
    //MARK: - AuthProjectsAPI
    func requestListMyProjects(completion: @escaping ([Project]?, Error?)->()) {
        getEnableToken { _ in
            AuthProjectsAPI.listMyProjects { data, error in
                completion(data?.items, error)
            }
        }
    }
    
    //MARK: - AuthEdgesAPI
    /// エッジリストを取得します。
    func requestListEdges(uuid: [String]? = nil, edgeUuid: [String]? = nil, completion: @escaping ([Edge]?, Error?) -> ()) {
        self.requestProjectListEdges(projectUuid: self.projectID, edgeUuid: edgeUuid, completion: completion)
    }
    
    /// エッジリストを取得します。
    func requestProjectListEdges(projectUuid: String, edgeUuid: [String]? = nil, completion: @escaping ([Edge]?, Error?) -> ()) {
        getEnableToken { [weak self] _ in
            self?.invokeListProjectEdges(edges: [], page: 1, projectUuid: projectUuid, edgeUuid: edgeUuid, completion: completion)
        }
    }
    
    private func invokeListProjectEdges(edges: [Edge], page: Int, projectUuid: String, edgeUuid: [String]?, completion: @escaping ([Edge]?, Error?) -> ()) {
        print("invokeListEdges page: \(page) - IntdashAPIManager")
        var edges = edges
        AuthProjectEdgesAPI.listProjectEdges(projectUuid: projectUuid, edgeUuid: edgeUuid, page: page, perPage: requestListEdgesLimit) { [weak self] data, error in
            if let error = error {
                completion(nil, error)
                return
            }
            if let items = data?.items {
                for item in items {
                    edges.append(Edge(uuid: item.edgeUuid, name: item.name, nickname: item.nickname, description: "", createdAt: item.createdAt, updatedAt: item.updatedAt))
                }
            }
            guard data!.page.next else {
                completion(edges, nil)
                return
            }
            self?.invokeListProjectEdges(edges: edges, page: page+1, projectUuid: projectUuid, edgeUuid: edgeUuid, completion: completion)
        }
    }
    
    //MARK: - MeasMeasurementsAPI
    /// 計測リストを取得します。
    func requestListMeasurements(uuid: [String]? = nil, name: String? = nil, edgeUuid: String? = nil, start: TimeInterval? = nil, end: TimeInterval? = nil, basetimeType: MeasMeasurementsAPI.BasetimeType_listProjectMeasurements? = nil, durationStart: TimeInterval? = nil, limit: Int? = nil, completion: @escaping ([Measurement]?, Error?) -> ()) {
        self.requestListProjectMeasurements(projectUuid:  self.projectID, uuid: uuid, name: name, edgeUuid: edgeUuid, start: start, end: end, basetimeType: basetimeType, durationStart: durationStart, limit: limit, completion: completion)
    }
    
    /// 計測リストを取得します。
    func requestListProjectMeasurements(projectUuid: String, uuid: [String]? = nil, name: String? = nil, edgeUuid: String? = nil, start: TimeInterval? = nil, end: TimeInterval? = nil, basetimeType: MeasMeasurementsAPI.BasetimeType_listProjectMeasurements? = nil, durationStart: TimeInterval? = nil, limit: Int? = nil, completion: @escaping ([Measurement]?, Error?) -> ()) {
        var sStart: String?
        if let time = start {
            sStart = Date(timeIntervalSince1970: time).rfc3339String
        }
        var sEnd: String?
        if let time = end {
            sEnd = Date(timeIntervalSince1970: time).rfc3339String
        }
        var iDurationStart: Int64?
        if let v = durationStart {
            iDurationStart = Int64(v * 1000 * 1000)
        }
        getEnableToken { [weak self] _ in
            self?.invokeListProjectMeasurements(projectUuid: projectUuid, measurements: [], page: 1, uuid: uuid, name: name, edgeUuid: edgeUuid, start: sStart, end: sEnd, basetimeType: basetimeType, durationStart: iDurationStart, limit: limit, completion: completion)
        }
    }
    
    func invokeListProjectMeasurements(projectUuid: String, measurements: [Measurement], page: Int, uuid: [String]? = nil, name: String? = nil, edgeUuid: String? = nil, start: String? = nil, end: String? = nil, basetimeType: MeasMeasurementsAPI.BasetimeType_listProjectMeasurements? = nil, durationStart: Int64? = nil, limit: Int? = nil, completion: @escaping ([Measurement]?, Error?) -> ()) {
        var measurements = measurements
        MeasMeasurementsAPI.listProjectMeasurements(projectUuid: projectUuid, uuid: uuid, name: name, edgeUuid: edgeUuid, start: start, end: end, basetimeType: basetimeType, ended: nil, since: nil, durationStart: durationStart, durationEnd: nil, status: nil, limit: limit, sort: nil, page: page, order: nil) { [weak self] data, error in
            if let error = error {
                completion(nil, error)
                return
            }
            if let items = data?.items {
                measurements.append(contentsOf: items)
            }
            guard !data!.page.last else {
                completion(measurements, nil)
                return
            }
            self?.invokeListProjectMeasurements(projectUuid: projectUuid, measurements: measurements, page: page+1, uuid: uuid, name: name, edgeUuid: edgeUuid, start: start, end: end, basetimeType: basetimeType, durationStart: durationStart, limit: limit, completion: completion)
        }
    }
    
    /// 計測を作成します。
    func requestCreateMeasurement(basetime: TimeInterval, basetimeType: MeasurementBaseTimeType, edgeUuid: String, protected: Bool = false, completion: @escaping ((String?, Error?) -> ())) {
        self.requestCreateProjectMeasurement(projectUuid: self.projectID, basetime: basetime, basetimeType: basetimeType, edgeUuid: edgeUuid, protected: protected, completion: completion)
    }
    
    /// 計測を作成します。
    func requestCreateProjectMeasurement(projectUuid: String, basetime: TimeInterval, basetimeType: MeasurementBaseTimeType, edgeUuid: String, protected: Bool = false, completion: @escaping ((String?, Error?) -> ())) {
        let measCreate = MeasCreate(basetime: Date(timeIntervalSince1970: basetime), basetimeType: basetimeType, edgeUuid: edgeUuid, protected: protected)
        getEnableToken { _ in
            MeasMeasurementsAPI.createProjectMeasurement(projectUuid: projectUuid, measCreate: measCreate) { data, error in
                completion(data?.uuid, error)
            }
        }
    }
    
    /// 登録された計測のシーケンス情報を更新します
    func requestUpdateMeasurementSequence(sequenceUuid: String, measurementUuid: String, expectedDataPoints: Int, finalSequenceNumber: Int, completion: @escaping ((Error?) -> ())) {
        self.requestUpdateProjectMeasurementSequence(projectUuid: self.projectID, sequenceUuid:sequenceUuid, measurementUuid: measurementUuid, expectedDataPoints: expectedDataPoints, finalSequenceNumber: finalSequenceNumber, completion: completion)
    }
    
    /// 登録された計測のシーケンス情報を更新します
    func requestUpdateProjectMeasurementSequence(projectUuid: String, sequenceUuid: String, measurementUuid: String, expectedDataPoints: Int, finalSequenceNumber: Int, completion: @escaping ((Error?) -> ())) {
        let replace = MeasurementSequenceGroupReplace(expectedDataPoints: expectedDataPoints, finalSequenceNumber: finalSequenceNumber)
        getEnableToken { _ in
            MeasMeasurementsAPI.updateProjectMeasurementSequence(projectUuid: projectUuid, measurementUuid: measurementUuid.lowercased(), sequencesUuid: sequenceUuid.lowercased(), measurementSequenceGroupReplace: replace) { data, error in
                completion(error)
            }
        }
    }
    
    /// 指定した計測のステータスを送信完了状態にします
    ///
    /// この状態は回収されていないデータがエッジに残っている状態です。
    /// 完全に回収が完了した状態は `requestCompleteMeasurement` を利用します。
    func requestEndMeasurement(measurementUuid: String, completion: @escaping ((Error?) -> ())) {
        self.requestEndProjectMeasurement(projectUuid: self.projectID, measurementUuid: measurementUuid, completion: completion)
    }
    
    /// 指定した計測のステータスを送信完了状態にします
    ///
    /// この状態は回収されていないデータがエッジに残っている状態です。
    /// 完全に回収が完了した状態は `requestProjectCompleteMeasurement` を利用します。
    func requestEndProjectMeasurement(projectUuid: String, measurementUuid: String, completion: @escaping ((Error?) -> ())) {
        getEnableToken { _ in
            MeasMeasurementsAPI.endProjectMeasurement(projectUuid: projectUuid, measurementUuid: measurementUuid.lowercased()) { data, error in
                completion(error)
            }
        }
    }
    
    /// 指定した計測のステータスを完了状態にします
    func requestCompleteMeasurement(measurementUuid: String, completion: @escaping ((Error?) -> ())) {
        self.requestCompleteProjectMeasurement(projectUuid: self.projectID, measurementUuid: measurementUuid, completion: completion)
    }
    
    /// 指定した計測のステータスを完了状態にします
    func requestCompleteProjectMeasurement(projectUuid: String, measurementUuid: String, completion: @escaping ((Error?) -> ())) {
        getEnableToken { _ in
            MeasMeasurementsAPI.completeProjectMeasurement(projectUuid: projectUuid, measurementUuid: measurementUuid.lowercased()) { data, error in
                completion(error)
            }
        }
    }
    
    /// 計測情報を更新します
    ///
    /// 送信済みの基準時刻の選択を変更することが可能です。
    func requestUpdateMeasurement(measurementUuid: String, name: String? = nil, description: String? = nil, basetime: Date? = nil, basetimeType: MeasurementBaseTimeType? = nil, completion: @escaping ((Error?) -> ())) {
        self.requestUpdateProjectMeasurement(projectUuid: self.projectID, measurementUuid: measurementUuid, name: name, description: description, basetime: basetime, basetimeType: basetimeType, completion: completion)
    }
    
    /// 計測情報を更新します
    ///
    /// 送信済みの基準時刻の選択を変更することが可能です。
    func requestUpdateProjectMeasurement(projectUuid: String, measurementUuid: String, name: String? = nil, description: String? = nil, basetime: Date? = nil, basetimeType: MeasurementBaseTimeType? = nil, completion: @escaping ((Error?) -> ())) {
        let measReplace = MeasReplace(name: name, description: description, basetime: basetime, basetimeType: basetimeType)
        getEnableToken { _ in
            MeasMeasurementsAPI.updateProjectMeasurement(projectUuid: projectUuid, measurementUuid: measurementUuid.lowercased(), measReplace: measReplace) { data, error in
                completion(error)
            }
        }
    }
    
    /// 計測情報のベースタイムを更新する
    func requestUpdateMeasurementBaseTime(baseTime: TimeInterval, measurementUuid: String, type: MeasMeasurementsAPI.ModelType_updateProjectMeasurementBaseTime, completion: @escaping ((Error?) -> ())) {
        self.requestUpdateProjectMeasurementBaseTime(projectUuid: self.projectID, baseTime: baseTime, measurementUuid: measurementUuid, type: type, completion: completion)
    }
    
    /// 計測情報のベースタイムを更新する
    func requestUpdateProjectMeasurementBaseTime(projectUuid: String, baseTime: TimeInterval, measurementUuid: String, type: MeasMeasurementsAPI.ModelType_updateProjectMeasurementBaseTime, completion: @escaping ((Error?) -> ())) {
        let measBaseTimePut = MeasBaseTimePut(basetime: Date(timeIntervalSince1970: baseTime).rfc3339String)
        getEnableToken { _ in
            MeasMeasurementsAPI.updateProjectMeasurementBaseTime(projectUuid: projectUuid, measurementUuid: measurementUuid.lowercased(), type: type, measBaseTimePut: measBaseTimePut) { data, error in
                completion(error)
            }
        }
    }
    
    /// 計測にシーケンスID(StreamID)を紐づける
    func requestReplaceMeasurementSequence(sequenceUuid: String, measUuid: String, expectedDataPoints: Int, finalSequenceNumber: Int, completion: @escaping ((Error?) -> ())) {
        self.requestReplaceProjectMeasurementSequence(projectUuid: self.projectID, sequenceUuid: sequenceUuid, measUuid: measUuid, expectedDataPoints: expectedDataPoints, finalSequenceNumber: finalSequenceNumber, completion: completion)
    }
    
    /// 計測にシーケンスID(StreamID)を紐づける
    func requestReplaceProjectMeasurementSequence(projectUuid: String, sequenceUuid: String, measUuid: String, expectedDataPoints: Int, finalSequenceNumber: Int, completion: @escaping ((Error?) -> ())) {
        let replace = MeasurementSequenceGroupReplace(expectedDataPoints: expectedDataPoints, finalSequenceNumber: finalSequenceNumber)
        getEnableToken { _ in
            MeasMeasurementsAPI.replaceProjectMeasurementSequence(projectUuid: projectUuid, measurementUuid: measUuid.lowercased(), sequencesUuid: sequenceUuid.lowercased(), measurementSequenceGroupReplace: replace) { data, error in
                completion(error)
            }
        }
    }
    
    /// 指定したシーケンスにデータを登録します。
    func requestCreateMeasurementChunks(measUuid: String, sequenceUuid: String, chunks: [Pb_StoreDataChunk], completion: @escaping ((Error?) -> ())) {
        self.requestCreateProjectMeasurementChunks(projectUuid: self.projectID, measUuid: measUuid, sequenceUuid: sequenceUuid, chunks: chunks, completion: completion)
    }
    
    /// 指定したシーケンスにデータを登録します。
    func requestCreateProjectMeasurementChunks(projectUuid: String, measUuid: String, sequenceUuid: String, chunks: [Pb_StoreDataChunk], completion: @escaping ((Error?) -> ())) {
        var model = Pb_StoreDataChunks()
        model.measUuid = measUuid.lowercased()
        model.sequenceUuid = sequenceUuid.lowercased()
        model.chunks = chunks
        guard let serialized = try? model.serializedData(), let url = URL(string: basePath + "/v1/projects/\(projectUuid)/measurements/sequences/chunks") else {
            return completion(IntdashAPIManagerError.dataConversionFailed)
        }
        getEnableToken { _ in
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            for kv in intdashAPI.customHeaders {
                request.addValue(kv.value, forHTTPHeaderField: kv.key)
            }
            for kv in kContentTypeiSCPv2Protobuf {
                request.addValue(kv.value, forHTTPHeaderField: kv.key)
            }
            request.httpBody = serialized
            print("requestCreateMeasurementChunks body: \(serialized.count) bytes - IntdashV2APIManager")
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let res = response as? HTTPURLResponse, error == nil else {
                    completion(error)
                    return
                }
                if res.statusCode != 200 {
                    print("requestCreateMeasurementChunks error. responseCode: \(res.statusCode) - IntdashV2APIManager")
                }
                completion(res.statusCode == 200 ? nil : IntdashAPIManagerError.responseCodeError(code: res.statusCode))
            }
            task.resume()
        }
    }
    
    
    //MARK: - MeasDataPointsAPI
    /// データポイントのリストを取得します。
    func requestListDataPoints(name: String, filters: [String]?, start: TimeInterval?, end: TimeInterval?, limit: Int64? = nil, order: MeasDataPointsAPI.Order_listDataPoints? = nil, completion: @escaping ([Pb_DataResponseProto]?, Error?) -> ()) {
        self.requestListProjectDataPoints(projectUuid: self.projectID, name: name, filters: filters, start: start, end: end, limit: limit, order: order, completion: completion)
    }
    
    /// データポイントのリストを取得します。
    func requestListProjectDataPoints(projectUuid: String, name: String, filters: [String]?, start: TimeInterval?, end: TimeInterval?, limit: Int64? = nil, order: MeasDataPointsAPI.Order_listDataPoints? = nil, completion: @escaping ([Pb_DataResponseProto]?, Error?) -> ()) {
        var sStart: String?
        if let time = start {
            sStart = Date(timeIntervalSince1970: time).rfc3339String
        }
        var sEnd: String?
        if let time = end {
            sEnd = Date(timeIntervalSince1970: time).rfc3339String
        }
        getEnableToken { _ in
            let builder = MeasDataPointsAPI.listProjectDataPointsForProtobufWithRequestBuilder(projectUuid: projectUuid, name: name, idq: filters, start: sStart, end: sEnd, limit: limit, order: order, timeFormat: .rfc3339)
            builder.execute { result in
                switch result {
                case let .success(response):
                    let buf = ArrayBuffer(response.body ?? Data())
                    let totalLen = buf.count
                    var index = 0
                    var len = 0
                    var payload: Data
                    do {
                        var list = [Pb_DataResponseProto]()
                        while index < totalLen {
                            len = Int(buf.loadUInt64())
                            payload = buf.loadData(len)
                            let data = try Pb_DataResponseProto(serializedData: payload)
                            list.append(data)
                            index += (8 + len)
                        }
                        completion(list, nil)
                    } catch {
                        print("decode DataResponseProto error. \(error.localizedDescription), payload length: \(len) bytes - IntdashV2APIManager")
                        completion(nil, error)
                    }
                case let .failure(error):
                    completion(nil, error)
                }
            }
        }
    }
}

fileprivate extension Data {
    
    var sha256: Data {
        var digest = [UInt8].init(repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        self.withUnsafeBytes { bytes in
            _ = CC_SHA256(bytes.baseAddress, CC_LONG(self.count), &digest)
        }
        return Data(digest)
    }
    
    func base64URLEncodedString() -> String {
        let base64 = base64EncodedString()
        let base64url = String(base64
            .dropLast()
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_"))
            .replacingOccurrences(of: "=", with: "")
        return base64url
    }
    
}

fileprivate class ArrayBuffer {
    
    private var data: Data
    public let count: Int
    
    private var index: Int = 0
    
    public init(_ data: Data) {
        self.data = data
        self.count = data.count
    }
    
    public func loadUInt64(isLittleEndian: Bool = true) -> UInt64 {
        var v: UInt64 = 0
        let size = MemoryLayout<UInt64>.size
        data.withUnsafeBytes { ptr -> Void in
            memcpy(&v, ptr.bindMemory(to: UInt8.self).baseAddress!.advanced(by: index), size)
        }
        if isLittleEndian { v = UInt64(littleEndian: v)
        } else { v = UInt64(bigEndian: v) }
        index += size
        return v
    }
    
    public func loadData(_ len: Int) -> Data {
        let v = data[index..<index+len]
        index += len
        return v
    }
}
