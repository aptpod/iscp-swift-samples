# MeasMeasurementMarkersAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createMeasurementMarker**](MeasMeasurementMarkersAPI.md#createmeasurementmarker) | **POST** /v1/measurements/{measurement_uuid}/markers | Create Measurement Marker by Measurement UUID
[**createProjectMeasurementMarker**](MeasMeasurementMarkersAPI.md#createprojectmeasurementmarker) | **POST** /v1/projects/{project_uuid}/measurements/{measurement_uuid}/markers | Create Project Measurement Marker by Measurement UUID
[**deleteMeasurementMarker**](MeasMeasurementMarkersAPI.md#deletemeasurementmarker) | **DELETE** /v1/measurements/markers/{measurement_marker_uuid} | Delete Measurement Marker
[**deleteMeasurementMarkerWithMeasurementUUIDAndMarkerUUID**](MeasMeasurementMarkersAPI.md#deletemeasurementmarkerwithmeasurementuuidandmarkeruuid) | **DELETE** /v1/measurements/{measurement_uuid}/markers/{measurement_marker_uuid} | Delete Measurement Marker using Measurement UUID
[**deleteMeasurementMarkers**](MeasMeasurementMarkersAPI.md#deletemeasurementmarkers) | **DELETE** /v1/measurements/{measurement_uuid}/markers | Delete Measurement Markers by Measurement UUID
[**deleteProjectMeasurementMarker**](MeasMeasurementMarkersAPI.md#deleteprojectmeasurementmarker) | **DELETE** /v1/projects/{project_uuid}/measurements/markers/{measurement_marker_uuid} | Delete Project Measurement Marker
[**deleteProjectMeasurementMarkerWithMeasurementUUIDAndMarkerUUID**](MeasMeasurementMarkersAPI.md#deleteprojectmeasurementmarkerwithmeasurementuuidandmarkeruuid) | **DELETE** /v1/projects/{project_uuid}/measurements/{measurement_uuid}/markers/{measurement_marker_uuid} | Delete Project Measurement Marker using Measurement UUID
[**deleteProjectMeasurementMarkers**](MeasMeasurementMarkersAPI.md#deleteprojectmeasurementmarkers) | **DELETE** /v1/projects/{project_uuid}/measurements/{measurement_uuid}/markers | Delete Project Measurement Markers by Measurement UUID
[**getMeasurementMarker**](MeasMeasurementMarkersAPI.md#getmeasurementmarker) | **GET** /v1/measurements/markers/{measurement_marker_uuid} | Get Measurement Marker
[**getMeasurementMarkerWithMeasurementUUIDAndMarkerUUID**](MeasMeasurementMarkersAPI.md#getmeasurementmarkerwithmeasurementuuidandmarkeruuid) | **GET** /v1/measurements/{measurement_uuid}/markers/{measurement_marker_uuid} | Get Measurement Marker using Measurement UUID
[**getMeasurementMarkersWithMeasurementUUID**](MeasMeasurementMarkersAPI.md#getmeasurementmarkerswithmeasurementuuid) | **GET** /v1/measurements/{measurement_uuid}/markers | List Measurement Markers by Measurement UUID
[**getProjectMeasurementMarker**](MeasMeasurementMarkersAPI.md#getprojectmeasurementmarker) | **GET** /v1/projects/{project_uuid}/measurements/markers/{measurement_marker_uuid} | Get Project Measurement Marker
[**getProjectMeasurementMarkerWithMeasurementUUIDAndMarkerUUID**](MeasMeasurementMarkersAPI.md#getprojectmeasurementmarkerwithmeasurementuuidandmarkeruuid) | **GET** /v1/projects/{project_uuid}/measurements/{measurement_uuid}/markers/{measurement_marker_uuid} | Get Project Measurement Marker using Measurement UUID
[**getProjectMeasurementMarkersWithMeasurementUUID**](MeasMeasurementMarkersAPI.md#getprojectmeasurementmarkerswithmeasurementuuid) | **GET** /v1/projects/{project_uuid}/measurements/{measurement_uuid}/markers | List Project Measurement Markers by Measurement UUID
[**listMeasurementMarkers**](MeasMeasurementMarkersAPI.md#listmeasurementmarkers) | **GET** /v1/measurements/markers | List Measurement Markers
[**listProjectMeasurementMarkers**](MeasMeasurementMarkersAPI.md#listprojectmeasurementmarkers) | **GET** /v1/projects/{project_uuid}/measurements/markers | List Project Measurement Markers
[**updateMeasurementMarker**](MeasMeasurementMarkersAPI.md#updatemeasurementmarker) | **PUT** /v1/measurements/markers/{measurement_marker_uuid} | Update Measurement Marker
[**updateMeasurementMarkerWithMeasurementUUIDAndMarkerUUID**](MeasMeasurementMarkersAPI.md#updatemeasurementmarkerwithmeasurementuuidandmarkeruuid) | **PUT** /v1/measurements/{measurement_uuid}/markers/{measurement_marker_uuid} | Replace Measurement Marker using Measurement UUID
[**updateProjectMeasurementMarker**](MeasMeasurementMarkersAPI.md#updateprojectmeasurementmarker) | **PUT** /v1/projects/{project_uuid}/measurements/markers/{measurement_marker_uuid} | Update Project Measurement Marker
[**updateProjectMeasurementMarkerWithMeasurementUUIDAndMarkerUUID**](MeasMeasurementMarkersAPI.md#updateprojectmeasurementmarkerwithmeasurementuuidandmarkeruuid) | **PUT** /v1/projects/{project_uuid}/measurements/{measurement_uuid}/markers/{measurement_marker_uuid} | Replace Project Measurement Marker using Measurement UUID


# **createMeasurementMarker**
```swift
    open class func createMeasurementMarker(measurementUuid: String, measurementMarkerPostRequest: MeasurementMarkerPostRequest? = nil, completion: @escaping (_ data: MeasurementMarker?, _ error: Error?) -> Void)
```

Create Measurement Marker by Measurement UUID

計測マーカーを作成します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let measurementMarkerPostRequest = MeasurementMarkerPostRequest(name: "name_example", description: "description_example", type: "type_example", tag: "TODO", detail: MeasurementMarkerDetailRange(startElapsedTime: 123, endElapsedTime: 123)) // MeasurementMarkerPostRequest |  (optional)

// Create Measurement Marker by Measurement UUID
MeasMeasurementMarkersAPI.createMeasurementMarker(measurementUuid: measurementUuid, measurementMarkerPostRequest: measurementMarkerPostRequest) { (response, error) in
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
 **measurementMarkerPostRequest** | [**MeasurementMarkerPostRequest**](MeasurementMarkerPostRequest.md) |  | [optional] 

### Return type

[**MeasurementMarker**](MeasurementMarker.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createProjectMeasurementMarker**
```swift
    open class func createProjectMeasurementMarker(projectUuid: String, measurementUuid: String, measurementMarkerPostRequest: MeasurementMarkerPostRequest? = nil, completion: @escaping (_ data: MeasurementMarker?, _ error: Error?) -> Void)
```

Create Project Measurement Marker by Measurement UUID

計測マーカーを作成します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let measurementMarkerPostRequest = MeasurementMarkerPostRequest(name: "name_example", description: "description_example", type: "type_example", tag: "TODO", detail: MeasurementMarkerDetailRange(startElapsedTime: 123, endElapsedTime: 123)) // MeasurementMarkerPostRequest |  (optional)

// Create Project Measurement Marker by Measurement UUID
MeasMeasurementMarkersAPI.createProjectMeasurementMarker(projectUuid: projectUuid, measurementUuid: measurementUuid, measurementMarkerPostRequest: measurementMarkerPostRequest) { (response, error) in
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
 **measurementMarkerPostRequest** | [**MeasurementMarkerPostRequest**](MeasurementMarkerPostRequest.md) |  | [optional] 

### Return type

[**MeasurementMarker**](MeasurementMarker.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteMeasurementMarker**
```swift
    open class func deleteMeasurementMarker(measurementMarkerUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Measurement Marker

計測マーカーを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementMarkerUuid = "measurementMarkerUuid_example" // String | 計測マーカーのUUID

// Delete Measurement Marker
MeasMeasurementMarkersAPI.deleteMeasurementMarker(measurementMarkerUuid: measurementMarkerUuid) { (response, error) in
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
 **measurementMarkerUuid** | **String** | 計測マーカーのUUID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteMeasurementMarkerWithMeasurementUUIDAndMarkerUUID**
```swift
    open class func deleteMeasurementMarkerWithMeasurementUUIDAndMarkerUUID(measurementUuid: String, measurementMarkerUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Measurement Marker using Measurement UUID

計測マーカーを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let measurementMarkerUuid = "measurementMarkerUuid_example" // String | 計測マーカーのUUID

// Delete Measurement Marker using Measurement UUID
MeasMeasurementMarkersAPI.deleteMeasurementMarkerWithMeasurementUUIDAndMarkerUUID(measurementUuid: measurementUuid, measurementMarkerUuid: measurementMarkerUuid) { (response, error) in
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
 **measurementMarkerUuid** | **String** | 計測マーカーのUUID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteMeasurementMarkers**
```swift
    open class func deleteMeasurementMarkers(measurementUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Measurement Markers by Measurement UUID

計測マーカーを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// Delete Measurement Markers by Measurement UUID
MeasMeasurementMarkersAPI.deleteMeasurementMarkers(measurementUuid: measurementUuid) { (response, error) in
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

# **deleteProjectMeasurementMarker**
```swift
    open class func deleteProjectMeasurementMarker(projectUuid: String, measurementMarkerUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Project Measurement Marker

計測マーカーを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementMarkerUuid = "measurementMarkerUuid_example" // String | 計測マーカーのUUID

// Delete Project Measurement Marker
MeasMeasurementMarkersAPI.deleteProjectMeasurementMarker(projectUuid: projectUuid, measurementMarkerUuid: measurementMarkerUuid) { (response, error) in
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
 **measurementMarkerUuid** | **String** | 計測マーカーのUUID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteProjectMeasurementMarkerWithMeasurementUUIDAndMarkerUUID**
```swift
    open class func deleteProjectMeasurementMarkerWithMeasurementUUIDAndMarkerUUID(projectUuid: String, measurementUuid: String, measurementMarkerUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Project Measurement Marker using Measurement UUID

計測マーカーを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let measurementMarkerUuid = "measurementMarkerUuid_example" // String | 計測マーカーのUUID

// Delete Project Measurement Marker using Measurement UUID
MeasMeasurementMarkersAPI.deleteProjectMeasurementMarkerWithMeasurementUUIDAndMarkerUUID(projectUuid: projectUuid, measurementUuid: measurementUuid, measurementMarkerUuid: measurementMarkerUuid) { (response, error) in
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
 **measurementMarkerUuid** | **String** | 計測マーカーのUUID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteProjectMeasurementMarkers**
```swift
    open class func deleteProjectMeasurementMarkers(projectUuid: String, measurementUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Project Measurement Markers by Measurement UUID

計測マーカーを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// Delete Project Measurement Markers by Measurement UUID
MeasMeasurementMarkersAPI.deleteProjectMeasurementMarkers(projectUuid: projectUuid, measurementUuid: measurementUuid) { (response, error) in
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

# **getMeasurementMarker**
```swift
    open class func getMeasurementMarker(measurementMarkerUuid: String, completion: @escaping (_ data: MeasurementMarker?, _ error: Error?) -> Void)
```

Get Measurement Marker

計測マーカーを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementMarkerUuid = "measurementMarkerUuid_example" // String | 計測マーカーのUUID

// Get Measurement Marker
MeasMeasurementMarkersAPI.getMeasurementMarker(measurementMarkerUuid: measurementMarkerUuid) { (response, error) in
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
 **measurementMarkerUuid** | **String** | 計測マーカーのUUID | 

### Return type

[**MeasurementMarker**](MeasurementMarker.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMeasurementMarkerWithMeasurementUUIDAndMarkerUUID**
```swift
    open class func getMeasurementMarkerWithMeasurementUUIDAndMarkerUUID(measurementUuid: String, measurementMarkerUuid: String, completion: @escaping (_ data: MeasurementMarker?, _ error: Error?) -> Void)
```

Get Measurement Marker using Measurement UUID

**Deprecated** このエンドポイントではなく、 `GET /measurements/{measurement_uuid}` を使用してください。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let measurementMarkerUuid = "measurementMarkerUuid_example" // String | 計測マーカーのUUID

// Get Measurement Marker using Measurement UUID
MeasMeasurementMarkersAPI.getMeasurementMarkerWithMeasurementUUIDAndMarkerUUID(measurementUuid: measurementUuid, measurementMarkerUuid: measurementMarkerUuid) { (response, error) in
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
 **measurementMarkerUuid** | **String** | 計測マーカーのUUID | 

### Return type

[**MeasurementMarker**](MeasurementMarker.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMeasurementMarkersWithMeasurementUUID**
```swift
    open class func getMeasurementMarkersWithMeasurementUUID(measurementUuid: String, completion: @escaping (_ data: MeasurementMarkersWithoutPage?, _ error: Error?) -> Void)
```

List Measurement Markers by Measurement UUID

(**Deprecated** このエンドポイントではなく、 `GET /measurements/{measurement_uuid}` を使用してください。) 計測UUIDを指定して、その計測に付与されたマーカーの一覧を取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// List Measurement Markers by Measurement UUID
MeasMeasurementMarkersAPI.getMeasurementMarkersWithMeasurementUUID(measurementUuid: measurementUuid) { (response, error) in
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

[**MeasurementMarkersWithoutPage**](MeasurementMarkersWithoutPage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectMeasurementMarker**
```swift
    open class func getProjectMeasurementMarker(projectUuid: String, measurementMarkerUuid: String, completion: @escaping (_ data: MeasurementMarker?, _ error: Error?) -> Void)
```

Get Project Measurement Marker

計測マーカーを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementMarkerUuid = "measurementMarkerUuid_example" // String | 計測マーカーのUUID

// Get Project Measurement Marker
MeasMeasurementMarkersAPI.getProjectMeasurementMarker(projectUuid: projectUuid, measurementMarkerUuid: measurementMarkerUuid) { (response, error) in
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
 **measurementMarkerUuid** | **String** | 計測マーカーのUUID | 

### Return type

[**MeasurementMarker**](MeasurementMarker.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectMeasurementMarkerWithMeasurementUUIDAndMarkerUUID**
```swift
    open class func getProjectMeasurementMarkerWithMeasurementUUIDAndMarkerUUID(projectUuid: String, measurementUuid: String, measurementMarkerUuid: String, completion: @escaping (_ data: MeasurementMarker?, _ error: Error?) -> Void)
```

Get Project Measurement Marker using Measurement UUID

**Deprecated** このエンドポイントではなく、 `GET /measurements/{measurement_uuid}` を使用してください。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let measurementMarkerUuid = "measurementMarkerUuid_example" // String | 計測マーカーのUUID

// Get Project Measurement Marker using Measurement UUID
MeasMeasurementMarkersAPI.getProjectMeasurementMarkerWithMeasurementUUIDAndMarkerUUID(projectUuid: projectUuid, measurementUuid: measurementUuid, measurementMarkerUuid: measurementMarkerUuid) { (response, error) in
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
 **measurementMarkerUuid** | **String** | 計測マーカーのUUID | 

### Return type

[**MeasurementMarker**](MeasurementMarker.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectMeasurementMarkersWithMeasurementUUID**
```swift
    open class func getProjectMeasurementMarkersWithMeasurementUUID(projectUuid: String, measurementUuid: String, completion: @escaping (_ data: MeasurementMarkersWithoutPage?, _ error: Error?) -> Void)
```

List Project Measurement Markers by Measurement UUID

(**Deprecated** このエンドポイントではなく、 `GET /measurements/{measurement_uuid}` を使用してください。) 計測UUIDを指定して、その計測に付与されたマーカーの一覧を取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// List Project Measurement Markers by Measurement UUID
MeasMeasurementMarkersAPI.getProjectMeasurementMarkersWithMeasurementUUID(projectUuid: projectUuid, measurementUuid: measurementUuid) { (response, error) in
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

[**MeasurementMarkersWithoutPage**](MeasurementMarkersWithoutPage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMeasurementMarkers**
```swift
    open class func listMeasurementMarkers(uuid: [String]? = nil, name: [String]? = nil, startUnixMicro: Int64? = nil, endUnixMicro: Int64? = nil, tagKey: [String]? = nil, tagKey2: [String]? = nil, limit: Int? = nil, sort: Sort_listMeasurementMarkers? = nil, page: Int? = nil, order: Order_listMeasurementMarkers? = nil, completion: @escaping (_ data: MeasurementMarkers?, _ error: Error?) -> Void)
```

List Measurement Markers

計測マーカーのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let uuid = ["inner_example"] // [String] | 計測マーカーのUUID (optional)
let name = ["inner_example"] // [String] | 計測マーカーの名前 (optional)
let startUnixMicro = 987 // Int64 | Get MeasMarkers which start Meas.BaseTime + elapsed_time &lt;= this[usec]. (optional)
let endUnixMicro = 987 // Int64 | Get MeasMarkers which start this[usec] &lt; Meas.BaseTime + elapsed_time. (optional)
let tagKey = ["inner_example"] // [String] | タグのキーと値を使って条件を指定し、条件に一致する計測マーカーを取得します。 キーのみを指定した場合は、指定されたキーを持つ計測マーカーを取得します。 キーと値を指定した場合は、指定されたキーを持ち、その値として指定された値を含む計測マーカーを取得します。 `tag.<key>=<value>` 条件は複数個指定することができ、OR条件で使用されます。 ただし `!tag.<key>` と組み合わせた場合、  `!tag.<key>` が優先されます。  例:      | measurement marker | tag (key: value) |     | ------------------ | ---------------- |     | 1                  | a: value1        |     |                    | c: value2        |     |                    | e: 1             |      | 2                  | a: b             |     |                    | c: d             |      | 3                  | a: b             |    -  `?tag.e=` の場合、計測マーカー1番が取得されます。   -  `?!tag.c=` の場合、計測マーカー3番が取得されます。   -  `?tag.a=&!tag.e=` の場合、計測マーカー2、3番が取得されます。   -  `?tag.a=val&tag.c=d` の場合、計測マーカー1、2番が取得されます。 (optional)
let tagKey2 = ["inner_example"] // [String] | タグのキーを使って条件を指定し、条件に一致する計測キャプチャを除外します。 タグの値は無視されます。 `!tag.<key>` を複数個指定した場合、AND条件となります。 また、 `tag.<key>=<value>` と組み合わせて使用した場合、 `tag.<key>=<value>`  よりも `!tag.<key>` が優先されます。 例: 上の `tag.<key>` の説明を参照してください。 (optional)
let limit = 987 // Int | 1回のリクエストで取得する件数 (optional)
let sort = "sort_example" // String | 並べ替えに使用するキー (optional) (default to .baseTime)
let page = 987 // Int | 取得するページの番号 (optional)
let order = "order_example" // String | 並べ替えの順序 (optional)

// List Measurement Markers
MeasMeasurementMarkersAPI.listMeasurementMarkers(uuid: uuid, name: name, startUnixMicro: startUnixMicro, endUnixMicro: endUnixMicro, tagKey: tagKey, tagKey2: tagKey2, limit: limit, sort: sort, page: page, order: order) { (response, error) in
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
 **uuid** | [**[String]**](String.md) | 計測マーカーのUUID | [optional] 
 **name** | [**[String]**](String.md) | 計測マーカーの名前 | [optional] 
 **startUnixMicro** | **Int64** | Get MeasMarkers which start Meas.BaseTime + elapsed_time &amp;lt;&#x3D; this[usec]. | [optional] 
 **endUnixMicro** | **Int64** | Get MeasMarkers which start this[usec] &amp;lt; Meas.BaseTime + elapsed_time. | [optional] 
 **tagKey** | [**[String]**](String.md) | タグのキーと値を使って条件を指定し、条件に一致する計測マーカーを取得します。 キーのみを指定した場合は、指定されたキーを持つ計測マーカーを取得します。 キーと値を指定した場合は、指定されたキーを持ち、その値として指定された値を含む計測マーカーを取得します。 &#x60;tag.&lt;key&gt;&#x3D;&lt;value&gt;&#x60; 条件は複数個指定することができ、OR条件で使用されます。 ただし &#x60;!tag.&lt;key&gt;&#x60; と組み合わせた場合、  &#x60;!tag.&lt;key&gt;&#x60; が優先されます。  例:      | measurement marker | tag (key: value) |     | ------------------ | ---------------- |     | 1                  | a: value1        |     |                    | c: value2        |     |                    | e: 1             |      | 2                  | a: b             |     |                    | c: d             |      | 3                  | a: b             |    -  &#x60;?tag.e&#x3D;&#x60; の場合、計測マーカー1番が取得されます。   -  &#x60;?!tag.c&#x3D;&#x60; の場合、計測マーカー3番が取得されます。   -  &#x60;?tag.a&#x3D;&amp;!tag.e&#x3D;&#x60; の場合、計測マーカー2、3番が取得されます。   -  &#x60;?tag.a&#x3D;val&amp;tag.c&#x3D;d&#x60; の場合、計測マーカー1、2番が取得されます。 | [optional] 
 **tagKey2** | [**[String]**](String.md) | タグのキーを使って条件を指定し、条件に一致する計測キャプチャを除外します。 タグの値は無視されます。 &#x60;!tag.&lt;key&gt;&#x60; を複数個指定した場合、AND条件となります。 また、 &#x60;tag.&lt;key&gt;&#x3D;&lt;value&gt;&#x60; と組み合わせて使用した場合、 &#x60;tag.&lt;key&gt;&#x3D;&lt;value&gt;&#x60;  よりも &#x60;!tag.&lt;key&gt;&#x60; が優先されます。 例: 上の &#x60;tag.&lt;key&gt;&#x60; の説明を参照してください。 | [optional] 
 **limit** | **Int** | 1回のリクエストで取得する件数 | [optional] 
 **sort** | **String** | 並べ替えに使用するキー | [optional] [default to .baseTime]
 **page** | **Int** | 取得するページの番号 | [optional] 
 **order** | **String** | 並べ替えの順序 | [optional] 

### Return type

[**MeasurementMarkers**](MeasurementMarkers.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listProjectMeasurementMarkers**
```swift
    open class func listProjectMeasurementMarkers(projectUuid: String, uuid: [String]? = nil, name: [String]? = nil, startUnixMicro: Int64? = nil, endUnixMicro: Int64? = nil, tagKey: [String]? = nil, tagKey2: [String]? = nil, limit: Int? = nil, sort: Sort_listProjectMeasurementMarkers? = nil, page: Int? = nil, order: Order_listProjectMeasurementMarkers? = nil, completion: @escaping (_ data: MeasurementMarkers?, _ error: Error?) -> Void)
```

List Project Measurement Markers

計測マーカーのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let uuid = ["inner_example"] // [String] | 計測マーカーのUUID (optional)
let name = ["inner_example"] // [String] | 計測マーカーの名前 (optional)
let startUnixMicro = 987 // Int64 | Get MeasMarkers which start Meas.BaseTime + elapsed_time &lt;= this[usec]. (optional)
let endUnixMicro = 987 // Int64 | Get MeasMarkers which start this[usec] &lt; Meas.BaseTime + elapsed_time. (optional)
let tagKey = ["inner_example"] // [String] | タグのキーと値を使って条件を指定し、条件に一致する計測マーカーを取得します。 キーのみを指定した場合は、指定されたキーを持つ計測マーカーを取得します。 キーと値を指定した場合は、指定されたキーを持ち、その値として指定された値を含む計測マーカーを取得します。 `tag.<key>=<value>` 条件は複数個指定することができ、OR条件で使用されます。 ただし `!tag.<key>` と組み合わせた場合、  `!tag.<key>` が優先されます。  例:      | measurement marker | tag (key: value) |     | ------------------ | ---------------- |     | 1                  | a: value1        |     |                    | c: value2        |     |                    | e: 1             |      | 2                  | a: b             |     |                    | c: d             |      | 3                  | a: b             |    -  `?tag.e=` の場合、計測マーカー1番が取得されます。   -  `?!tag.c=` の場合、計測マーカー3番が取得されます。   -  `?tag.a=&!tag.e=` の場合、計測マーカー2、3番が取得されます。   -  `?tag.a=val&tag.c=d` の場合、計測マーカー1、2番が取得されます。 (optional)
let tagKey2 = ["inner_example"] // [String] | タグのキーを使って条件を指定し、条件に一致する計測キャプチャを除外します。 タグの値は無視されます。 `!tag.<key>` を複数個指定した場合、AND条件となります。 また、 `tag.<key>=<value>` と組み合わせて使用した場合、 `tag.<key>=<value>`  よりも `!tag.<key>` が優先されます。 例: 上の `tag.<key>` の説明を参照してください。 (optional)
let limit = 987 // Int | 1回のリクエストで取得する件数 (optional)
let sort = "sort_example" // String | 並べ替えに使用するキー (optional) (default to .baseTime)
let page = 987 // Int | 取得するページの番号 (optional)
let order = "order_example" // String | 並べ替えの順序 (optional)

// List Project Measurement Markers
MeasMeasurementMarkersAPI.listProjectMeasurementMarkers(projectUuid: projectUuid, uuid: uuid, name: name, startUnixMicro: startUnixMicro, endUnixMicro: endUnixMicro, tagKey: tagKey, tagKey2: tagKey2, limit: limit, sort: sort, page: page, order: order) { (response, error) in
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
 **uuid** | [**[String]**](String.md) | 計測マーカーのUUID | [optional] 
 **name** | [**[String]**](String.md) | 計測マーカーの名前 | [optional] 
 **startUnixMicro** | **Int64** | Get MeasMarkers which start Meas.BaseTime + elapsed_time &amp;lt;&#x3D; this[usec]. | [optional] 
 **endUnixMicro** | **Int64** | Get MeasMarkers which start this[usec] &amp;lt; Meas.BaseTime + elapsed_time. | [optional] 
 **tagKey** | [**[String]**](String.md) | タグのキーと値を使って条件を指定し、条件に一致する計測マーカーを取得します。 キーのみを指定した場合は、指定されたキーを持つ計測マーカーを取得します。 キーと値を指定した場合は、指定されたキーを持ち、その値として指定された値を含む計測マーカーを取得します。 &#x60;tag.&lt;key&gt;&#x3D;&lt;value&gt;&#x60; 条件は複数個指定することができ、OR条件で使用されます。 ただし &#x60;!tag.&lt;key&gt;&#x60; と組み合わせた場合、  &#x60;!tag.&lt;key&gt;&#x60; が優先されます。  例:      | measurement marker | tag (key: value) |     | ------------------ | ---------------- |     | 1                  | a: value1        |     |                    | c: value2        |     |                    | e: 1             |      | 2                  | a: b             |     |                    | c: d             |      | 3                  | a: b             |    -  &#x60;?tag.e&#x3D;&#x60; の場合、計測マーカー1番が取得されます。   -  &#x60;?!tag.c&#x3D;&#x60; の場合、計測マーカー3番が取得されます。   -  &#x60;?tag.a&#x3D;&amp;!tag.e&#x3D;&#x60; の場合、計測マーカー2、3番が取得されます。   -  &#x60;?tag.a&#x3D;val&amp;tag.c&#x3D;d&#x60; の場合、計測マーカー1、2番が取得されます。 | [optional] 
 **tagKey2** | [**[String]**](String.md) | タグのキーを使って条件を指定し、条件に一致する計測キャプチャを除外します。 タグの値は無視されます。 &#x60;!tag.&lt;key&gt;&#x60; を複数個指定した場合、AND条件となります。 また、 &#x60;tag.&lt;key&gt;&#x3D;&lt;value&gt;&#x60; と組み合わせて使用した場合、 &#x60;tag.&lt;key&gt;&#x3D;&lt;value&gt;&#x60;  よりも &#x60;!tag.&lt;key&gt;&#x60; が優先されます。 例: 上の &#x60;tag.&lt;key&gt;&#x60; の説明を参照してください。 | [optional] 
 **limit** | **Int** | 1回のリクエストで取得する件数 | [optional] 
 **sort** | **String** | 並べ替えに使用するキー | [optional] [default to .baseTime]
 **page** | **Int** | 取得するページの番号 | [optional] 
 **order** | **String** | 並べ替えの順序 | [optional] 

### Return type

[**MeasurementMarkers**](MeasurementMarkers.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMeasurementMarker**
```swift
    open class func updateMeasurementMarker(measurementMarkerUuid: String, measurementMarkerPutRequest: MeasurementMarkerPutRequest? = nil, completion: @escaping (_ data: MeasurementMarker?, _ error: Error?) -> Void)
```

Update Measurement Marker

計測マーカーを更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementMarkerUuid = "measurementMarkerUuid_example" // String | 計測マーカーのUUID
let measurementMarkerPutRequest = MeasurementMarkerPutRequest(name: "name_example", description: "description_example", type: "type_example", tag: "TODO", detail: MeasurementMarkerDetailRange(startElapsedTime: 123, endElapsedTime: 123)) // MeasurementMarkerPutRequest |  (optional)

// Update Measurement Marker
MeasMeasurementMarkersAPI.updateMeasurementMarker(measurementMarkerUuid: measurementMarkerUuid, measurementMarkerPutRequest: measurementMarkerPutRequest) { (response, error) in
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
 **measurementMarkerUuid** | **String** | 計測マーカーのUUID | 
 **measurementMarkerPutRequest** | [**MeasurementMarkerPutRequest**](MeasurementMarkerPutRequest.md) |  | [optional] 

### Return type

[**MeasurementMarker**](MeasurementMarker.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMeasurementMarkerWithMeasurementUUIDAndMarkerUUID**
```swift
    open class func updateMeasurementMarkerWithMeasurementUUIDAndMarkerUUID(measurementUuid: String, measurementMarkerUuid: String, measurementMarkerPutRequest: MeasurementMarkerPutRequest? = nil, completion: @escaping (_ data: MeasurementMarker?, _ error: Error?) -> Void)
```

Replace Measurement Marker using Measurement UUID

計測マーカーの情報を更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let measurementMarkerUuid = "measurementMarkerUuid_example" // String | 計測マーカーのUUID
let measurementMarkerPutRequest = MeasurementMarkerPutRequest(name: "name_example", description: "description_example", type: "type_example", tag: "TODO", detail: MeasurementMarkerDetailRange(startElapsedTime: 123, endElapsedTime: 123)) // MeasurementMarkerPutRequest |  (optional)

// Replace Measurement Marker using Measurement UUID
MeasMeasurementMarkersAPI.updateMeasurementMarkerWithMeasurementUUIDAndMarkerUUID(measurementUuid: measurementUuid, measurementMarkerUuid: measurementMarkerUuid, measurementMarkerPutRequest: measurementMarkerPutRequest) { (response, error) in
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
 **measurementMarkerUuid** | **String** | 計測マーカーのUUID | 
 **measurementMarkerPutRequest** | [**MeasurementMarkerPutRequest**](MeasurementMarkerPutRequest.md) |  | [optional] 

### Return type

[**MeasurementMarker**](MeasurementMarker.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateProjectMeasurementMarker**
```swift
    open class func updateProjectMeasurementMarker(projectUuid: String, measurementMarkerUuid: String, measurementMarkerPutRequest: MeasurementMarkerPutRequest? = nil, completion: @escaping (_ data: MeasurementMarker?, _ error: Error?) -> Void)
```

Update Project Measurement Marker

計測マーカーを更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementMarkerUuid = "measurementMarkerUuid_example" // String | 計測マーカーのUUID
let measurementMarkerPutRequest = MeasurementMarkerPutRequest(name: "name_example", description: "description_example", type: "type_example", tag: "TODO", detail: MeasurementMarkerDetailRange(startElapsedTime: 123, endElapsedTime: 123)) // MeasurementMarkerPutRequest |  (optional)

// Update Project Measurement Marker
MeasMeasurementMarkersAPI.updateProjectMeasurementMarker(projectUuid: projectUuid, measurementMarkerUuid: measurementMarkerUuid, measurementMarkerPutRequest: measurementMarkerPutRequest) { (response, error) in
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
 **measurementMarkerUuid** | **String** | 計測マーカーのUUID | 
 **measurementMarkerPutRequest** | [**MeasurementMarkerPutRequest**](MeasurementMarkerPutRequest.md) |  | [optional] 

### Return type

[**MeasurementMarker**](MeasurementMarker.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateProjectMeasurementMarkerWithMeasurementUUIDAndMarkerUUID**
```swift
    open class func updateProjectMeasurementMarkerWithMeasurementUUIDAndMarkerUUID(projectUuid: String, measurementUuid: String, measurementMarkerUuid: String, measurementMarkerPutRequest: MeasurementMarkerPutRequest? = nil, completion: @escaping (_ data: MeasurementMarker?, _ error: Error?) -> Void)
```

Replace Project Measurement Marker using Measurement UUID

計測マーカーの情報を更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let measurementMarkerUuid = "measurementMarkerUuid_example" // String | 計測マーカーのUUID
let measurementMarkerPutRequest = MeasurementMarkerPutRequest(name: "name_example", description: "description_example", type: "type_example", tag: "TODO", detail: MeasurementMarkerDetailRange(startElapsedTime: 123, endElapsedTime: 123)) // MeasurementMarkerPutRequest |  (optional)

// Replace Project Measurement Marker using Measurement UUID
MeasMeasurementMarkersAPI.updateProjectMeasurementMarkerWithMeasurementUUIDAndMarkerUUID(projectUuid: projectUuid, measurementUuid: measurementUuid, measurementMarkerUuid: measurementMarkerUuid, measurementMarkerPutRequest: measurementMarkerPutRequest) { (response, error) in
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
 **measurementMarkerUuid** | **String** | 計測マーカーのUUID | 
 **measurementMarkerPutRequest** | [**MeasurementMarkerPutRequest**](MeasurementMarkerPutRequest.md) |  | [optional] 

### Return type

[**MeasurementMarker**](MeasurementMarker.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

