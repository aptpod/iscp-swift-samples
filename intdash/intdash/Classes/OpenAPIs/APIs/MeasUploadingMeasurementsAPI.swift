//
// MeasUploadingMeasurementsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class MeasUploadingMeasurementsAPI {

    /**
     * enum for parameter sort
     */
    public enum Sort_listMeasurementStatuses: String, CaseIterable {
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    /**
     * enum for parameter order
     */
    public enum Order_listMeasurementStatuses: String, CaseIterable {
        case asc = "asc"
        case desc = "desc"
    }

    /**
     List Uploading Statuses of Measurements
     
     - parameter limit: (query) 1回のリクエストで取得する件数 (optional)
     - parameter sort: (query) 並べ替えに使用するキー (optional, default to .createdAt)
     - parameter page: (query) 取得するページの番号 (optional)
     - parameter order: (query) 並べ替えの順序 (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @available(*, deprecated, message: "This operation is deprecated.")
    open class func listMeasurementStatuses(limit: Int? = nil, sort: Sort_listMeasurementStatuses? = nil, page: Int? = nil, order: Order_listMeasurementStatuses? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: MeasurementUploadStatusesGetResponse?, _ error: Error?) -> Void)) {
        listMeasurementStatusesWithRequestBuilder(limit: limit, sort: sort, page: page, order: order).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     List Uploading Statuses of Measurements
     - GET /v1/measurements/upload
     - （ **Deprecated** このエンドポイントではなく、`GET /measurements/jobs` を使用してください。） 計測のアップロードのリストを取得します。
     - parameter limit: (query) 1回のリクエストで取得する件数 (optional)
     - parameter sort: (query) 並べ替えに使用するキー (optional, default to .createdAt)
     - parameter page: (query) 取得するページの番号 (optional)
     - parameter order: (query) 並べ替えの順序 (optional)
     - returns: RequestBuilder<MeasurementUploadStatusesGetResponse> 
     */
    @available(*, deprecated, message: "This operation is deprecated.")
    open class func listMeasurementStatusesWithRequestBuilder(limit: Int? = nil, sort: Sort_listMeasurementStatuses? = nil, page: Int? = nil, order: Order_listMeasurementStatuses? = nil) -> RequestBuilder<MeasurementUploadStatusesGetResponse> {
        let localVariablePath = "/v1/measurements/upload"
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "limit": limit?.encodeToJSON(),
            "sort": sort?.encodeToJSON(),
            "page": page?.encodeToJSON(),
            "order": order?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<MeasurementUploadStatusesGetResponse>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     * enum for parameter sort
     */
    public enum Sort_listProjectMeasurementStatuses: String, CaseIterable {
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    /**
     * enum for parameter order
     */
    public enum Order_listProjectMeasurementStatuses: String, CaseIterable {
        case asc = "asc"
        case desc = "desc"
    }

    /**
     List Project Uploading Statuses of Measurements
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter limit: (query) 1回のリクエストで取得する件数 (optional)
     - parameter sort: (query) 並べ替えに使用するキー (optional, default to .createdAt)
     - parameter page: (query) 取得するページの番号 (optional)
     - parameter order: (query) 並べ替えの順序 (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @available(*, deprecated, message: "This operation is deprecated.")
    open class func listProjectMeasurementStatuses(projectUuid: String, limit: Int? = nil, sort: Sort_listProjectMeasurementStatuses? = nil, page: Int? = nil, order: Order_listProjectMeasurementStatuses? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: MeasurementUploadStatusesGetResponse?, _ error: Error?) -> Void)) {
        listProjectMeasurementStatusesWithRequestBuilder(projectUuid: projectUuid, limit: limit, sort: sort, page: page, order: order).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     List Project Uploading Statuses of Measurements
     - GET /v1/projects/{project_uuid}/measurements/upload
     - （ **Deprecated** このエンドポイントではなく、`GET /measurements/jobs` を使用してください。） 計測のアップロードのリストを取得します。
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter limit: (query) 1回のリクエストで取得する件数 (optional)
     - parameter sort: (query) 並べ替えに使用するキー (optional, default to .createdAt)
     - parameter page: (query) 取得するページの番号 (optional)
     - parameter order: (query) 並べ替えの順序 (optional)
     - returns: RequestBuilder<MeasurementUploadStatusesGetResponse> 
     */
    @available(*, deprecated, message: "This operation is deprecated.")
    open class func listProjectMeasurementStatusesWithRequestBuilder(projectUuid: String, limit: Int? = nil, sort: Sort_listProjectMeasurementStatuses? = nil, page: Int? = nil, order: Order_listProjectMeasurementStatuses? = nil) -> RequestBuilder<MeasurementUploadStatusesGetResponse> {
        var localVariablePath = "/v1/projects/{project_uuid}/measurements/upload"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "limit": limit?.encodeToJSON(),
            "sort": sort?.encodeToJSON(),
            "page": page?.encodeToJSON(),
            "order": order?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<MeasurementUploadStatusesGetResponse>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     * enum for parameter baseTimeType
     */
    public enum BaseTimeType_uploadMeasurement: String, CaseIterable {
        case edgeRtc = "edge_rtc"
        case ntp = "ntp"
        case gps = "gps"
        case apiFirstReceived = "api_first_received"
        case volatile = "volatile"
        case manual = "manual"
        case undefined = "undefined"
    }

    /**
     Create Measurement from CSV File
     
     - parameter edgeUuid: (form) エッジのUUID 
     - parameter dataFile: (form) アップロードするファイル 
     - parameter baseTime: (form) 計測の基準時刻。MP4ファイルをアップロードする場合は必須です。 (optional)
     - parameter baseTimeType: (form) 基準時刻のタイプ (optional, default to .edgeRtc)
     - parameter channel: (form) 計測のチャンネル（十進表記の文字列） (optional)
     - parameter measEnd: (form) &#x60;true&#x60; にすると、計測は終了したものとして扱われます。 (optional)
     - parameter labelDataType: (form) 列名とデータタイプの対応。 データタイプは、 &#x60;int&#x60; 、&#x60; string&#x60; 、 &#x60;float&#x60; のいずれかを指定してください。 例: &#x60;&#x60;&#x60; {   \\\&quot;column_1\\\&quot;: \\\&quot;float\\\&quot;,   \\\&quot;column_2\\\&quot;: \\\&quot;string\\\&quot;,   \\\&quot;column_3\\\&quot;: \\\&quot;int\\\&quot; } &#x60;&#x60;&#x60; (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func uploadMeasurement(edgeUuid: UUID, dataFile: URL, baseTime: Date? = nil, baseTimeType: BaseTimeType_uploadMeasurement? = nil, channel: Int? = nil, measEnd: Bool? = nil, labelDataType: String? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: MeasurementUploadPostResponse?, _ error: Error?) -> Void)) {
        uploadMeasurementWithRequestBuilder(edgeUuid: edgeUuid, dataFile: dataFile, baseTime: baseTime, baseTimeType: baseTimeType, channel: channel, measEnd: measEnd, labelDataType: labelDataType).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Create Measurement from CSV File
     - POST /v1/measurements/upload
     - CSVまたはMP4（**MP4はexperimental**）ファイルをアップロードし、計測を作成します。 計測には、指定されたエッジUUIDが関連付けられます。  `base_time` （基準時刻）は、RFC3339による表現か、UNIX時刻（マイクロ秒）を指定してください。 基準時刻が指定されていない場合は、CSVファイルのデータ行の1行目の時刻が基準時刻として使用されます。 CSVファイルのデータは、時刻順にソートされている必要があります。 `meas_end` パラメーターの設定は任意です。指定しない場合、 `true` となります。  CSVファイルの例: ``` time,       col1,   col2, col3,      col4,   col5, col6,      col7,   col8, col9,      col10 1539263579, val11,  12,   13.12345,  val14,  15,   16.12345,  val17,  18, 19.12345,  val110 1539263580, val21,  22,   23.12345,  val24,  25,   26.12345,  val27,  28, 29.12345,  val210 1539263581, val31,  32,   33.12345,  val34,  35,   36.12345,  val37,  38, 39.12345,  val310 1539263582, val41,  42,   43.12345,  val44,  45,   46.12345,  val47,  48, 49.12345,  val410 ``` 空白行がある場合、行番号のカウントは加算されますが、その行は処理されません。 例えば、以下のような場合の空白行は無視されます。 ``` time,       col1,   col2, col3,      col4,   col5, col6,      col7,   col8, col9,      col10 1539263579, val11,  12,   13.12345,  val14,  15,   16.12345,  val17,  18, 19.12345,  val110  1539263581, val31,  32,   33.12345,  val34,  35,   36.12345,  val37,  38, 39.12345,  val310 1539263582, val41,  42,   43.12345,  val44,  45,   46.12345,  val47,  48, 49.12345,  val410 ```  [Go parser library](https://golang.org/pkg/encoding/csv/) も参照してください。  時刻の列には、RFC3339による表現か、UNIX時刻（秒）を使用することができます。 ## エスケープ 値の内部で `,` を使用したい場合は、その値全体を `\"` で囲んでください。 また、値の内部で `\"` を使用したい場合は、値全体を `\"` で囲み、さらに、 `\"` を `\"\"` のように表記してください。 値を `\"` で囲まないと、CSVファイルのパースの際にエラーが発生します。  エスケープの例: ``` time,col1 1539263579,\"ab,cde\"                  .....OK (parsed as 'ab,cde') 1539263579,\"ab\"\"cde\"                 .....OK (parsed as 'ab\"cde') 1539263579,     abcde                .....OK (parsed as '     abcde') 1539263579,\"     abcde\"              .....OK (parsed as '     abcde') 1539263579,ab\"cde                    .....NG 1539263579, \"abcde\"                  .....NG 1539263579,ab,cde                    .....NG(wrong number of fields) ```
     - parameter edgeUuid: (form) エッジのUUID 
     - parameter dataFile: (form) アップロードするファイル 
     - parameter baseTime: (form) 計測の基準時刻。MP4ファイルをアップロードする場合は必須です。 (optional)
     - parameter baseTimeType: (form) 基準時刻のタイプ (optional, default to .edgeRtc)
     - parameter channel: (form) 計測のチャンネル（十進表記の文字列） (optional)
     - parameter measEnd: (form) &#x60;true&#x60; にすると、計測は終了したものとして扱われます。 (optional)
     - parameter labelDataType: (form) 列名とデータタイプの対応。 データタイプは、 &#x60;int&#x60; 、&#x60; string&#x60; 、 &#x60;float&#x60; のいずれかを指定してください。 例: &#x60;&#x60;&#x60; {   \\\&quot;column_1\\\&quot;: \\\&quot;float\\\&quot;,   \\\&quot;column_2\\\&quot;: \\\&quot;string\\\&quot;,   \\\&quot;column_3\\\&quot;: \\\&quot;int\\\&quot; } &#x60;&#x60;&#x60; (optional)
     - returns: RequestBuilder<MeasurementUploadPostResponse> 
     */
    open class func uploadMeasurementWithRequestBuilder(edgeUuid: UUID, dataFile: URL, baseTime: Date? = nil, baseTimeType: BaseTimeType_uploadMeasurement? = nil, channel: Int? = nil, measEnd: Bool? = nil, labelDataType: String? = nil) -> RequestBuilder<MeasurementUploadPostResponse> {
        let localVariablePath = "/v1/measurements/upload"
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableFormParams: [String: Any?] = [
            "edge_uuid": edgeUuid.encodeToJSON(),
            "base_time": baseTime?.encodeToJSON(),
            "base_time_type": baseTimeType?.encodeToJSON(),
            "channel": channel?.encodeToJSON(),
            "meas_end": measEnd?.encodeToJSON(),
            "label_data_type": labelDataType?.encodeToJSON(),
            "data_file": dataFile.encodeToJSON(),
        ]

        let localVariableNonNullParameters = APIHelper.rejectNil(localVariableFormParams)
        let localVariableParameters = APIHelper.convertBoolToString(localVariableNonNullParameters)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            "Content-Type": "multipart/form-data",
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<MeasurementUploadPostResponse>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Store Data Points by CSV File
     
     - parameter measurementUuid: (path) 計測のUUID 
     - parameter dataFile: (form) アップロードするファイル 
     - parameter channel: (form) 作成された計測のチャンネル (optional)
     - parameter measEnd: (form) * &#x60;true&#x60; : 終了した計測 * &#x60;false&#x60; : 終了していない計測 (optional)
     - parameter labelDataType: (form) 列名とデータタイプの対応。 データタイプは、 &#x60;int&#x60; 、&#x60; string&#x60; 、 &#x60;float&#x60; のいずれかを指定してください。 例: &#x60;&#x60;&#x60; {   \\\&quot;column_1\\\&quot;: \\\&quot;float\\\&quot;,   \\\&quot;column_2\\\&quot;: \\\&quot;string\\\&quot;,   \\\&quot;column_3\\\&quot;: \\\&quot;int\\\&quot; } &#x60;&#x60;&#x60; (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func uploadMeasurementIntoMeasurement(measurementUuid: String, dataFile: URL, channel: Int? = nil, measEnd: Bool? = nil, labelDataType: String? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: MeasurementUploadPostResponse?, _ error: Error?) -> Void)) {
        uploadMeasurementIntoMeasurementWithRequestBuilder(measurementUuid: measurementUuid, dataFile: dataFile, channel: channel, measEnd: measEnd, labelDataType: labelDataType).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Store Data Points by CSV File
     - POST /v1/measurements/{measurement_uuid}/upload
     - CSVファイルをアップロードし、計測にデータを追加します。
     - parameter measurementUuid: (path) 計測のUUID 
     - parameter dataFile: (form) アップロードするファイル 
     - parameter channel: (form) 作成された計測のチャンネル (optional)
     - parameter measEnd: (form) * &#x60;true&#x60; : 終了した計測 * &#x60;false&#x60; : 終了していない計測 (optional)
     - parameter labelDataType: (form) 列名とデータタイプの対応。 データタイプは、 &#x60;int&#x60; 、&#x60; string&#x60; 、 &#x60;float&#x60; のいずれかを指定してください。 例: &#x60;&#x60;&#x60; {   \\\&quot;column_1\\\&quot;: \\\&quot;float\\\&quot;,   \\\&quot;column_2\\\&quot;: \\\&quot;string\\\&quot;,   \\\&quot;column_3\\\&quot;: \\\&quot;int\\\&quot; } &#x60;&#x60;&#x60; (optional)
     - returns: RequestBuilder<MeasurementUploadPostResponse> 
     */
    open class func uploadMeasurementIntoMeasurementWithRequestBuilder(measurementUuid: String, dataFile: URL, channel: Int? = nil, measEnd: Bool? = nil, labelDataType: String? = nil) -> RequestBuilder<MeasurementUploadPostResponse> {
        var localVariablePath = "/v1/measurements/{measurement_uuid}/upload"
        let measurementUuidPreEscape = "\(APIHelper.mapValueToPathItem(measurementUuid))"
        let measurementUuidPostEscape = measurementUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{measurement_uuid}", with: measurementUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableFormParams: [String: Any?] = [
            "channel": channel?.encodeToJSON(),
            "meas_end": measEnd?.encodeToJSON(),
            "label_data_type": labelDataType?.encodeToJSON(),
            "data_file": dataFile.encodeToJSON(),
        ]

        let localVariableNonNullParameters = APIHelper.rejectNil(localVariableFormParams)
        let localVariableParameters = APIHelper.convertBoolToString(localVariableNonNullParameters)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            "Content-Type": "multipart/form-data",
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<MeasurementUploadPostResponse>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     * enum for parameter baseTimeType
     */
    public enum BaseTimeType_uploadProjectMeasurement: String, CaseIterable {
        case edgeRtc = "edge_rtc"
        case ntp = "ntp"
        case gps = "gps"
        case apiFirstReceived = "api_first_received"
        case volatile = "volatile"
        case manual = "manual"
        case undefined = "undefined"
    }

    /**
     Create Project Measurement from CSV File
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter edgeUuid: (form) エッジのUUID 
     - parameter dataFile: (form) アップロードするファイル 
     - parameter baseTime: (form) 計測の基準時刻。MP4ファイルをアップロードする場合は必須です。 (optional)
     - parameter baseTimeType: (form) 基準時刻のタイプ (optional, default to .edgeRtc)
     - parameter channel: (form) 計測のチャンネル（十進表記の文字列） (optional)
     - parameter measEnd: (form) &#x60;true&#x60; にすると、計測は終了したものとして扱われます。 (optional)
     - parameter labelDataType: (form) 列名とデータタイプの対応。 データタイプは、 &#x60;int&#x60; 、&#x60; string&#x60; 、 &#x60;float&#x60; のいずれかを指定してください。 例: &#x60;&#x60;&#x60; {   \\\&quot;column_1\\\&quot;: \\\&quot;float\\\&quot;,   \\\&quot;column_2\\\&quot;: \\\&quot;string\\\&quot;,   \\\&quot;column_3\\\&quot;: \\\&quot;int\\\&quot; } &#x60;&#x60;&#x60; (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func uploadProjectMeasurement(projectUuid: String, edgeUuid: UUID, dataFile: URL, baseTime: Date? = nil, baseTimeType: BaseTimeType_uploadProjectMeasurement? = nil, channel: Int? = nil, measEnd: Bool? = nil, labelDataType: String? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: MeasurementUploadPostResponse?, _ error: Error?) -> Void)) {
        uploadProjectMeasurementWithRequestBuilder(projectUuid: projectUuid, edgeUuid: edgeUuid, dataFile: dataFile, baseTime: baseTime, baseTimeType: baseTimeType, channel: channel, measEnd: measEnd, labelDataType: labelDataType).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Create Project Measurement from CSV File
     - POST /v1/projects/{project_uuid}/measurements/upload
     - CSVまたはMP4（**MP4はexperimental**）ファイルをアップロードし、計測を作成します。 計測には、指定されたエッジUUIDが関連付けられます。  `base_time` （基準時刻）は、RFC3339による表現か、UNIX時刻（マイクロ秒）を指定してください。 基準時刻が指定されていない場合は、CSVファイルのデータ行の1行目の時刻が基準時刻として使用されます。 CSVファイルのデータは、時刻順にソートされている必要があります。 `meas_end` パラメーターの設定は任意です。指定しない場合、 `true` となります。  CSVファイルの例: ``` time,       col1,   col2, col3,      col4,   col5, col6,      col7,   col8, col9,      col10 1539263579, val11,  12,   13.12345,  val14,  15,   16.12345,  val17,  18, 19.12345,  val110 1539263580, val21,  22,   23.12345,  val24,  25,   26.12345,  val27,  28, 29.12345,  val210 1539263581, val31,  32,   33.12345,  val34,  35,   36.12345,  val37,  38, 39.12345,  val310 1539263582, val41,  42,   43.12345,  val44,  45,   46.12345,  val47,  48, 49.12345,  val410 ``` 空白行がある場合、行番号のカウントは加算されますが、その行は処理されません。 例えば、以下のような場合の空白行は無視されます。 ``` time,       col1,   col2, col3,      col4,   col5, col6,      col7,   col8, col9,      col10 1539263579, val11,  12,   13.12345,  val14,  15,   16.12345,  val17,  18, 19.12345,  val110  1539263581, val31,  32,   33.12345,  val34,  35,   36.12345,  val37,  38, 39.12345,  val310 1539263582, val41,  42,   43.12345,  val44,  45,   46.12345,  val47,  48, 49.12345,  val410 ```  [Go parser library](https://golang.org/pkg/encoding/csv/) も参照してください。  時刻の列には、RFC3339による表現か、UNIX時刻（秒）を使用することができます。 ## エスケープ 値の内部で `,` を使用したい場合は、その値全体を `\"` で囲んでください。 また、値の内部で `\"` を使用したい場合は、値全体を `\"` で囲み、さらに、 `\"` を `\"\"` のように表記してください。 値を `\"` で囲まないと、CSVファイルのパースの際にエラーが発生します。  エスケープの例: ``` time,col1 1539263579,\"ab,cde\"                  .....OK (parsed as 'ab,cde') 1539263579,\"ab\"\"cde\"                 .....OK (parsed as 'ab\"cde') 1539263579,     abcde                .....OK (parsed as '     abcde') 1539263579,\"     abcde\"              .....OK (parsed as '     abcde') 1539263579,ab\"cde                    .....NG 1539263579, \"abcde\"                  .....NG 1539263579,ab,cde                    .....NG(wrong number of fields) ```
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter edgeUuid: (form) エッジのUUID 
     - parameter dataFile: (form) アップロードするファイル 
     - parameter baseTime: (form) 計測の基準時刻。MP4ファイルをアップロードする場合は必須です。 (optional)
     - parameter baseTimeType: (form) 基準時刻のタイプ (optional, default to .edgeRtc)
     - parameter channel: (form) 計測のチャンネル（十進表記の文字列） (optional)
     - parameter measEnd: (form) &#x60;true&#x60; にすると、計測は終了したものとして扱われます。 (optional)
     - parameter labelDataType: (form) 列名とデータタイプの対応。 データタイプは、 &#x60;int&#x60; 、&#x60; string&#x60; 、 &#x60;float&#x60; のいずれかを指定してください。 例: &#x60;&#x60;&#x60; {   \\\&quot;column_1\\\&quot;: \\\&quot;float\\\&quot;,   \\\&quot;column_2\\\&quot;: \\\&quot;string\\\&quot;,   \\\&quot;column_3\\\&quot;: \\\&quot;int\\\&quot; } &#x60;&#x60;&#x60; (optional)
     - returns: RequestBuilder<MeasurementUploadPostResponse> 
     */
    open class func uploadProjectMeasurementWithRequestBuilder(projectUuid: String, edgeUuid: UUID, dataFile: URL, baseTime: Date? = nil, baseTimeType: BaseTimeType_uploadProjectMeasurement? = nil, channel: Int? = nil, measEnd: Bool? = nil, labelDataType: String? = nil) -> RequestBuilder<MeasurementUploadPostResponse> {
        var localVariablePath = "/v1/projects/{project_uuid}/measurements/upload"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableFormParams: [String: Any?] = [
            "edge_uuid": edgeUuid.encodeToJSON(),
            "base_time": baseTime?.encodeToJSON(),
            "base_time_type": baseTimeType?.encodeToJSON(),
            "channel": channel?.encodeToJSON(),
            "meas_end": measEnd?.encodeToJSON(),
            "label_data_type": labelDataType?.encodeToJSON(),
            "data_file": dataFile.encodeToJSON(),
        ]

        let localVariableNonNullParameters = APIHelper.rejectNil(localVariableFormParams)
        let localVariableParameters = APIHelper.convertBoolToString(localVariableNonNullParameters)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            "Content-Type": "multipart/form-data",
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<MeasurementUploadPostResponse>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Store Project Data Points by CSV File
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter measurementUuid: (path) 計測のUUID 
     - parameter dataFile: (form) アップロードするファイル 
     - parameter channel: (form) 作成された計測のチャンネル (optional)
     - parameter measEnd: (form) * &#x60;true&#x60; : 終了した計測 * &#x60;false&#x60; : 終了していない計測 (optional)
     - parameter labelDataType: (form) 列名とデータタイプの対応。 データタイプは、 &#x60;int&#x60; 、&#x60; string&#x60; 、 &#x60;float&#x60; のいずれかを指定してください。 例: &#x60;&#x60;&#x60; {   \\\&quot;column_1\\\&quot;: \\\&quot;float\\\&quot;,   \\\&quot;column_2\\\&quot;: \\\&quot;string\\\&quot;,   \\\&quot;column_3\\\&quot;: \\\&quot;int\\\&quot; } &#x60;&#x60;&#x60; (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func uploadProjectMeasurementIntoMeasurement(projectUuid: String, measurementUuid: String, dataFile: URL, channel: Int? = nil, measEnd: Bool? = nil, labelDataType: String? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: MeasurementUploadPostResponse?, _ error: Error?) -> Void)) {
        uploadProjectMeasurementIntoMeasurementWithRequestBuilder(projectUuid: projectUuid, measurementUuid: measurementUuid, dataFile: dataFile, channel: channel, measEnd: measEnd, labelDataType: labelDataType).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Store Project Data Points by CSV File
     - POST /v1/projects/{project_uuid}/measurements/{measurement_uuid}/upload
     - CSVファイルをアップロードし、計測にデータを追加します。
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter measurementUuid: (path) 計測のUUID 
     - parameter dataFile: (form) アップロードするファイル 
     - parameter channel: (form) 作成された計測のチャンネル (optional)
     - parameter measEnd: (form) * &#x60;true&#x60; : 終了した計測 * &#x60;false&#x60; : 終了していない計測 (optional)
     - parameter labelDataType: (form) 列名とデータタイプの対応。 データタイプは、 &#x60;int&#x60; 、&#x60; string&#x60; 、 &#x60;float&#x60; のいずれかを指定してください。 例: &#x60;&#x60;&#x60; {   \\\&quot;column_1\\\&quot;: \\\&quot;float\\\&quot;,   \\\&quot;column_2\\\&quot;: \\\&quot;string\\\&quot;,   \\\&quot;column_3\\\&quot;: \\\&quot;int\\\&quot; } &#x60;&#x60;&#x60; (optional)
     - returns: RequestBuilder<MeasurementUploadPostResponse> 
     */
    open class func uploadProjectMeasurementIntoMeasurementWithRequestBuilder(projectUuid: String, measurementUuid: String, dataFile: URL, channel: Int? = nil, measEnd: Bool? = nil, labelDataType: String? = nil) -> RequestBuilder<MeasurementUploadPostResponse> {
        var localVariablePath = "/v1/projects/{project_uuid}/measurements/{measurement_uuid}/upload"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let measurementUuidPreEscape = "\(APIHelper.mapValueToPathItem(measurementUuid))"
        let measurementUuidPostEscape = measurementUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{measurement_uuid}", with: measurementUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableFormParams: [String: Any?] = [
            "channel": channel?.encodeToJSON(),
            "meas_end": measEnd?.encodeToJSON(),
            "label_data_type": labelDataType?.encodeToJSON(),
            "data_file": dataFile.encodeToJSON(),
        ]

        let localVariableNonNullParameters = APIHelper.rejectNil(localVariableFormParams)
        let localVariableParameters = APIHelper.convertBoolToString(localVariableNonNullParameters)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            "Content-Type": "multipart/form-data",
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<MeasurementUploadPostResponse>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}
