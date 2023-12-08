# MeasSignalsAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createProjectSignal**](MeasSignalsAPI.md#createprojectsignal) | **POST** /v1/projects/{project_uuid}/signals | Create Project Signal
[**createSignal**](MeasSignalsAPI.md#createsignal) | **POST** /v1/signals | Create Signal
[**deleteProjectSignal**](MeasSignalsAPI.md#deleteprojectsignal) | **DELETE** /v1/projects/{project_uuid}/signals/{signal_uuid} | Delete Project Signal
[**deleteSignal**](MeasSignalsAPI.md#deletesignal) | **DELETE** /v1/signals/{signal_uuid} | Delete Signal
[**getProjectSignal**](MeasSignalsAPI.md#getprojectsignal) | **GET** /v1/projects/{project_uuid}/signals/{signal_uuid} | Get Project Signal
[**getSignal**](MeasSignalsAPI.md#getsignal) | **GET** /v1/signals/{signal_uuid} | Get Signal
[**listProjectSignals**](MeasSignalsAPI.md#listprojectsignals) | **GET** /v1/projects/{project_uuid}/signals | List Project Signals
[**listSignals**](MeasSignalsAPI.md#listsignals) | **GET** /v1/signals | List Signals
[**updateProjectSignal**](MeasSignalsAPI.md#updateprojectsignal) | **PUT** /v1/projects/{project_uuid}/signals/{signal_uuid} | Update Project Signal
[**updateSignal**](MeasSignalsAPI.md#updatesignal) | **PUT** /v1/signals/{signal_uuid} | Update Signal


# **createProjectSignal**
```swift
    open class func createProjectSignal(projectUuid: String, createSignalRequest: CreateSignalRequest? = nil, completion: @escaping (_ data: Signal?, _ error: Error?) -> Void)
```

Create Project Signal

信号定義を作成します。  * **Note**     - 既存の信号定義と `label` が重複する場合、または `uuid` が重複する場合は、       ステータスコード `409 Conflict` が返却されます。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let createSignalRequest = CreateSignalRequest(channel: 123, conversion: SignalConversion(type: SignalConversionOptionType(), options: SignalConversionOptionSubString(startbyte: 123, bytesize: 123)), dataId: "dataId_example", dataType: 123, description: "description_example", display: SignalDisplay(unit: "unit_example", min: 123, max: 123, format: "format_example"), label: "label_example", uuid: "uuid_example") // CreateSignalRequest |  (optional)

// Create Project Signal
MeasSignalsAPI.createProjectSignal(projectUuid: projectUuid, createSignalRequest: createSignalRequest) { (response, error) in
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
 **createSignalRequest** | [**CreateSignalRequest**](CreateSignalRequest.md) |  | [optional] 

### Return type

[**Signal**](Signal.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createSignal**
```swift
    open class func createSignal(createSignalRequest: CreateSignalRequest? = nil, completion: @escaping (_ data: Signal?, _ error: Error?) -> Void)
```

Create Signal

信号定義を作成します。  * **Note**     - 既存の信号定義と `label` が重複する場合、または `uuid` が重複する場合は、       ステータスコード `409 Conflict` が返却されます。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let createSignalRequest = CreateSignalRequest(channel: 123, conversion: SignalConversion(type: SignalConversionOptionType(), options: SignalConversionOptionSubString(startbyte: 123, bytesize: 123)), dataId: "dataId_example", dataType: 123, description: "description_example", display: SignalDisplay(unit: "unit_example", min: 123, max: 123, format: "format_example"), label: "label_example", uuid: "uuid_example") // CreateSignalRequest |  (optional)

// Create Signal
MeasSignalsAPI.createSignal(createSignalRequest: createSignalRequest) { (response, error) in
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
 **createSignalRequest** | [**CreateSignalRequest**](CreateSignalRequest.md) |  | [optional] 

### Return type

[**Signal**](Signal.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteProjectSignal**
```swift
    open class func deleteProjectSignal(projectUuid: String, signalUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Project Signal

信号定義を削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let signalUuid = "signalUuid_example" // String | 信号定義のUUID

// Delete Project Signal
MeasSignalsAPI.deleteProjectSignal(projectUuid: projectUuid, signalUuid: signalUuid) { (response, error) in
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
 **signalUuid** | **String** | 信号定義のUUID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteSignal**
```swift
    open class func deleteSignal(signalUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Signal

信号定義を削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let signalUuid = "signalUuid_example" // String | 信号定義のUUID

// Delete Signal
MeasSignalsAPI.deleteSignal(signalUuid: signalUuid) { (response, error) in
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
 **signalUuid** | **String** | 信号定義のUUID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectSignal**
```swift
    open class func getProjectSignal(projectUuid: String, signalUuid: String, completion: @escaping (_ data: Signal?, _ error: Error?) -> Void)
```

Get Project Signal

信号定義を取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let signalUuid = "signalUuid_example" // String | 信号定義のUUID

// Get Project Signal
MeasSignalsAPI.getProjectSignal(projectUuid: projectUuid, signalUuid: signalUuid) { (response, error) in
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
 **signalUuid** | **String** | 信号定義のUUID | 

### Return type

[**Signal**](Signal.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSignal**
```swift
    open class func getSignal(signalUuid: String, completion: @escaping (_ data: Signal?, _ error: Error?) -> Void)
```

Get Signal

信号定義を取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let signalUuid = "signalUuid_example" // String | 信号定義のUUID

// Get Signal
MeasSignalsAPI.getSignal(signalUuid: signalUuid) { (response, error) in
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
 **signalUuid** | **String** | 信号定義のUUID | 

### Return type

[**Signal**](Signal.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listProjectSignals**
```swift
    open class func listProjectSignals(projectUuid: String, label: [String]? = nil, sort: Sort_listProjectSignals? = nil, order: Order_listProjectSignals? = nil, limit: Int? = nil, page: Int? = nil, completion: @escaping (_ data: Signals?, _ error: Error?) -> Void)
```

List Project Signals

信号定義のリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let label = ["inner_example"] // [String] | ラベルが指定した文字列から始まる信号定義を取得します。 文字列をダブルクォーテーションで囲むと、完全一致のものだけを取得します。 (optional)
let sort = "sort_example" // String | 並べ替えに使用するキー (optional)
let order = "order_example" // String | 並べ替えの順序 (optional)
let limit = 987 // Int | 1回のリクエストで取得する件数 (optional)
let page = 987 // Int | 取得するページの番号 (optional)

// List Project Signals
MeasSignalsAPI.listProjectSignals(projectUuid: projectUuid, label: label, sort: sort, order: order, limit: limit, page: page) { (response, error) in
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
 **label** | [**[String]**](String.md) | ラベルが指定した文字列から始まる信号定義を取得します。 文字列をダブルクォーテーションで囲むと、完全一致のものだけを取得します。 | [optional] 
 **sort** | **String** | 並べ替えに使用するキー | [optional] 
 **order** | **String** | 並べ替えの順序 | [optional] 
 **limit** | **Int** | 1回のリクエストで取得する件数 | [optional] 
 **page** | **Int** | 取得するページの番号 | [optional] 

### Return type

[**Signals**](Signals.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listSignals**
```swift
    open class func listSignals(label: [String]? = nil, sort: Sort_listSignals? = nil, order: Order_listSignals? = nil, limit: Int? = nil, page: Int? = nil, completion: @escaping (_ data: Signals?, _ error: Error?) -> Void)
```

List Signals

信号定義のリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let label = ["inner_example"] // [String] | ラベルが指定した文字列から始まる信号定義を取得します。 文字列をダブルクォーテーションで囲むと、完全一致のものだけを取得します。 (optional)
let sort = "sort_example" // String | 並べ替えに使用するキー (optional)
let order = "order_example" // String | 並べ替えの順序 (optional)
let limit = 987 // Int | 1回のリクエストで取得する件数 (optional)
let page = 987 // Int | 取得するページの番号 (optional)

// List Signals
MeasSignalsAPI.listSignals(label: label, sort: sort, order: order, limit: limit, page: page) { (response, error) in
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
 **label** | [**[String]**](String.md) | ラベルが指定した文字列から始まる信号定義を取得します。 文字列をダブルクォーテーションで囲むと、完全一致のものだけを取得します。 | [optional] 
 **sort** | **String** | 並べ替えに使用するキー | [optional] 
 **order** | **String** | 並べ替えの順序 | [optional] 
 **limit** | **Int** | 1回のリクエストで取得する件数 | [optional] 
 **page** | **Int** | 取得するページの番号 | [optional] 

### Return type

[**Signals**](Signals.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateProjectSignal**
```swift
    open class func updateProjectSignal(projectUuid: String, signalUuid: String, updateSignalRequest: UpdateSignalRequest? = nil, completion: @escaping (_ data: Signal?, _ error: Error?) -> Void)
```

Update Project Signal

信号定義を更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let signalUuid = "signalUuid_example" // String | 信号定義のUUID
let updateSignalRequest = UpdateSignalRequest(channel: 123, conversion: SignalConversion(type: SignalConversionOptionType(), options: SignalConversionOptionSubString(startbyte: 123, bytesize: 123)), dataId: "dataId_example", dataType: 123, description: "description_example", display: SignalDisplay(unit: "unit_example", min: 123, max: 123, format: "format_example"), label: "label_example") // UpdateSignalRequest |  (optional)

// Update Project Signal
MeasSignalsAPI.updateProjectSignal(projectUuid: projectUuid, signalUuid: signalUuid, updateSignalRequest: updateSignalRequest) { (response, error) in
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
 **signalUuid** | **String** | 信号定義のUUID | 
 **updateSignalRequest** | [**UpdateSignalRequest**](UpdateSignalRequest.md) |  | [optional] 

### Return type

[**Signal**](Signal.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateSignal**
```swift
    open class func updateSignal(signalUuid: String, updateSignalRequest: UpdateSignalRequest? = nil, completion: @escaping (_ data: Signal?, _ error: Error?) -> Void)
```

Update Signal

信号定義を更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let signalUuid = "signalUuid_example" // String | 信号定義のUUID
let updateSignalRequest = UpdateSignalRequest(channel: 123, conversion: SignalConversion(type: SignalConversionOptionType(), options: SignalConversionOptionSubString(startbyte: 123, bytesize: 123)), dataId: "dataId_example", dataType: 123, description: "description_example", display: SignalDisplay(unit: "unit_example", min: 123, max: 123, format: "format_example"), label: "label_example") // UpdateSignalRequest |  (optional)

// Update Signal
MeasSignalsAPI.updateSignal(signalUuid: signalUuid, updateSignalRequest: updateSignalRequest) { (response, error) in
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
 **signalUuid** | **String** | 信号定義のUUID | 
 **updateSignalRequest** | [**UpdateSignalRequest**](UpdateSignalRequest.md) |  | [optional] 

### Return type

[**Signal**](Signal.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

