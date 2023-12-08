# MeasTrashedMeasurementsAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteProjectTrashedMeasurement**](MeasTrashedMeasurementsAPI.md#deleteprojecttrashedmeasurement) | **DELETE** /v1/projects/{project_uuid}/trashed_measurements/{measurement_uuid} | Delete Project Trashed Measurement and Delete Data Points Immediately
[**deleteTrashedMeasurement**](MeasTrashedMeasurementsAPI.md#deletetrashedmeasurement) | **DELETE** /v1/trashed_measurements/{measurement_uuid} | Delete Trashed Measurement and Delete Data Points Immediately
[**listProjectTrashedMeasurements**](MeasTrashedMeasurementsAPI.md#listprojecttrashedmeasurements) | **GET** /v1/projects/{project_uuid}/trashed_measurements | List Project Trashed Measurements
[**listTrashedMeasurements**](MeasTrashedMeasurementsAPI.md#listtrashedmeasurements) | **GET** /v1/trashed_measurements | List Trashed Measurements
[**restoreProjectTrashedMeasurement**](MeasTrashedMeasurementsAPI.md#restoreprojecttrashedmeasurement) | **DELETE** /v1/projects/{project_uuid}/trashed_measurements/{measurement_uuid}/restore | Restore Project Measurement
[**restoreTrashedMeasurement**](MeasTrashedMeasurementsAPI.md#restoretrashedmeasurement) | **DELETE** /v1/trashed_measurements/{measurement_uuid}/restore | Restore Measurement


# **deleteProjectTrashedMeasurement**
```swift
    open class func deleteProjectTrashedMeasurement(projectUuid: String, measurementUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Project Trashed Measurement and Delete Data Points Immediately

ゴミ箱に入っている計測と、その計測に関連付けられているデータポイントを直ちに削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// Delete Project Trashed Measurement and Delete Data Points Immediately
MeasTrashedMeasurementsAPI.deleteProjectTrashedMeasurement(projectUuid: projectUuid, measurementUuid: measurementUuid) { (response, error) in
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

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteTrashedMeasurement**
```swift
    open class func deleteTrashedMeasurement(measurementUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Trashed Measurement and Delete Data Points Immediately

ゴミ箱に入っている計測と、その計測に関連付けられているデータポイントを直ちに削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// Delete Trashed Measurement and Delete Data Points Immediately
MeasTrashedMeasurementsAPI.deleteTrashedMeasurement(measurementUuid: measurementUuid) { (response, error) in
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

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listProjectTrashedMeasurements**
```swift
    open class func listProjectTrashedMeasurements(projectUuid: String, limit: Int? = nil, page: Int? = nil, completion: @escaping (_ data: TrashedMeasurements?, _ error: Error?) -> Void)
```

List Project Trashed Measurements

ゴミ箱に入っている計測のリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let limit = 987 // Int | 1回のリクエストで取得する件数。`0` を指定した場合は、デフォルト値の50件となります。 (optional)
let page = 987 // Int | 取得するページの番号 (optional)

// List Project Trashed Measurements
MeasTrashedMeasurementsAPI.listProjectTrashedMeasurements(projectUuid: projectUuid, limit: limit, page: page) { (response, error) in
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
 **limit** | **Int** | 1回のリクエストで取得する件数。&#x60;0&#x60; を指定した場合は、デフォルト値の50件となります。 | [optional] 
 **page** | **Int** | 取得するページの番号 | [optional] 

### Return type

[**TrashedMeasurements**](TrashedMeasurements.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listTrashedMeasurements**
```swift
    open class func listTrashedMeasurements(limit: Int? = nil, page: Int? = nil, completion: @escaping (_ data: TrashedMeasurements?, _ error: Error?) -> Void)
```

List Trashed Measurements

ゴミ箱に入っている計測のリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let limit = 987 // Int | 1回のリクエストで取得する件数。`0` を指定した場合は、デフォルト値の50件となります。 (optional)
let page = 987 // Int | 取得するページの番号 (optional)

// List Trashed Measurements
MeasTrashedMeasurementsAPI.listTrashedMeasurements(limit: limit, page: page) { (response, error) in
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
 **limit** | **Int** | 1回のリクエストで取得する件数。&#x60;0&#x60; を指定した場合は、デフォルト値の50件となります。 | [optional] 
 **page** | **Int** | 取得するページの番号 | [optional] 

### Return type

[**TrashedMeasurements**](TrashedMeasurements.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **restoreProjectTrashedMeasurement**
```swift
    open class func restoreProjectTrashedMeasurement(projectUuid: String, measurementUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Restore Project Measurement

ゴミ箱に入っている計測を復元します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// Restore Project Measurement
MeasTrashedMeasurementsAPI.restoreProjectTrashedMeasurement(projectUuid: projectUuid, measurementUuid: measurementUuid) { (response, error) in
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

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **restoreTrashedMeasurement**
```swift
    open class func restoreTrashedMeasurement(measurementUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Restore Measurement

ゴミ箱に入っている計測を復元します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// Restore Measurement
MeasTrashedMeasurementsAPI.restoreTrashedMeasurement(measurementUuid: measurementUuid) { (response, error) in
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

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

