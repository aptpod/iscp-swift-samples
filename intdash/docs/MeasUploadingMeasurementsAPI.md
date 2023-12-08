# MeasUploadingMeasurementsAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**listMeasurementStatuses**](MeasUploadingMeasurementsAPI.md#listmeasurementstatuses) | **GET** /v1/measurements/upload | List Uploading Statuses of Measurements
[**listProjectMeasurementStatuses**](MeasUploadingMeasurementsAPI.md#listprojectmeasurementstatuses) | **GET** /v1/projects/{project_uuid}/measurements/upload | List Project Uploading Statuses of Measurements
[**uploadMeasurement**](MeasUploadingMeasurementsAPI.md#uploadmeasurement) | **POST** /v1/measurements/upload | Create Measurement from CSV File
[**uploadMeasurementIntoMeasurement**](MeasUploadingMeasurementsAPI.md#uploadmeasurementintomeasurement) | **POST** /v1/measurements/{measurement_uuid}/upload | Store Data Points by CSV File
[**uploadProjectMeasurement**](MeasUploadingMeasurementsAPI.md#uploadprojectmeasurement) | **POST** /v1/projects/{project_uuid}/measurements/upload | Create Project Measurement from CSV File
[**uploadProjectMeasurementIntoMeasurement**](MeasUploadingMeasurementsAPI.md#uploadprojectmeasurementintomeasurement) | **POST** /v1/projects/{project_uuid}/measurements/{measurement_uuid}/upload | Store Project Data Points by CSV File


# **listMeasurementStatuses**
```swift
    open class func listMeasurementStatuses(limit: Int? = nil, sort: Sort_listMeasurementStatuses? = nil, page: Int? = nil, order: Order_listMeasurementStatuses? = nil, completion: @escaping (_ data: MeasurementUploadStatusesGetResponse?, _ error: Error?) -> Void)
```

List Uploading Statuses of Measurements

（ **Deprecated** このエンドポイントではなく、`GET /measurements/jobs` を使用してください。） 計測のアップロードのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let limit = 987 // Int | 1回のリクエストで取得する件数 (optional)
let sort = "sort_example" // String | 並べ替えに使用するキー (optional) (default to .createdAt)
let page = 987 // Int | 取得するページの番号 (optional)
let order = "order_example" // String | 並べ替えの順序 (optional)

// List Uploading Statuses of Measurements
MeasUploadingMeasurementsAPI.listMeasurementStatuses(limit: limit, sort: sort, page: page, order: order) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **Int** | 1回のリクエストで取得する件数 | [optional] 
 **sort** | **String** | 並べ替えに使用するキー | [optional] [default to .createdAt]
 **page** | **Int** | 取得するページの番号 | [optional] 
 **order** | **String** | 並べ替えの順序 | [optional] 

### Return type

[**MeasurementUploadStatusesGetResponse**](MeasurementUploadStatusesGetResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listProjectMeasurementStatuses**
```swift
    open class func listProjectMeasurementStatuses(projectUuid: String, limit: Int? = nil, sort: Sort_listProjectMeasurementStatuses? = nil, page: Int? = nil, order: Order_listProjectMeasurementStatuses? = nil, completion: @escaping (_ data: MeasurementUploadStatusesGetResponse?, _ error: Error?) -> Void)
```

List Project Uploading Statuses of Measurements

（ **Deprecated** このエンドポイントではなく、`GET /measurements/jobs` を使用してください。） 計測のアップロードのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let limit = 987 // Int | 1回のリクエストで取得する件数 (optional)
let sort = "sort_example" // String | 並べ替えに使用するキー (optional) (default to .createdAt)
let page = 987 // Int | 取得するページの番号 (optional)
let order = "order_example" // String | 並べ替えの順序 (optional)

// List Project Uploading Statuses of Measurements
MeasUploadingMeasurementsAPI.listProjectMeasurementStatuses(projectUuid: projectUuid, limit: limit, sort: sort, page: page, order: order) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectUuid** | **String** | プロジェクトのUUID | 
 **limit** | **Int** | 1回のリクエストで取得する件数 | [optional] 
 **sort** | **String** | 並べ替えに使用するキー | [optional] [default to .createdAt]
 **page** | **Int** | 取得するページの番号 | [optional] 
 **order** | **String** | 並べ替えの順序 | [optional] 

### Return type

[**MeasurementUploadStatusesGetResponse**](MeasurementUploadStatusesGetResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uploadMeasurement**
```swift
    open class func uploadMeasurement(edgeUuid: UUID, dataFile: URL, baseTime: Date? = nil, baseTimeType: BaseTimeType_uploadMeasurement? = nil, channel: Int? = nil, measEnd: Bool? = nil, labelDataType: String? = nil, completion: @escaping (_ data: MeasurementUploadPostResponse?, _ error: Error?) -> Void)
```

Create Measurement from CSV File

CSVまたはMP4（**MP4はexperimental**）ファイルをアップロードし、計測を作成します。 計測には、指定されたエッジUUIDが関連付けられます。  `base_time` （基準時刻）は、RFC3339による表現か、UNIX時刻（マイクロ秒）を指定してください。 基準時刻が指定されていない場合は、CSVファイルのデータ行の1行目の時刻が基準時刻として使用されます。 CSVファイルのデータは、時刻順にソートされている必要があります。 `meas_end` パラメーターの設定は任意です。指定しない場合、 `true` となります。  CSVファイルの例: ``` time,       col1,   col2, col3,      col4,   col5, col6,      col7,   col8, col9,      col10 1539263579, val11,  12,   13.12345,  val14,  15,   16.12345,  val17,  18, 19.12345,  val110 1539263580, val21,  22,   23.12345,  val24,  25,   26.12345,  val27,  28, 29.12345,  val210 1539263581, val31,  32,   33.12345,  val34,  35,   36.12345,  val37,  38, 39.12345,  val310 1539263582, val41,  42,   43.12345,  val44,  45,   46.12345,  val47,  48, 49.12345,  val410 ``` 空白行がある場合、行番号のカウントは加算されますが、その行は処理されません。 例えば、以下のような場合の空白行は無視されます。 ``` time,       col1,   col2, col3,      col4,   col5, col6,      col7,   col8, col9,      col10 1539263579, val11,  12,   13.12345,  val14,  15,   16.12345,  val17,  18, 19.12345,  val110  1539263581, val31,  32,   33.12345,  val34,  35,   36.12345,  val37,  38, 39.12345,  val310 1539263582, val41,  42,   43.12345,  val44,  45,   46.12345,  val47,  48, 49.12345,  val410 ```  [Go parser library](https://golang.org/pkg/encoding/csv/) も参照してください。  時刻の列には、RFC3339による表現か、UNIX時刻（秒）を使用することができます。 ## エスケープ 値の内部で `,` を使用したい場合は、その値全体を `\"` で囲んでください。 また、値の内部で `\"` を使用したい場合は、値全体を `\"` で囲み、さらに、 `\"` を `\"\"` のように表記してください。 値を `\"` で囲まないと、CSVファイルのパースの際にエラーが発生します。  エスケープの例: ``` time,col1 1539263579,\"ab,cde\"                  .....OK (parsed as 'ab,cde') 1539263579,\"ab\"\"cde\"                 .....OK (parsed as 'ab\"cde') 1539263579,     abcde                .....OK (parsed as '     abcde') 1539263579,\"     abcde\"              .....OK (parsed as '     abcde') 1539263579,ab\"cde                    .....NG 1539263579, \"abcde\"                  .....NG 1539263579,ab,cde                    .....NG(wrong number of fields) ```

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let edgeUuid = 987 // UUID | エッジのUUID
let dataFile = URL(string: "https://example.com")! // URL | アップロードするファイル
let baseTime = Date() // Date | 計測の基準時刻。MP4ファイルをアップロードする場合は必須です。 (optional)
let baseTimeType = "baseTimeType_example" // String | 基準時刻のタイプ (optional) (default to .edgeRtc)
let channel = 987 // Int | 計測のチャンネル（十進表記の文字列） (optional)
let measEnd = true // Bool | `true` にすると、計測は終了したものとして扱われます。 (optional)
let labelDataType = "labelDataType_example" // String | 列名とデータタイプの対応。 データタイプは、 `int` 、` string` 、 `float` のいずれかを指定してください。 例: ``` {   \\\"column_1\\\": \\\"float\\\",   \\\"column_2\\\": \\\"string\\\",   \\\"column_3\\\": \\\"int\\\" } ``` (optional)

// Create Measurement from CSV File
MeasUploadingMeasurementsAPI.uploadMeasurement(edgeUuid: edgeUuid, dataFile: dataFile, baseTime: baseTime, baseTimeType: baseTimeType, channel: channel, measEnd: measEnd, labelDataType: labelDataType) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **edgeUuid** | **UUID** | エッジのUUID | 
 **dataFile** | **URL** | アップロードするファイル | 
 **baseTime** | **Date** | 計測の基準時刻。MP4ファイルをアップロードする場合は必須です。 | [optional] 
 **baseTimeType** | **String** | 基準時刻のタイプ | [optional] [default to .edgeRtc]
 **channel** | **Int** | 計測のチャンネル（十進表記の文字列） | [optional] 
 **measEnd** | **Bool** | &#x60;true&#x60; にすると、計測は終了したものとして扱われます。 | [optional] 
 **labelDataType** | **String** | 列名とデータタイプの対応。 データタイプは、 &#x60;int&#x60; 、&#x60; string&#x60; 、 &#x60;float&#x60; のいずれかを指定してください。 例: &#x60;&#x60;&#x60; {   \\\&quot;column_1\\\&quot;: \\\&quot;float\\\&quot;,   \\\&quot;column_2\\\&quot;: \\\&quot;string\\\&quot;,   \\\&quot;column_3\\\&quot;: \\\&quot;int\\\&quot; } &#x60;&#x60;&#x60; | [optional] 

### Return type

[**MeasurementUploadPostResponse**](MeasurementUploadPostResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uploadMeasurementIntoMeasurement**
```swift
    open class func uploadMeasurementIntoMeasurement(measurementUuid: String, dataFile: URL, channel: Int? = nil, measEnd: Bool? = nil, labelDataType: String? = nil, completion: @escaping (_ data: MeasurementUploadPostResponse?, _ error: Error?) -> Void)
```

Store Data Points by CSV File

CSVファイルをアップロードし、計測にデータを追加します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let dataFile = URL(string: "https://example.com")! // URL | アップロードするファイル
let channel = 987 // Int | 作成された計測のチャンネル (optional)
let measEnd = true // Bool | * `true` : 終了した計測 * `false` : 終了していない計測 (optional)
let labelDataType = "labelDataType_example" // String | 列名とデータタイプの対応。 データタイプは、 `int` 、` string` 、 `float` のいずれかを指定してください。 例: ``` {   \\\"column_1\\\": \\\"float\\\",   \\\"column_2\\\": \\\"string\\\",   \\\"column_3\\\": \\\"int\\\" } ``` (optional)

// Store Data Points by CSV File
MeasUploadingMeasurementsAPI.uploadMeasurementIntoMeasurement(measurementUuid: measurementUuid, dataFile: dataFile, channel: channel, measEnd: measEnd, labelDataType: labelDataType) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **measurementUuid** | **String** | 計測のUUID | 
 **dataFile** | **URL** | アップロードするファイル | 
 **channel** | **Int** | 作成された計測のチャンネル | [optional] 
 **measEnd** | **Bool** | * &#x60;true&#x60; : 終了した計測 * &#x60;false&#x60; : 終了していない計測 | [optional] 
 **labelDataType** | **String** | 列名とデータタイプの対応。 データタイプは、 &#x60;int&#x60; 、&#x60; string&#x60; 、 &#x60;float&#x60; のいずれかを指定してください。 例: &#x60;&#x60;&#x60; {   \\\&quot;column_1\\\&quot;: \\\&quot;float\\\&quot;,   \\\&quot;column_2\\\&quot;: \\\&quot;string\\\&quot;,   \\\&quot;column_3\\\&quot;: \\\&quot;int\\\&quot; } &#x60;&#x60;&#x60; | [optional] 

### Return type

[**MeasurementUploadPostResponse**](MeasurementUploadPostResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uploadProjectMeasurement**
```swift
    open class func uploadProjectMeasurement(projectUuid: String, edgeUuid: UUID, dataFile: URL, baseTime: Date? = nil, baseTimeType: BaseTimeType_uploadProjectMeasurement? = nil, channel: Int? = nil, measEnd: Bool? = nil, labelDataType: String? = nil, completion: @escaping (_ data: MeasurementUploadPostResponse?, _ error: Error?) -> Void)
```

Create Project Measurement from CSV File

CSVまたはMP4（**MP4はexperimental**）ファイルをアップロードし、計測を作成します。 計測には、指定されたエッジUUIDが関連付けられます。  `base_time` （基準時刻）は、RFC3339による表現か、UNIX時刻（マイクロ秒）を指定してください。 基準時刻が指定されていない場合は、CSVファイルのデータ行の1行目の時刻が基準時刻として使用されます。 CSVファイルのデータは、時刻順にソートされている必要があります。 `meas_end` パラメーターの設定は任意です。指定しない場合、 `true` となります。  CSVファイルの例: ``` time,       col1,   col2, col3,      col4,   col5, col6,      col7,   col8, col9,      col10 1539263579, val11,  12,   13.12345,  val14,  15,   16.12345,  val17,  18, 19.12345,  val110 1539263580, val21,  22,   23.12345,  val24,  25,   26.12345,  val27,  28, 29.12345,  val210 1539263581, val31,  32,   33.12345,  val34,  35,   36.12345,  val37,  38, 39.12345,  val310 1539263582, val41,  42,   43.12345,  val44,  45,   46.12345,  val47,  48, 49.12345,  val410 ``` 空白行がある場合、行番号のカウントは加算されますが、その行は処理されません。 例えば、以下のような場合の空白行は無視されます。 ``` time,       col1,   col2, col3,      col4,   col5, col6,      col7,   col8, col9,      col10 1539263579, val11,  12,   13.12345,  val14,  15,   16.12345,  val17,  18, 19.12345,  val110  1539263581, val31,  32,   33.12345,  val34,  35,   36.12345,  val37,  38, 39.12345,  val310 1539263582, val41,  42,   43.12345,  val44,  45,   46.12345,  val47,  48, 49.12345,  val410 ```  [Go parser library](https://golang.org/pkg/encoding/csv/) も参照してください。  時刻の列には、RFC3339による表現か、UNIX時刻（秒）を使用することができます。 ## エスケープ 値の内部で `,` を使用したい場合は、その値全体を `\"` で囲んでください。 また、値の内部で `\"` を使用したい場合は、値全体を `\"` で囲み、さらに、 `\"` を `\"\"` のように表記してください。 値を `\"` で囲まないと、CSVファイルのパースの際にエラーが発生します。  エスケープの例: ``` time,col1 1539263579,\"ab,cde\"                  .....OK (parsed as 'ab,cde') 1539263579,\"ab\"\"cde\"                 .....OK (parsed as 'ab\"cde') 1539263579,     abcde                .....OK (parsed as '     abcde') 1539263579,\"     abcde\"              .....OK (parsed as '     abcde') 1539263579,ab\"cde                    .....NG 1539263579, \"abcde\"                  .....NG 1539263579,ab,cde                    .....NG(wrong number of fields) ```

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let edgeUuid = 987 // UUID | エッジのUUID
let dataFile = URL(string: "https://example.com")! // URL | アップロードするファイル
let baseTime = Date() // Date | 計測の基準時刻。MP4ファイルをアップロードする場合は必須です。 (optional)
let baseTimeType = "baseTimeType_example" // String | 基準時刻のタイプ (optional) (default to .edgeRtc)
let channel = 987 // Int | 計測のチャンネル（十進表記の文字列） (optional)
let measEnd = true // Bool | `true` にすると、計測は終了したものとして扱われます。 (optional)
let labelDataType = "labelDataType_example" // String | 列名とデータタイプの対応。 データタイプは、 `int` 、` string` 、 `float` のいずれかを指定してください。 例: ``` {   \\\"column_1\\\": \\\"float\\\",   \\\"column_2\\\": \\\"string\\\",   \\\"column_3\\\": \\\"int\\\" } ``` (optional)

// Create Project Measurement from CSV File
MeasUploadingMeasurementsAPI.uploadProjectMeasurement(projectUuid: projectUuid, edgeUuid: edgeUuid, dataFile: dataFile, baseTime: baseTime, baseTimeType: baseTimeType, channel: channel, measEnd: measEnd, labelDataType: labelDataType) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectUuid** | **String** | プロジェクトのUUID | 
 **edgeUuid** | **UUID** | エッジのUUID | 
 **dataFile** | **URL** | アップロードするファイル | 
 **baseTime** | **Date** | 計測の基準時刻。MP4ファイルをアップロードする場合は必須です。 | [optional] 
 **baseTimeType** | **String** | 基準時刻のタイプ | [optional] [default to .edgeRtc]
 **channel** | **Int** | 計測のチャンネル（十進表記の文字列） | [optional] 
 **measEnd** | **Bool** | &#x60;true&#x60; にすると、計測は終了したものとして扱われます。 | [optional] 
 **labelDataType** | **String** | 列名とデータタイプの対応。 データタイプは、 &#x60;int&#x60; 、&#x60; string&#x60; 、 &#x60;float&#x60; のいずれかを指定してください。 例: &#x60;&#x60;&#x60; {   \\\&quot;column_1\\\&quot;: \\\&quot;float\\\&quot;,   \\\&quot;column_2\\\&quot;: \\\&quot;string\\\&quot;,   \\\&quot;column_3\\\&quot;: \\\&quot;int\\\&quot; } &#x60;&#x60;&#x60; | [optional] 

### Return type

[**MeasurementUploadPostResponse**](MeasurementUploadPostResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uploadProjectMeasurementIntoMeasurement**
```swift
    open class func uploadProjectMeasurementIntoMeasurement(projectUuid: String, measurementUuid: String, dataFile: URL, channel: Int? = nil, measEnd: Bool? = nil, labelDataType: String? = nil, completion: @escaping (_ data: MeasurementUploadPostResponse?, _ error: Error?) -> Void)
```

Store Project Data Points by CSV File

CSVファイルをアップロードし、計測にデータを追加します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let dataFile = URL(string: "https://example.com")! // URL | アップロードするファイル
let channel = 987 // Int | 作成された計測のチャンネル (optional)
let measEnd = true // Bool | * `true` : 終了した計測 * `false` : 終了していない計測 (optional)
let labelDataType = "labelDataType_example" // String | 列名とデータタイプの対応。 データタイプは、 `int` 、` string` 、 `float` のいずれかを指定してください。 例: ``` {   \\\"column_1\\\": \\\"float\\\",   \\\"column_2\\\": \\\"string\\\",   \\\"column_3\\\": \\\"int\\\" } ``` (optional)

// Store Project Data Points by CSV File
MeasUploadingMeasurementsAPI.uploadProjectMeasurementIntoMeasurement(projectUuid: projectUuid, measurementUuid: measurementUuid, dataFile: dataFile, channel: channel, measEnd: measEnd, labelDataType: labelDataType) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectUuid** | **String** | プロジェクトのUUID | 
 **measurementUuid** | **String** | 計測のUUID | 
 **dataFile** | **URL** | アップロードするファイル | 
 **channel** | **Int** | 作成された計測のチャンネル | [optional] 
 **measEnd** | **Bool** | * &#x60;true&#x60; : 終了した計測 * &#x60;false&#x60; : 終了していない計測 | [optional] 
 **labelDataType** | **String** | 列名とデータタイプの対応。 データタイプは、 &#x60;int&#x60; 、&#x60; string&#x60; 、 &#x60;float&#x60; のいずれかを指定してください。 例: &#x60;&#x60;&#x60; {   \\\&quot;column_1\\\&quot;: \\\&quot;float\\\&quot;,   \\\&quot;column_2\\\&quot;: \\\&quot;string\\\&quot;,   \\\&quot;column_3\\\&quot;: \\\&quot;int\\\&quot; } &#x60;&#x60;&#x60; | [optional] 

### Return type

[**MeasurementUploadPostResponse**](MeasurementUploadPostResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

