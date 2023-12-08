# MeasDataPointsAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createDataPoints**](MeasDataPointsAPI.md#createdatapoints) | **POST** /v1/measurements/data | Store Data Points
[**createProjectDataPoints**](MeasDataPointsAPI.md#createprojectdatapoints) | **POST** /v1/projects/{project_uuid}/measurements/data | Store Project Data Points
[**listDataIDs**](MeasDataPointsAPI.md#listdataids) | **GET** /v1/getids | List Edge&#39;s Data IDs
[**listDataIDsWithMeasurementUUID**](MeasDataPointsAPI.md#listdataidswithmeasurementuuid) | **GET** /v1/measurements/{measurement_uuid}/getids | List Data IDs
[**listDataPointDataIDs**](MeasDataPointsAPI.md#listdatapointdataids) | **GET** /v1/data_ids | List Data Point Data IDs
[**listDataPoints**](MeasDataPointsAPI.md#listdatapoints) | **GET** /v1/data | List Data Points
[**listProjectDataIDs**](MeasDataPointsAPI.md#listprojectdataids) | **GET** /v1/projects/{project_uuid}/getids | List Project Edge&#39;s Data IDs
[**listProjectDataIDsWithMeasurementUUID**](MeasDataPointsAPI.md#listprojectdataidswithmeasurementuuid) | **GET** /v1/projects/{project_uuid}/measurements/{measurement_uuid}/getids | List Project Data IDs
[**listProjectDataPointDataIDs**](MeasDataPointsAPI.md#listprojectdatapointdataids) | **GET** /v1/projects/{project_uuid}/data_ids | List Project Data Point Data IDs
[**listProjectDataPoints**](MeasDataPointsAPI.md#listprojectdatapoints) | **GET** /v1/projects/{project_uuid}/data | List Project Data Points


# **createDataPoints**
```swift
    open class func createDataPoints(body: URL? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Store Data Points

データポイントを登録します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let body = URL(string: "https://example.com")! // URL | このエンドポイント使用時は、 `Content-Type` を以下にしてください。   * `application/protobuf`       * [protocol.proto](https://docs.intdash.jp/api/measurement/proto/index.html) の `StoreProto` を参照してください。         * `DataPointProto` の `data_payload`は iSCP v1のデータフォーマットに従います。         * iSCPのデータフォーマットは [詳説 iSCP 1.0](https://docs.intdash.jp/manual/iscp1-essentials/latest/ja/iscp1-essentials-ja.pdf#page=23)を参照してください。 (optional)

// Store Data Points
MeasDataPointsAPI.createDataPoints(body: body) { (response, error) in
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
 **body** | **URL** | このエンドポイント使用時は、 &#x60;Content-Type&#x60; を以下にしてください。   * &#x60;application/protobuf&#x60;       * [protocol.proto](https://docs.intdash.jp/api/measurement/proto/index.html) の &#x60;StoreProto&#x60; を参照してください。         * &#x60;DataPointProto&#x60; の &#x60;data_payload&#x60;は iSCP v1のデータフォーマットに従います。         * iSCPのデータフォーマットは [詳説 iSCP 1.0](https://docs.intdash.jp/manual/iscp1-essentials/latest/ja/iscp1-essentials-ja.pdf#page&#x3D;23)を参照してください。 | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/protobuf
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createProjectDataPoints**
```swift
    open class func createProjectDataPoints(projectUuid: String, body: URL? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Store Project Data Points

データポイントを登録します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let body = URL(string: "https://example.com")! // URL | このエンドポイント使用時は、 `Content-Type` を以下にしてください。   * `application/protobuf`       * [protocol.proto](https://docs.intdash.jp/api/measurement/proto/index.html) の `StoreProto` を参照してください。         * `DataPointProto` の `data_payload`は iSCP v1のデータフォーマットに従います。         * iSCPのデータフォーマットは [詳説 iSCP 1.0](https://docs.intdash.jp/manual/iscp1-essentials/latest/ja/iscp1-essentials-ja.pdf#page=23)を参照してください。 (optional)

// Store Project Data Points
MeasDataPointsAPI.createProjectDataPoints(projectUuid: projectUuid, body: body) { (response, error) in
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
 **body** | **URL** | このエンドポイント使用時は、 &#x60;Content-Type&#x60; を以下にしてください。   * &#x60;application/protobuf&#x60;       * [protocol.proto](https://docs.intdash.jp/api/measurement/proto/index.html) の &#x60;StoreProto&#x60; を参照してください。         * &#x60;DataPointProto&#x60; の &#x60;data_payload&#x60;は iSCP v1のデータフォーマットに従います。         * iSCPのデータフォーマットは [詳説 iSCP 1.0](https://docs.intdash.jp/manual/iscp1-essentials/latest/ja/iscp1-essentials-ja.pdf#page&#x3D;23)を参照してください。 | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/protobuf
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listDataIDs**
```swift
    open class func listDataIDs(start: Int64? = nil, end: Int64? = nil, edgeUuid: String? = nil, completion: @escaping (_ data: DataIDs?, _ error: Error?) -> Void)
```

List Edge's Data IDs

エッジを指定し、そのエッジから送信されているデータに含まれるデータ識別子（ `data_type` 、 `channel` 、 `data_id` の組み合わせ）のリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let start = 987 // Int64 | 取得対象範囲の始点（マイクロ秒単位のUNIX時刻） (optional)
let end = 987 // Int64 | 取得対象範囲の終点（マイクロ秒単位のUNIX時刻） (optional)
let edgeUuid = "edgeUuid_example" // String | エッジのUUID (optional)

// List Edge's Data IDs
MeasDataPointsAPI.listDataIDs(start: start, end: end, edgeUuid: edgeUuid) { (response, error) in
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
 **start** | **Int64** | 取得対象範囲の始点（マイクロ秒単位のUNIX時刻） | [optional] 
 **end** | **Int64** | 取得対象範囲の終点（マイクロ秒単位のUNIX時刻） | [optional] 
 **edgeUuid** | **String** | エッジのUUID | [optional] 

### Return type

[**DataIDs**](DataIDs.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listDataIDsWithMeasurementUUID**
```swift
    open class func listDataIDsWithMeasurementUUID(measurementUuid: String, completion: @escaping (_ data: DataIDs?, _ error: Error?) -> Void)
```

List Data IDs

計測を指定し、その計測に含まれるデータ識別子（ `data_type` 、 `channel` 、 `data_id` の組み合わせ）のリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// List Data IDs
MeasDataPointsAPI.listDataIDsWithMeasurementUUID(measurementUuid: measurementUuid) { (response, error) in
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

### Return type

[**DataIDs**](DataIDs.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listDataPointDataIDs**
```swift
    open class func listDataPointDataIDs(name: String, start: String? = nil, end: String? = nil, completion: @escaping (_ data: DataPointDataIDs?, _ error: Error?) -> Void)
```

List Data Point Data IDs

データポイントのデータID（ `data_type`, `data_id` ）のリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let name = "name_example" // String | どの計測またはどのエッジのデータポイントを取得するかを、以下のいずれかを使って指定します： - 計測UUID - エッジUUID - エッジの名前  最初に、指定されたnameに一致する計測UUIDがあるかが検索されます。なければ一致するエッジUUIDがあるかが検索され、それもなければ一致するエッジの名前があるかが検索されます。
let start = "start_example" // String | 取得対象範囲の始点。以下のいずれかの形式で指定します。   - rfc3339(ex 2019-10-29T03:04:05.341268Z)   - UNIX時刻（マイクロ秒）(**Deprecated**) (optional)
let end = "end_example" // String | 取得対象範囲の終点。以下のいずれかの形式で指定します。   - rfc3339(ex 2019-10-29T03:04:05.341268Z)   - UNIX時刻（マイクロ秒）(**Deprecated**) (optional)

// List Data Point Data IDs
MeasDataPointsAPI.listDataPointDataIDs(name: name, start: start, end: end) { (response, error) in
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
 **name** | **String** | どの計測またはどのエッジのデータポイントを取得するかを、以下のいずれかを使って指定します： - 計測UUID - エッジUUID - エッジの名前  最初に、指定されたnameに一致する計測UUIDがあるかが検索されます。なければ一致するエッジUUIDがあるかが検索され、それもなければ一致するエッジの名前があるかが検索されます。 | 
 **start** | **String** | 取得対象範囲の始点。以下のいずれかの形式で指定します。   - rfc3339(ex 2019-10-29T03:04:05.341268Z)   - UNIX時刻（マイクロ秒）(**Deprecated**) | [optional] 
 **end** | **String** | 取得対象範囲の終点。以下のいずれかの形式で指定します。   - rfc3339(ex 2019-10-29T03:04:05.341268Z)   - UNIX時刻（マイクロ秒）(**Deprecated**) | [optional] 

### Return type

[**DataPointDataIDs**](DataPointDataIDs.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listDataPoints**
```swift
    open class func listDataPoints(name: String, start: String? = nil, end: String? = nil, idq: [String]? = nil, since: String? = nil, exitOnError: String? = nil, label: [String]? = nil, period: Int64? = nil, limit: Int64? = nil, order: Order_listDataPoints? = nil, timeFormat: TimeFormat_listDataPoints? = nil, completion: @escaping (_ data: DataPoint?, _ error: Error?) -> Void)
```

List Data Points

データポイントのリストを取得します。 返却されるデータポイントはJSON形式です。データポイントごとに改行で区切られます。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let name = "name_example" // String | どの計測またはどのエッジのデータポイントを取得するかを、以下のいずれかを使って指定します： - 計測UUID - エッジUUID - エッジの名前  最初に、指定されたnameに一致する計測UUIDがあるかが検索されます。なければ一致するエッジUUIDがあるかが検索され、それもなければ一致するエッジの名前があるかが検索されます。
let start = "start_example" // String | 取得対象範囲の始点。以下のいずれかの形式で指定します。   - rfc3339(ex 2019-10-29T03:04:05.341268Z)   - UNIX時刻（マイクロ秒）(**Deprecated**) (optional)
let end = "end_example" // String | 取得対象範囲の終点。以下のいずれかの形式で指定します。   - rfc3339(ex 2019-10-29T03:04:05.341268Z)   - UNIX時刻（マイクロ秒）(**Deprecated**) (optional)
let idq = ["inner_example"] // [String] | 取得したいデータポイントの条件を以下のフォーマットで指定します。 `data_id` には、 `GET /data_ids` エンドポイントで取得できる `data_id` の値を使用します。  - `<data_type>:<channel>/<data_id>`  各セグメントにはワイルドカード(*)を使用することができます。 例:   - CAN(data_type = `1`)のデータポイントを取得する -> `1:*_/_*` または `1`   - チャンネル2のCANデータポイントを取得する -> `1:2/_*` または `1:2`   - チャンネル2のCANデータポイントのうち、データIDが `00000001` のものを取得する -> `1:2/00000001` (optional)
let since = "since_example" // String | 指定した時刻以降に更新された計測のみを取得します。 以下のいずれかの形式で指定します。   - rfc3339(ex 2019-10-29T03:04:05.341268Z).   - UNIX時刻（マイクロ秒）(**Deprecated**). (optional)
let exitOnError = "exitOnError_example" // String | `true` を指定した場合、取得中にエラーが発生すると処理を中断し、中断前までのデータポイントのリストを返します。 (optional) (default to "false")
let label = ["inner_example"] // [String] | 信号定義のラベル (optional)
let period = 987 // Int64 | データポイントを指定した間隔（マイクロ秒）に間引きます。（ **Experimental** ）  指定された間隔ごとに最新のデータポイントを残し、それ以外を除去します。 また、指定された間隔になるようにデータポイントの時刻を揃えます。 ```  --1--2----3---4--5---6-7--89-a---b-c---d--e--> period指定なし  |     |     |     |     |     |     |     |  |     |     |     |     |     |     |     |  2-----3-----5-----7-----a-----c-----d-----e--> period指定あり   |<--->| period ``` (optional)
let limit = 987 // Int64 | 1回のリクエストで取得する件数。デフォルトは無制限。 (optional)
let order = "order_example" // String | 並べ替えの順序。デフォルトは `asc` （昇順） (optional)
let timeFormat = "timeFormat_example" // String | レスポンスの時刻表示形式。デフォルトは `us` （マイクロ秒） (optional)

// List Data Points
MeasDataPointsAPI.listDataPoints(name: name, start: start, end: end, idq: idq, since: since, exitOnError: exitOnError, label: label, period: period, limit: limit, order: order, timeFormat: timeFormat) { (response, error) in
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
 **name** | **String** | どの計測またはどのエッジのデータポイントを取得するかを、以下のいずれかを使って指定します： - 計測UUID - エッジUUID - エッジの名前  最初に、指定されたnameに一致する計測UUIDがあるかが検索されます。なければ一致するエッジUUIDがあるかが検索され、それもなければ一致するエッジの名前があるかが検索されます。 | 
 **start** | **String** | 取得対象範囲の始点。以下のいずれかの形式で指定します。   - rfc3339(ex 2019-10-29T03:04:05.341268Z)   - UNIX時刻（マイクロ秒）(**Deprecated**) | [optional] 
 **end** | **String** | 取得対象範囲の終点。以下のいずれかの形式で指定します。   - rfc3339(ex 2019-10-29T03:04:05.341268Z)   - UNIX時刻（マイクロ秒）(**Deprecated**) | [optional] 
 **idq** | [**[String]**](String.md) | 取得したいデータポイントの条件を以下のフォーマットで指定します。 &#x60;data_id&#x60; には、 &#x60;GET /data_ids&#x60; エンドポイントで取得できる &#x60;data_id&#x60; の値を使用します。  - &#x60;&lt;data_type&gt;:&lt;channel&gt;/&lt;data_id&gt;&#x60;  各セグメントにはワイルドカード(*)を使用することができます。 例:   - CAN(data_type &#x3D; &#x60;1&#x60;)のデータポイントを取得する -&gt; &#x60;1:*_/_*&#x60; または &#x60;1&#x60;   - チャンネル2のCANデータポイントを取得する -&gt; &#x60;1:2/_*&#x60; または &#x60;1:2&#x60;   - チャンネル2のCANデータポイントのうち、データIDが &#x60;00000001&#x60; のものを取得する -&gt; &#x60;1:2/00000001&#x60; | [optional] 
 **since** | **String** | 指定した時刻以降に更新された計測のみを取得します。 以下のいずれかの形式で指定します。   - rfc3339(ex 2019-10-29T03:04:05.341268Z).   - UNIX時刻（マイクロ秒）(**Deprecated**). | [optional] 
 **exitOnError** | **String** | &#x60;true&#x60; を指定した場合、取得中にエラーが発生すると処理を中断し、中断前までのデータポイントのリストを返します。 | [optional] [default to &quot;false&quot;]
 **label** | [**[String]**](String.md) | 信号定義のラベル | [optional] 
 **period** | **Int64** | データポイントを指定した間隔（マイクロ秒）に間引きます。（ **Experimental** ）  指定された間隔ごとに最新のデータポイントを残し、それ以外を除去します。 また、指定された間隔になるようにデータポイントの時刻を揃えます。 &#x60;&#x60;&#x60;  --1--2----3---4--5---6-7--89-a---b-c---d--e--&gt; period指定なし  |     |     |     |     |     |     |     |  |     |     |     |     |     |     |     |  2-----3-----5-----7-----a-----c-----d-----e--&gt; period指定あり   |&lt;---&gt;| period &#x60;&#x60;&#x60; | [optional] 
 **limit** | **Int64** | 1回のリクエストで取得する件数。デフォルトは無制限。 | [optional] 
 **order** | **String** | 並べ替えの順序。デフォルトは &#x60;asc&#x60; （昇順） | [optional] 
 **timeFormat** | **String** | レスポンスの時刻表示形式。デフォルトは &#x60;us&#x60; （マイクロ秒） | [optional] 

### Return type

[**DataPoint**](DataPoint.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8, application/protobuf

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listProjectDataIDs**
```swift
    open class func listProjectDataIDs(projectUuid: String, start: Int64? = nil, end: Int64? = nil, edgeUuid: String? = nil, completion: @escaping (_ data: DataIDs?, _ error: Error?) -> Void)
```

List Project Edge's Data IDs

エッジを指定し、そのエッジから送信されているデータに含まれるデータ識別子（ `data_type` 、 `channel` 、 `data_id` の組み合わせ）のリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let start = 987 // Int64 | 取得対象範囲の始点（マイクロ秒単位のUNIX時刻） (optional)
let end = 987 // Int64 | 取得対象範囲の終点（マイクロ秒単位のUNIX時刻） (optional)
let edgeUuid = "edgeUuid_example" // String | エッジのUUID (optional)

// List Project Edge's Data IDs
MeasDataPointsAPI.listProjectDataIDs(projectUuid: projectUuid, start: start, end: end, edgeUuid: edgeUuid) { (response, error) in
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
 **start** | **Int64** | 取得対象範囲の始点（マイクロ秒単位のUNIX時刻） | [optional] 
 **end** | **Int64** | 取得対象範囲の終点（マイクロ秒単位のUNIX時刻） | [optional] 
 **edgeUuid** | **String** | エッジのUUID | [optional] 

### Return type

[**DataIDs**](DataIDs.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listProjectDataIDsWithMeasurementUUID**
```swift
    open class func listProjectDataIDsWithMeasurementUUID(projectUuid: String, measurementUuid: String, completion: @escaping (_ data: DataIDs?, _ error: Error?) -> Void)
```

List Project Data IDs

計測を指定し、その計測に含まれるデータ識別子（ `data_type` 、 `channel` 、 `data_id` の組み合わせ）のリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// List Project Data IDs
MeasDataPointsAPI.listProjectDataIDsWithMeasurementUUID(projectUuid: projectUuid, measurementUuid: measurementUuid) { (response, error) in
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

### Return type

[**DataIDs**](DataIDs.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listProjectDataPointDataIDs**
```swift
    open class func listProjectDataPointDataIDs(projectUuid: String, name: String, start: String? = nil, end: String? = nil, completion: @escaping (_ data: DataPointDataIDs?, _ error: Error?) -> Void)
```

List Project Data Point Data IDs

データポイントのデータID（ `data_type`, `data_id` ）のリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let name = "name_example" // String | どの計測またはどのエッジのデータポイントを取得するかを、以下のいずれかを使って指定します： - 計測UUID - エッジUUID - エッジの名前  最初に、指定されたnameに一致する計測UUIDがあるかが検索されます。なければ一致するエッジUUIDがあるかが検索され、それもなければ一致するエッジの名前があるかが検索されます。
let start = "start_example" // String | 取得対象範囲の始点。以下のいずれかの形式で指定します。   - rfc3339(ex 2019-10-29T03:04:05.341268Z)   - UNIX時刻（マイクロ秒）(**Deprecated**) (optional)
let end = "end_example" // String | 取得対象範囲の終点。以下のいずれかの形式で指定します。   - rfc3339(ex 2019-10-29T03:04:05.341268Z)   - UNIX時刻（マイクロ秒）(**Deprecated**) (optional)

// List Project Data Point Data IDs
MeasDataPointsAPI.listProjectDataPointDataIDs(projectUuid: projectUuid, name: name, start: start, end: end) { (response, error) in
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
 **name** | **String** | どの計測またはどのエッジのデータポイントを取得するかを、以下のいずれかを使って指定します： - 計測UUID - エッジUUID - エッジの名前  最初に、指定されたnameに一致する計測UUIDがあるかが検索されます。なければ一致するエッジUUIDがあるかが検索され、それもなければ一致するエッジの名前があるかが検索されます。 | 
 **start** | **String** | 取得対象範囲の始点。以下のいずれかの形式で指定します。   - rfc3339(ex 2019-10-29T03:04:05.341268Z)   - UNIX時刻（マイクロ秒）(**Deprecated**) | [optional] 
 **end** | **String** | 取得対象範囲の終点。以下のいずれかの形式で指定します。   - rfc3339(ex 2019-10-29T03:04:05.341268Z)   - UNIX時刻（マイクロ秒）(**Deprecated**) | [optional] 

### Return type

[**DataPointDataIDs**](DataPointDataIDs.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listProjectDataPoints**
```swift
    open class func listProjectDataPoints(projectUuid: String, name: String, idq: [String]? = nil, start: String? = nil, end: String? = nil, since: String? = nil, exitOnError: String? = nil, label: [String]? = nil, period: Int64? = nil, limit: Int? = nil, order: Order_listProjectDataPoints? = nil, timeFormat: TimeFormat_listProjectDataPoints? = nil, completion: @escaping (_ data: DataPoint?, _ error: Error?) -> Void)
```

List Project Data Points

データポイントのリストを取得します。 返却されるデータポイントはJSON形式です。データポイントごとに改行で区切られます。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let name = "name_example" // String | どの計測またはどのエッジのデータポイントを取得するかを、以下のいずれかを使って指定します： - 計測UUID - エッジUUID - エッジの名前  最初に、指定されたnameに一致する計測UUIDがあるかが検索されます。なければ一致するエッジUUIDがあるかが検索され、それもなければ一致するエッジの名前があるかが検索されます。
let idq = ["inner_example"] // [String] | 取得したいデータポイントの条件を以下のフォーマットで指定します。 `data_id` には、 `GET /data_ids` エンドポイントで取得できる `data_id` の値を使用します。  - `<data_type>:<channel>/<data_id>`  各セグメントにはワイルドカード(*)を使用することができます。 例:   - CAN(data_type = `1`)のデータポイントを取得する -> `1:*_/_*` または `1`   - チャンネル2のCANデータポイントを取得する -> `1:2/_*` または `1:2`   - チャンネル2のCANデータポイントのうち、データIDが `00000001` のものを取得する -> `1:2/00000001` (optional)
let start = "start_example" // String | 取得対象範囲の始点。以下のいずれかの形式で指定します。   - rfc3339(ex 2019-10-29T03:04:05.341268Z)   - UNIX時刻（マイクロ秒）(**Deprecated**) (optional)
let end = "end_example" // String | 取得対象範囲の終点。以下のいずれかの形式で指定します。   - rfc3339(ex 2019-10-29T03:04:05.341268Z)   - UNIX時刻（マイクロ秒）(**Deprecated**) (optional)
let since = "since_example" // String | 指定した時刻以降に更新された計測のみを取得します。 以下のいずれかの形式で指定します。   - rfc3339(ex 2019-10-29T03:04:05.341268Z).   - UNIX時刻（マイクロ秒）(**Deprecated**). (optional)
let exitOnError = "exitOnError_example" // String | `true` を指定した場合、取得中にエラーが発生すると処理を中断し、中断前までのデータポイントのリストを返します。 (optional) (default to "false")
let label = ["inner_example"] // [String] | 信号定義のラベル (optional)
let period = 987 // Int64 | データポイントを指定した間隔（マイクロ秒）に間引きます。（ **Experimental** ）  指定された間隔ごとに最新のデータポイントを残し、それ以外を除去します。 また、指定された間隔になるようにデータポイントの時刻を揃えます。 ```  --1--2----3---4--5---6-7--89-a---b-c---d--e--> period指定なし  |     |     |     |     |     |     |     |  |     |     |     |     |     |     |     |  2-----3-----5-----7-----a-----c-----d-----e--> period指定あり   |<--->| period ``` (optional)
let limit = 987 // Int | 1回のリクエストで取得する件数 (optional)
let order = "order_example" // String | 並べ替えの順序。デフォルトは `asc` （昇順） (optional)
let timeFormat = "timeFormat_example" // String | レスポンスの時刻表示形式。デフォルトは `us` （マイクロ秒） (optional)

// List Project Data Points
MeasDataPointsAPI.listProjectDataPoints(projectUuid: projectUuid, name: name, idq: idq, start: start, end: end, since: since, exitOnError: exitOnError, label: label, period: period, limit: limit, order: order, timeFormat: timeFormat) { (response, error) in
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
 **name** | **String** | どの計測またはどのエッジのデータポイントを取得するかを、以下のいずれかを使って指定します： - 計測UUID - エッジUUID - エッジの名前  最初に、指定されたnameに一致する計測UUIDがあるかが検索されます。なければ一致するエッジUUIDがあるかが検索され、それもなければ一致するエッジの名前があるかが検索されます。 | 
 **idq** | [**[String]**](String.md) | 取得したいデータポイントの条件を以下のフォーマットで指定します。 &#x60;data_id&#x60; には、 &#x60;GET /data_ids&#x60; エンドポイントで取得できる &#x60;data_id&#x60; の値を使用します。  - &#x60;&lt;data_type&gt;:&lt;channel&gt;/&lt;data_id&gt;&#x60;  各セグメントにはワイルドカード(*)を使用することができます。 例:   - CAN(data_type &#x3D; &#x60;1&#x60;)のデータポイントを取得する -&gt; &#x60;1:*_/_*&#x60; または &#x60;1&#x60;   - チャンネル2のCANデータポイントを取得する -&gt; &#x60;1:2/_*&#x60; または &#x60;1:2&#x60;   - チャンネル2のCANデータポイントのうち、データIDが &#x60;00000001&#x60; のものを取得する -&gt; &#x60;1:2/00000001&#x60; | [optional] 
 **start** | **String** | 取得対象範囲の始点。以下のいずれかの形式で指定します。   - rfc3339(ex 2019-10-29T03:04:05.341268Z)   - UNIX時刻（マイクロ秒）(**Deprecated**) | [optional] 
 **end** | **String** | 取得対象範囲の終点。以下のいずれかの形式で指定します。   - rfc3339(ex 2019-10-29T03:04:05.341268Z)   - UNIX時刻（マイクロ秒）(**Deprecated**) | [optional] 
 **since** | **String** | 指定した時刻以降に更新された計測のみを取得します。 以下のいずれかの形式で指定します。   - rfc3339(ex 2019-10-29T03:04:05.341268Z).   - UNIX時刻（マイクロ秒）(**Deprecated**). | [optional] 
 **exitOnError** | **String** | &#x60;true&#x60; を指定した場合、取得中にエラーが発生すると処理を中断し、中断前までのデータポイントのリストを返します。 | [optional] [default to &quot;false&quot;]
 **label** | [**[String]**](String.md) | 信号定義のラベル | [optional] 
 **period** | **Int64** | データポイントを指定した間隔（マイクロ秒）に間引きます。（ **Experimental** ）  指定された間隔ごとに最新のデータポイントを残し、それ以外を除去します。 また、指定された間隔になるようにデータポイントの時刻を揃えます。 &#x60;&#x60;&#x60;  --1--2----3---4--5---6-7--89-a---b-c---d--e--&gt; period指定なし  |     |     |     |     |     |     |     |  |     |     |     |     |     |     |     |  2-----3-----5-----7-----a-----c-----d-----e--&gt; period指定あり   |&lt;---&gt;| period &#x60;&#x60;&#x60; | [optional] 
 **limit** | **Int** | 1回のリクエストで取得する件数 | [optional] 
 **order** | **String** | 並べ替えの順序。デフォルトは &#x60;asc&#x60; （昇順） | [optional] 
 **timeFormat** | **String** | レスポンスの時刻表示形式。デフォルトは &#x60;us&#x60; （マイクロ秒） | [optional] 

### Return type

[**DataPoint**](DataPoint.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8, application/protobuf

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

