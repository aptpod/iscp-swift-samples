# MeasMeasurementsAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**completeMeasurement**](MeasMeasurementsAPI.md#completemeasurement) | **PUT** /v1/measurements/{measurement_uuid}/complete | Complete Measurement
[**completeProjectMeasurement**](MeasMeasurementsAPI.md#completeprojectmeasurement) | **PUT** /v1/projects/{project_uuid}/measurements/{measurement_uuid}/complete | Complete Project Measurement
[**createMeasurement**](MeasMeasurementsAPI.md#createmeasurement) | **POST** /v1/measurements | Create Measurement
[**createMeasurementChunks**](MeasMeasurementsAPI.md#createmeasurementchunks) | **POST** /v1/measurements/sequences/chunks | Create Measurement Sequence Chunk
[**createMeasurementWithUUID**](MeasMeasurementsAPI.md#createmeasurementwithuuid) | **POST** /v1/measurements/{measurement_uuid} | Create Measurement with UUID
[**createProjectMeasurement**](MeasMeasurementsAPI.md#createprojectmeasurement) | **POST** /v1/projects/{project_uuid}/measurements | Create Project Measurement
[**createProjectMeasurementChunks**](MeasMeasurementsAPI.md#createprojectmeasurementchunks) | **POST** /v1/projects/{project_uuid}/measurements/sequences/chunks | Create Project Measurement Sequence Chunk
[**createProjectMeasurementWithUUID**](MeasMeasurementsAPI.md#createprojectmeasurementwithuuid) | **POST** /v1/projects/{project_uuid}/measurements/{measurement_uuid} | Create Project Measurement with UUID
[**deleteMeasurement**](MeasMeasurementsAPI.md#deletemeasurement) | **DELETE** /v1/measurements/{measurement_uuid} | Trash Measurement
[**deleteMeasurementBaseTime**](MeasMeasurementsAPI.md#deletemeasurementbasetime) | **DELETE** /v1/measurements/{measurement_uuid}/basetimes/{type} | Delete Measurement Base Time
[**deleteProjectMeasurement**](MeasMeasurementsAPI.md#deleteprojectmeasurement) | **DELETE** /v1/projects/{project_uuid}/measurements/{measurement_uuid} | Trash Project Measurement
[**deleteProjectMeasurementBaseTime**](MeasMeasurementsAPI.md#deleteprojectmeasurementbasetime) | **DELETE** /v1/projects/{project_uuid}/measurements/{measurement_uuid}/basetimes/{type} | Delete Project Measurement Base Time
[**endMeasurement**](MeasMeasurementsAPI.md#endmeasurement) | **PUT** /v1/measurements/{measurement_uuid}/end | End Measurement
[**endProjectMeasurement**](MeasMeasurementsAPI.md#endprojectmeasurement) | **PUT** /v1/projects/{project_uuid}/measurements/{measurement_uuid}/end | End Project Measurement
[**getMeasurement**](MeasMeasurementsAPI.md#getmeasurement) | **GET** /v1/measurements/{measurement_uuid} | Get Measurement
[**getMeasurementBaseTime**](MeasMeasurementsAPI.md#getmeasurementbasetime) | **GET** /v1/measurements/{measurement_uuid}/basetimes/{type} | Get Measurement Base Time
[**getMeasurementFromMeasurementMarker**](MeasMeasurementsAPI.md#getmeasurementfrommeasurementmarker) | **GET** /v1/measurements/markers/{measurement_marker_uuid}/measurement | Get Measurement from Marker
[**getMeasurementSections**](MeasMeasurementsAPI.md#getmeasurementsections) | **GET** /v1/measurements/{measurement_uuid}/sections | List Measurement Sections
[**getMeasurementSequence**](MeasMeasurementsAPI.md#getmeasurementsequence) | **GET** /v1/measurements/{measurement_uuid}/sequences/{sequences_uuid} | Get Measurement Sequence
[**getProjectMeasurement**](MeasMeasurementsAPI.md#getprojectmeasurement) | **GET** /v1/projects/{project_uuid}/measurements/{measurement_uuid} | Get Project Measurement
[**getProjectMeasurementBaseTime**](MeasMeasurementsAPI.md#getprojectmeasurementbasetime) | **GET** /v1/projects/{project_uuid}/measurements/{measurement_uuid}/basetimes/{type} | Get Project Measurement Base Time
[**getProjectMeasurementSections**](MeasMeasurementsAPI.md#getprojectmeasurementsections) | **GET** /v1/projects/{project_uuid}/measurements/{measurement_uuid}/sections | List Project Measurement Sections
[**getProjectMeasurementSequence**](MeasMeasurementsAPI.md#getprojectmeasurementsequence) | **GET** /v1/projects/{project_uuid}/measurements/{measurement_uuid}/sequences/{sequences_uuid} | Get Project Measurement Sequence
[**listMeasurementBaseTimes**](MeasMeasurementsAPI.md#listmeasurementbasetimes) | **GET** /v1/measurements/{measurement_uuid}/basetimes | List Measurement Base Times
[**listMeasurementSequences**](MeasMeasurementsAPI.md#listmeasurementsequences) | **GET** /v1/measurements/{measurement_uuid}/sequences | List Measurement Sequences
[**listMeasurements**](MeasMeasurementsAPI.md#listmeasurements) | **GET** /v1/measurements | List Measurements
[**listProjectMeasurementBaseTimes**](MeasMeasurementsAPI.md#listprojectmeasurementbasetimes) | **GET** /v1/projects/{project_uuid}/measurements/{measurement_uuid}/basetimes | List Project Measurement Base Times
[**listProjectMeasurementSequences**](MeasMeasurementsAPI.md#listprojectmeasurementsequences) | **GET** /v1/projects/{project_uuid}/measurements/{measurement_uuid}/sequences | List Project Measurement Sequences
[**listProjectMeasurements**](MeasMeasurementsAPI.md#listprojectmeasurements) | **GET** /v1/projects/{project_uuid}/measurements | List Project Measurements
[**protectMeasurement**](MeasMeasurementsAPI.md#protectmeasurement) | **PUT** /v1/measurements/{measurement_uuid}/protected | Protect Measurement
[**protectProjectMeasurement**](MeasMeasurementsAPI.md#protectprojectmeasurement) | **PUT** /v1/projects/{project_uuid}/measurements/{measurement_uuid}/protected | Protect Project Measurement
[**replaceMeasurementSequence**](MeasMeasurementsAPI.md#replacemeasurementsequence) | **PUT** /v1/measurements/{measurement_uuid}/sequences/{sequences_uuid} | Replace Measurement Sequence
[**replaceProjectMeasurementSequence**](MeasMeasurementsAPI.md#replaceprojectmeasurementsequence) | **PUT** /v1/projects/{project_uuid}/measurements/{measurement_uuid}/sequences/{sequences_uuid} | Replace Project Measurement Sequence
[**unprotectMeasurement**](MeasMeasurementsAPI.md#unprotectmeasurement) | **DELETE** /v1/measurements/{measurement_uuid}/protected | Unprotect Measurement
[**unprotectProjectMeasurement**](MeasMeasurementsAPI.md#unprotectprojectmeasurement) | **DELETE** /v1/projects/{project_uuid}/measurements/{measurement_uuid}/protected | Unprotect Project Measurement
[**updateMeasurement**](MeasMeasurementsAPI.md#updatemeasurement) | **PUT** /v1/measurements/{measurement_uuid} | Update Measurement
[**updateMeasurementBaseTime**](MeasMeasurementsAPI.md#updatemeasurementbasetime) | **PUT** /v1/measurements/{measurement_uuid}/basetimes/{type} | Replace Measurement Base Time
[**updateMeasurementSequence**](MeasMeasurementsAPI.md#updatemeasurementsequence) | **PATCH** /v1/measurements/{measurement_uuid}/sequences/{sequences_uuid} | Update Measurement Sequence
[**updateProjectMeasurement**](MeasMeasurementsAPI.md#updateprojectmeasurement) | **PUT** /v1/projects/{project_uuid}/measurements/{measurement_uuid} | Update Project Measurement
[**updateProjectMeasurementBaseTime**](MeasMeasurementsAPI.md#updateprojectmeasurementbasetime) | **PUT** /v1/projects/{project_uuid}/measurements/{measurement_uuid}/basetimes/{type} | Replace Project Measurement Base Time
[**updateProjectMeasurementSequence**](MeasMeasurementsAPI.md#updateprojectmeasurementsequence) | **PATCH** /v1/projects/{project_uuid}/measurements/{measurement_uuid}/sequences/{sequences_uuid} | Update Project Measurement Sequence


# **completeMeasurement**
```swift
    open class func completeMeasurement(measurementUuid: String, completion: @escaping (_ data: Measurement?, _ error: Error?) -> Void)
```

Complete Measurement

計測を回収完了（completed）にします。 completedは、エッジでのデータ取得が終了し（ended）、 かつ、すべてのデータがサーバーに送信されたことを意味します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// Complete Measurement
MeasMeasurementsAPI.completeMeasurement(measurementUuid: measurementUuid) { (response, error) in
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

[**Measurement**](Measurement.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **completeProjectMeasurement**
```swift
    open class func completeProjectMeasurement(projectUuid: String, measurementUuid: String, completion: @escaping (_ data: Measurement?, _ error: Error?) -> Void)
```

Complete Project Measurement

計測を回収完了（completed）にします。 completedは、エッジでのデータ取得が終了し（ended）、 かつ、すべてのデータがサーバーに送信されたことを意味します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// Complete Project Measurement
MeasMeasurementsAPI.completeProjectMeasurement(projectUuid: projectUuid, measurementUuid: measurementUuid) { (response, error) in
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

[**Measurement**](Measurement.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createMeasurement**
```swift
    open class func createMeasurement(measCreate: MeasCreate? = nil, completion: @escaping (_ data: Measurement?, _ error: Error?) -> Void)
```

Create Measurement

計測を作成します。  - **Note**   - 計測の保護／非保護を切り替える権限を持たないエッジも、     計測作成時は保護された計測を作成することが可能です。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measCreate = MeasCreate(name: "name_example", description: "description_example", basetime: Date(), basetimeType: MeasurementBaseTimeType(), edgeUuid: "edgeUuid_example", protected: false) // MeasCreate |  (optional)

// Create Measurement
MeasMeasurementsAPI.createMeasurement(measCreate: measCreate) { (response, error) in
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
 **measCreate** | [**MeasCreate**](MeasCreate.md) |  | [optional] 

### Return type

[**Measurement**](Measurement.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createMeasurementChunks**
```swift
    open class func createMeasurementChunks(body: URL? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Create Measurement Sequence Chunk

計測シーケンスにチャンクを作成します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let body = URL(string: "https://example.com")! // URL |  (optional)

// Create Measurement Sequence Chunk
MeasMeasurementsAPI.createMeasurementChunks(body: body) { (response, error) in
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
 **body** | **URL** |  | [optional] 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/vnd.iscp.v2.protobuf, application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createMeasurementWithUUID**
```swift
    open class func createMeasurementWithUUID(measurementUuid: String, measCreate: MeasCreate? = nil, completion: @escaping (_ data: Measurement?, _ error: Error?) -> Void)
```

Create Measurement with UUID

指定したUUIDの計測を作成します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let measCreate = MeasCreate(name: "name_example", description: "description_example", basetime: Date(), basetimeType: MeasurementBaseTimeType(), edgeUuid: "edgeUuid_example", protected: false) // MeasCreate |  (optional)

// Create Measurement with UUID
MeasMeasurementsAPI.createMeasurementWithUUID(measurementUuid: measurementUuid, measCreate: measCreate) { (response, error) in
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
 **measCreate** | [**MeasCreate**](MeasCreate.md) |  | [optional] 

### Return type

[**Measurement**](Measurement.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createProjectMeasurement**
```swift
    open class func createProjectMeasurement(projectUuid: String, measCreate: MeasCreate? = nil, completion: @escaping (_ data: Measurement?, _ error: Error?) -> Void)
```

Create Project Measurement

計測を作成します。  - **Note**   - 計測の保護／非保護を切り替える権限を持たないエッジも、     計測作成時は保護された計測を作成することが可能です。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measCreate = MeasCreate(name: "name_example", description: "description_example", basetime: Date(), basetimeType: MeasurementBaseTimeType(), edgeUuid: "edgeUuid_example", protected: false) // MeasCreate |  (optional)

// Create Project Measurement
MeasMeasurementsAPI.createProjectMeasurement(projectUuid: projectUuid, measCreate: measCreate) { (response, error) in
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
 **measCreate** | [**MeasCreate**](MeasCreate.md) |  | [optional] 

### Return type

[**Measurement**](Measurement.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createProjectMeasurementChunks**
```swift
    open class func createProjectMeasurementChunks(projectUuid: String, body: URL? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Create Project Measurement Sequence Chunk

計測シーケンスにチャンクを作成します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let body = URL(string: "https://example.com")! // URL |  (optional)

// Create Project Measurement Sequence Chunk
MeasMeasurementsAPI.createProjectMeasurementChunks(projectUuid: projectUuid, body: body) { (response, error) in
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
 **body** | **URL** |  | [optional] 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/vnd.iscp.v2.protobuf, application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createProjectMeasurementWithUUID**
```swift
    open class func createProjectMeasurementWithUUID(projectUuid: String, measurementUuid: String, measCreate: MeasCreate? = nil, completion: @escaping (_ data: Measurement?, _ error: Error?) -> Void)
```

Create Project Measurement with UUID

指定したUUIDの計測を作成します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let measCreate = MeasCreate(name: "name_example", description: "description_example", basetime: Date(), basetimeType: MeasurementBaseTimeType(), edgeUuid: "edgeUuid_example", protected: false) // MeasCreate |  (optional)

// Create Project Measurement with UUID
MeasMeasurementsAPI.createProjectMeasurementWithUUID(projectUuid: projectUuid, measurementUuid: measurementUuid, measCreate: measCreate) { (response, error) in
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
 **measCreate** | [**MeasCreate**](MeasCreate.md) |  | [optional] 

### Return type

[**Measurement**](Measurement.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteMeasurement**
```swift
    open class func deleteMeasurement(measurementUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Trash Measurement

計測を削除します。 - **Note**   - 保護された計測は削除できません。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// Trash Measurement
MeasMeasurementsAPI.deleteMeasurement(measurementUuid: measurementUuid) { (response, error) in
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

# **deleteMeasurementBaseTime**
```swift
    open class func deleteMeasurementBaseTime(measurementUuid: String, type: ModelType_deleteMeasurementBaseTime, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Measurement Base Time

基準時刻を削除します。 指定された基準時刻が使用中の場合（その計測の `basetime_type` として設定されている場合）は、 その基準時刻は削除できません（ステータスコード `409` が返却されます）。 このような場合は、他の基準時刻をその計測の `basetime_type` にしてから、削除したい基準時刻を削除してください。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let type = "type_example" // String | 基準時刻のタイプ

// Delete Measurement Base Time
MeasMeasurementsAPI.deleteMeasurementBaseTime(measurementUuid: measurementUuid, type: type) { (response, error) in
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
 **type** | **String** | 基準時刻のタイプ | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteProjectMeasurement**
```swift
    open class func deleteProjectMeasurement(projectUuid: String, measurementUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Trash Project Measurement

計測を削除します。 - **Note**   - 保護された計測は削除できません。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// Trash Project Measurement
MeasMeasurementsAPI.deleteProjectMeasurement(projectUuid: projectUuid, measurementUuid: measurementUuid) { (response, error) in
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

# **deleteProjectMeasurementBaseTime**
```swift
    open class func deleteProjectMeasurementBaseTime(projectUuid: String, measurementUuid: String, type: ModelType_deleteProjectMeasurementBaseTime, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Project Measurement Base Time

基準時刻を削除します。 指定された基準時刻が使用中の場合（その計測の `basetime_type` として設定されている場合）は、 その基準時刻は削除できません（ステータスコード `409` が返却されます）。 このような場合は、他の基準時刻をその計測の `basetime_type` にしてから、削除したい基準時刻を削除してください。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let type = "type_example" // String | 基準時刻のタイプ

// Delete Project Measurement Base Time
MeasMeasurementsAPI.deleteProjectMeasurementBaseTime(projectUuid: projectUuid, measurementUuid: measurementUuid, type: type) { (response, error) in
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
 **type** | **String** | 基準時刻のタイプ | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **endMeasurement**
```swift
    open class func endMeasurement(measurementUuid: String, completion: @escaping (_ data: SequenceSummary?, _ error: Error?) -> Void)
```

End Measurement

計測終了（ended）とします。endedは、エッジにおけるデータの取得が終了していることを表します。 （サーバーに回収されていないデータがまだエッジに残っている可能性はあります。サーバーへのデータの回収が完了した状態は、completedと呼びます。）

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// End Measurement
MeasMeasurementsAPI.endMeasurement(measurementUuid: measurementUuid) { (response, error) in
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

[**SequenceSummary**](SequenceSummary.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **endProjectMeasurement**
```swift
    open class func endProjectMeasurement(projectUuid: String, measurementUuid: String, completion: @escaping (_ data: SequenceSummary?, _ error: Error?) -> Void)
```

End Project Measurement

計測終了（ended）とします。endedは、エッジにおけるデータの取得が終了していることを表します。 （サーバーに回収されていないデータがまだエッジに残っている可能性はあります。サーバーへのデータの回収が完了した状態は、completedと呼びます。）

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// End Project Measurement
MeasMeasurementsAPI.endProjectMeasurement(projectUuid: projectUuid, measurementUuid: measurementUuid) { (response, error) in
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

[**SequenceSummary**](SequenceSummary.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMeasurement**
```swift
    open class func getMeasurement(measurementUuid: String, completion: @escaping (_ data: Measurement?, _ error: Error?) -> Void)
```

Get Measurement

計測を取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// Get Measurement
MeasMeasurementsAPI.getMeasurement(measurementUuid: measurementUuid) { (response, error) in
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

[**Measurement**](Measurement.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMeasurementBaseTime**
```swift
    open class func getMeasurementBaseTime(measurementUuid: String, type: ModelType_getMeasurementBaseTime, completion: @escaping (_ data: MeasBaseTime?, _ error: Error?) -> Void)
```

Get Measurement Base Time

基準時刻タイプを指定して計測の基準時刻を取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let type = "type_example" // String | 基準時刻のタイプ

// Get Measurement Base Time
MeasMeasurementsAPI.getMeasurementBaseTime(measurementUuid: measurementUuid, type: type) { (response, error) in
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
 **type** | **String** | 基準時刻のタイプ | 

### Return type

[**MeasBaseTime**](MeasBaseTime.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMeasurementFromMeasurementMarker**
```swift
    open class func getMeasurementFromMeasurementMarker(measurementMarkerUuid: String, completion: @escaping (_ data: Measurement?, _ error: Error?) -> Void)
```

Get Measurement from Marker

Get a measurement from a specified marker uuid

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementMarkerUuid = "measurementMarkerUuid_example" // String | 計測マーカーのUUID

// Get Measurement from Marker
MeasMeasurementsAPI.getMeasurementFromMeasurementMarker(measurementMarkerUuid: measurementMarkerUuid) { (response, error) in
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

[**Measurement**](Measurement.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMeasurementSections**
```swift
    open class func getMeasurementSections(measurementUuid: String, filter: Filter_getMeasurementSections? = nil, limit: Int? = nil, completion: @escaping (_ data: MeasurementSectionsGetResponse?, _ error: Error?) -> Void)
```

List Measurement Sections

計測に含まれるセクションのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let filter = "filter_example" // String | 計測セクションの処理ステータス。 `processed` （処理済みの計測セクションを取得）、 `unprocessed` （未処理の計測セクションを取得）、 `both` （両方を取得）のいずれかを選択します。 (optional) (default to .both)
let limit = 987 // Int | 1回のリクエストで取得する件数 (optional)

// List Measurement Sections
MeasMeasurementsAPI.getMeasurementSections(measurementUuid: measurementUuid, filter: filter, limit: limit) { (response, error) in
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
 **filter** | **String** | 計測セクションの処理ステータス。 &#x60;processed&#x60; （処理済みの計測セクションを取得）、 &#x60;unprocessed&#x60; （未処理の計測セクションを取得）、 &#x60;both&#x60; （両方を取得）のいずれかを選択します。 | [optional] [default to .both]
 **limit** | **Int** | 1回のリクエストで取得する件数 | [optional] 

### Return type

[**MeasurementSectionsGetResponse**](MeasurementSectionsGetResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMeasurementSequence**
```swift
    open class func getMeasurementSequence(measurementUuid: String, sequencesUuid: String, completion: @escaping (_ data: MeasurementSequenceGroup?, _ error: Error?) -> Void)
```

Get Measurement Sequence

計測シーケンスを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let sequencesUuid = "sequencesUuid_example" // String | 計測シーケンスのUUID

// Get Measurement Sequence
MeasMeasurementsAPI.getMeasurementSequence(measurementUuid: measurementUuid, sequencesUuid: sequencesUuid) { (response, error) in
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
 **sequencesUuid** | **String** | 計測シーケンスのUUID | 

### Return type

[**MeasurementSequenceGroup**](MeasurementSequenceGroup.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectMeasurement**
```swift
    open class func getProjectMeasurement(projectUuid: String, measurementUuid: String, completion: @escaping (_ data: Measurement?, _ error: Error?) -> Void)
```

Get Project Measurement

計測を取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// Get Project Measurement
MeasMeasurementsAPI.getProjectMeasurement(projectUuid: projectUuid, measurementUuid: measurementUuid) { (response, error) in
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

[**Measurement**](Measurement.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectMeasurementBaseTime**
```swift
    open class func getProjectMeasurementBaseTime(projectUuid: String, measurementUuid: String, type: ModelType_getProjectMeasurementBaseTime, completion: @escaping (_ data: MeasBaseTime?, _ error: Error?) -> Void)
```

Get Project Measurement Base Time

基準時刻タイプを指定して計測の基準時刻を取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let type = "type_example" // String | 基準時刻のタイプ

// Get Project Measurement Base Time
MeasMeasurementsAPI.getProjectMeasurementBaseTime(projectUuid: projectUuid, measurementUuid: measurementUuid, type: type) { (response, error) in
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
 **type** | **String** | 基準時刻のタイプ | 

### Return type

[**MeasBaseTime**](MeasBaseTime.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectMeasurementSections**
```swift
    open class func getProjectMeasurementSections(projectUuid: String, measurementUuid: String, filter: Filter_getProjectMeasurementSections? = nil, limit: Int? = nil, completion: @escaping (_ data: MeasurementSectionsGetResponse?, _ error: Error?) -> Void)
```

List Project Measurement Sections

計測に含まれるセクションのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let filter = "filter_example" // String | 計測セクションの処理ステータス。 `processed` （処理済みの計測セクションを取得）、 `unprocessed` （未処理の計測セクションを取得）、 `both` （両方を取得）のいずれかを選択します。 (optional) (default to .both)
let limit = 987 // Int | 1回のリクエストで取得する件数 (optional)

// List Project Measurement Sections
MeasMeasurementsAPI.getProjectMeasurementSections(projectUuid: projectUuid, measurementUuid: measurementUuid, filter: filter, limit: limit) { (response, error) in
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
 **filter** | **String** | 計測セクションの処理ステータス。 &#x60;processed&#x60; （処理済みの計測セクションを取得）、 &#x60;unprocessed&#x60; （未処理の計測セクションを取得）、 &#x60;both&#x60; （両方を取得）のいずれかを選択します。 | [optional] [default to .both]
 **limit** | **Int** | 1回のリクエストで取得する件数 | [optional] 

### Return type

[**MeasurementSectionsGetResponse**](MeasurementSectionsGetResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectMeasurementSequence**
```swift
    open class func getProjectMeasurementSequence(projectUuid: String, measurementUuid: String, sequencesUuid: String, completion: @escaping (_ data: MeasurementSequenceGroup?, _ error: Error?) -> Void)
```

Get Project Measurement Sequence

計測シーケンスを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let sequencesUuid = "sequencesUuid_example" // String | 計測シーケンスのUUID

// Get Project Measurement Sequence
MeasMeasurementsAPI.getProjectMeasurementSequence(projectUuid: projectUuid, measurementUuid: measurementUuid, sequencesUuid: sequencesUuid) { (response, error) in
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
 **sequencesUuid** | **String** | 計測シーケンスのUUID | 

### Return type

[**MeasurementSequenceGroup**](MeasurementSequenceGroup.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMeasurementBaseTimes**
```swift
    open class func listMeasurementBaseTimes(measurementUuid: String, completion: @escaping (_ data: MeasBaseTimes?, _ error: Error?) -> Void)
```

List Measurement Base Times

計測の基準時刻のリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// List Measurement Base Times
MeasMeasurementsAPI.listMeasurementBaseTimes(measurementUuid: measurementUuid) { (response, error) in
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

[**MeasBaseTimes**](MeasBaseTimes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMeasurementSequences**
```swift
    open class func listMeasurementSequences(measurementUuid: String, completion: @escaping (_ data: MeasurementSequenceGroups?, _ error: Error?) -> Void)
```

List Measurement Sequences

計測シーケンスのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// List Measurement Sequences
MeasMeasurementsAPI.listMeasurementSequences(measurementUuid: measurementUuid) { (response, error) in
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

[**MeasurementSequenceGroups**](MeasurementSequenceGroups.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMeasurements**
```swift
    open class func listMeasurements(uuid: [String]? = nil, name: Int? = nil, edgeUuid: String? = nil, start: String? = nil, end: String? = nil, partialMatch: Bool? = nil, basetimeType: BasetimeType_listMeasurements? = nil, ended: Bool? = nil, since: String? = nil, durationStart: Int64? = nil, durationEnd: Int64? = nil, status: [String]? = nil, limit: Int? = nil, sort: Sort_listMeasurements? = nil, page: Int? = nil, order: Order_listMeasurements? = nil, completion: @escaping (_ data: Measurements?, _ error: Error?) -> Void)
```

List Measurements

計測のリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let uuid = ["inner_example"] // [String] | 計測のUUID (optional)
let name = 987 // Int | 名前が指定した文字列から始まる計測を取得します。 文字列をダブルクォーテーションで囲むと、完全一致のものだけが取得されます。 (optional)
let edgeUuid = "edgeUuid_example" // String | 計測に関連付けられたエッジのUUID (optional)
let start = "start_example" // String | 取得対象範囲の始点。以下のいずれかの形式で指定します。   - RFC3339(例 `2019-10-29T03:04:05.341268Z` )   - UNIX時刻（マイクロ秒）(**Deprecated**) (optional)
let end = "end_example" // String | 取得対象範囲の終点。以下のいずれかの形式で指定します。   - RFC3339(例 `2019-10-29T03:04:05.341268Z` )   - UNIX時刻（マイクロ秒）(**Deprecated**) (optional)
let partialMatch = true // Bool | `true` にすると、計測の一部が取得対象範囲に入っていればその計測は取得対象となります。 `false` にすると、計測の基準時刻（計測開始）が取得対象範囲に入っていればその計測は取得対象となります。 ```    | measurement1 |    +--------------+                                    | measurement2 |                                    +--------------+                        | measurement3 |                        +--------------+                                                         time -----------+----------------------------+------------>            |                            |           start                        end ```  - この例では、もし `partial_match` を `true` にすると、 `measurement1` 、 `measurement2` 、 `measurement3` が取得できます。 - もし `partial_match` を `false` にすると、 `measurement2` と `measurement3` が取得できます。 (optional) (default to false)
let basetimeType = "basetimeType_example" // String | 計測の基準時刻のタイプ (optional)
let ended = false // Bool | 計測が終了している（ended）かどうかを指定して計測を取得します。  エッジにおいてデータの取得が終了している場合、その計測は「終了(ended)」となります。 計測は終了(ended)していても、まだサーバーに送信されていないデータがエッジに残っている可能性があります。 * `true`: 終了した計測だけを取得します。 * `false`: 終了していない計測だけを取得します。 (optional)
let since = "since_example" // String | 指定した時刻以降に更新された計測のみを取得します。  以下のいずれかの形式で指定します。    - RFC3339(例 `2019-10-29T03:04:05.341268Z` )   - UNIX時刻（マイクロ秒）(**Deprecated**) (optional)
let durationStart = 987 // Int64 | 計測時間の最小値（マイクロ秒）。これより短い計測は取得しません。 (optional)
let durationEnd = 987 // Int64 | 計測時間の最大値（マイクロ秒）。これより長い計測は取得しません。 (optional)
let status = ["status_example"] // [String] | 計測のステータス (optional)
let limit = 987 // Int | 1回のリクエストで取得する件数。ただし、0を指定するとデフォルトの値が使用されます。 (optional) (default to 1000)
let sort = "sort_example" // String | 並べ替えに使用するキー (optional) (default to .baseTime)
let page = 987 // Int | 取得するページの番号 (optional)
let order = "order_example" // String | 並べ替えの順序 (optional)

// List Measurements
MeasMeasurementsAPI.listMeasurements(uuid: uuid, name: name, edgeUuid: edgeUuid, start: start, end: end, partialMatch: partialMatch, basetimeType: basetimeType, ended: ended, since: since, durationStart: durationStart, durationEnd: durationEnd, status: status, limit: limit, sort: sort, page: page, order: order) { (response, error) in
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
 **uuid** | [**[String]**](String.md) | 計測のUUID | [optional] 
 **name** | **Int** | 名前が指定した文字列から始まる計測を取得します。 文字列をダブルクォーテーションで囲むと、完全一致のものだけが取得されます。 | [optional] 
 **edgeUuid** | **String** | 計測に関連付けられたエッジのUUID | [optional] 
 **start** | **String** | 取得対象範囲の始点。以下のいずれかの形式で指定します。   - RFC3339(例 &#x60;2019-10-29T03:04:05.341268Z&#x60; )   - UNIX時刻（マイクロ秒）(**Deprecated**) | [optional] 
 **end** | **String** | 取得対象範囲の終点。以下のいずれかの形式で指定します。   - RFC3339(例 &#x60;2019-10-29T03:04:05.341268Z&#x60; )   - UNIX時刻（マイクロ秒）(**Deprecated**) | [optional] 
 **partialMatch** | **Bool** | &#x60;true&#x60; にすると、計測の一部が取得対象範囲に入っていればその計測は取得対象となります。 &#x60;false&#x60; にすると、計測の基準時刻（計測開始）が取得対象範囲に入っていればその計測は取得対象となります。 &#x60;&#x60;&#x60;    | measurement1 |    +--------------+                                    | measurement2 |                                    +--------------+                        | measurement3 |                        +--------------+                                                         time -----------+----------------------------+------------&gt;            |                            |           start                        end &#x60;&#x60;&#x60;  - この例では、もし &#x60;partial_match&#x60; を &#x60;true&#x60; にすると、 &#x60;measurement1&#x60; 、 &#x60;measurement2&#x60; 、 &#x60;measurement3&#x60; が取得できます。 - もし &#x60;partial_match&#x60; を &#x60;false&#x60; にすると、 &#x60;measurement2&#x60; と &#x60;measurement3&#x60; が取得できます。 | [optional] [default to false]
 **basetimeType** | **String** | 計測の基準時刻のタイプ | [optional] 
 **ended** | **Bool** | 計測が終了している（ended）かどうかを指定して計測を取得します。  エッジにおいてデータの取得が終了している場合、その計測は「終了(ended)」となります。 計測は終了(ended)していても、まだサーバーに送信されていないデータがエッジに残っている可能性があります。 * &#x60;true&#x60;: 終了した計測だけを取得します。 * &#x60;false&#x60;: 終了していない計測だけを取得します。 | [optional] 
 **since** | **String** | 指定した時刻以降に更新された計測のみを取得します。  以下のいずれかの形式で指定します。    - RFC3339(例 &#x60;2019-10-29T03:04:05.341268Z&#x60; )   - UNIX時刻（マイクロ秒）(**Deprecated**) | [optional] 
 **durationStart** | **Int64** | 計測時間の最小値（マイクロ秒）。これより短い計測は取得しません。 | [optional] 
 **durationEnd** | **Int64** | 計測時間の最大値（マイクロ秒）。これより長い計測は取得しません。 | [optional] 
 **status** | [**[String]**](String.md) | 計測のステータス | [optional] 
 **limit** | **Int** | 1回のリクエストで取得する件数。ただし、0を指定するとデフォルトの値が使用されます。 | [optional] [default to 1000]
 **sort** | **String** | 並べ替えに使用するキー | [optional] [default to .baseTime]
 **page** | **Int** | 取得するページの番号 | [optional] 
 **order** | **String** | 並べ替えの順序 | [optional] 

### Return type

[**Measurements**](Measurements.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listProjectMeasurementBaseTimes**
```swift
    open class func listProjectMeasurementBaseTimes(projectUuid: String, measurementUuid: String, completion: @escaping (_ data: MeasBaseTimes?, _ error: Error?) -> Void)
```

List Project Measurement Base Times

計測の基準時刻のリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// List Project Measurement Base Times
MeasMeasurementsAPI.listProjectMeasurementBaseTimes(projectUuid: projectUuid, measurementUuid: measurementUuid) { (response, error) in
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

[**MeasBaseTimes**](MeasBaseTimes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listProjectMeasurementSequences**
```swift
    open class func listProjectMeasurementSequences(projectUuid: String, measurementUuid: String, completion: @escaping (_ data: MeasurementSequenceGroups?, _ error: Error?) -> Void)
```

List Project Measurement Sequences

計測シーケンスのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// List Project Measurement Sequences
MeasMeasurementsAPI.listProjectMeasurementSequences(projectUuid: projectUuid, measurementUuid: measurementUuid) { (response, error) in
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

[**MeasurementSequenceGroups**](MeasurementSequenceGroups.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listProjectMeasurements**
```swift
    open class func listProjectMeasurements(projectUuid: String, uuid: [String]? = nil, name: Int? = nil, edgeUuid: String? = nil, start: String? = nil, end: String? = nil, partialMatch: Bool? = nil, basetimeType: BasetimeType_listProjectMeasurements? = nil, ended: Bool? = nil, since: String? = nil, durationStart: Int64? = nil, durationEnd: Int64? = nil, status: [String]? = nil, limit: Int? = nil, sort: Sort_listProjectMeasurements? = nil, page: Int? = nil, order: Order_listProjectMeasurements? = nil, completion: @escaping (_ data: Measurements?, _ error: Error?) -> Void)
```

List Project Measurements

計測のリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let uuid = ["inner_example"] // [String] | 計測のUUID (optional)
let name = 987 // Int | 名前が指定した文字列から始まる計測を取得します。 文字列をダブルクォーテーションで囲むと、完全一致のものだけが取得されます。 (optional)
let edgeUuid = "edgeUuid_example" // String | 計測に関連付けられたエッジのUUID (optional)
let start = "start_example" // String | 取得対象範囲の始点。以下のいずれかの形式で指定します。   - RFC3339(例 `2019-10-29T03:04:05.341268Z` )   - UNIX時刻（マイクロ秒）(**Deprecated**) (optional)
let end = "end_example" // String | 取得対象範囲の終点。以下のいずれかの形式で指定します。   - RFC3339(例 `2019-10-29T03:04:05.341268Z` )   - UNIX時刻（マイクロ秒）(**Deprecated**) (optional)
let partialMatch = true // Bool | `true` にすると、計測の一部が取得対象範囲に入っていればその計測は取得対象となります。 `false` にすると、計測の基準時刻（計測開始）が取得対象範囲に入っていればその計測は取得対象となります。 ```    | measurement1 |    +--------------+                                    | measurement2 |                                    +--------------+                        | measurement3 |                        +--------------+                                                         time -----------+----------------------------+------------>            |                            |           start                        end ```  - この例では、もし `partial_match` を `true` にすると、 `measurement1` 、 `measurement2` 、 `measurement3` が取得できます。 - もし `partial_match` を `false` にすると、 `measurement2` と `measurement3` が取得できます。 (optional) (default to false)
let basetimeType = "basetimeType_example" // String | 計測の基準時刻のタイプ (optional)
let ended = false // Bool | 計測が終了している（ended）かどうかを指定して計測を取得します。  エッジにおいてデータの取得が終了している場合、その計測は「終了(ended)」となります。 計測は終了(ended)していても、まだサーバーに送信されていないデータがエッジに残っている可能性があります。 * `true`: 終了した計測だけを取得します。 * `false`: 終了していない計測だけを取得します。 (optional)
let since = "since_example" // String | 指定した時刻以降に更新された計測のみを取得します。  以下のいずれかの形式で指定します。    - RFC3339(例 `2019-10-29T03:04:05.341268Z` )   - UNIX時刻（マイクロ秒）(**Deprecated**) (optional)
let durationStart = 987 // Int64 | 計測時間の最小値（マイクロ秒）。これより短い計測は取得しません。 (optional)
let durationEnd = 987 // Int64 | 計測時間の最大値（マイクロ秒）。これより長い計測は取得しません。 (optional)
let status = ["status_example"] // [String] | 計測のステータス (optional)
let limit = 987 // Int | 1回のリクエストで取得する件数。ただし、0を指定するとデフォルトの値が使用されます。 (optional) (default to 1000)
let sort = "sort_example" // String | 並べ替えに使用するキー (optional) (default to .baseTime)
let page = 987 // Int | 取得するページの番号 (optional)
let order = "order_example" // String | 並べ替えの順序 (optional)

// List Project Measurements
MeasMeasurementsAPI.listProjectMeasurements(projectUuid: projectUuid, uuid: uuid, name: name, edgeUuid: edgeUuid, start: start, end: end, partialMatch: partialMatch, basetimeType: basetimeType, ended: ended, since: since, durationStart: durationStart, durationEnd: durationEnd, status: status, limit: limit, sort: sort, page: page, order: order) { (response, error) in
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
 **uuid** | [**[String]**](String.md) | 計測のUUID | [optional] 
 **name** | **Int** | 名前が指定した文字列から始まる計測を取得します。 文字列をダブルクォーテーションで囲むと、完全一致のものだけが取得されます。 | [optional] 
 **edgeUuid** | **String** | 計測に関連付けられたエッジのUUID | [optional] 
 **start** | **String** | 取得対象範囲の始点。以下のいずれかの形式で指定します。   - RFC3339(例 &#x60;2019-10-29T03:04:05.341268Z&#x60; )   - UNIX時刻（マイクロ秒）(**Deprecated**) | [optional] 
 **end** | **String** | 取得対象範囲の終点。以下のいずれかの形式で指定します。   - RFC3339(例 &#x60;2019-10-29T03:04:05.341268Z&#x60; )   - UNIX時刻（マイクロ秒）(**Deprecated**) | [optional] 
 **partialMatch** | **Bool** | &#x60;true&#x60; にすると、計測の一部が取得対象範囲に入っていればその計測は取得対象となります。 &#x60;false&#x60; にすると、計測の基準時刻（計測開始）が取得対象範囲に入っていればその計測は取得対象となります。 &#x60;&#x60;&#x60;    | measurement1 |    +--------------+                                    | measurement2 |                                    +--------------+                        | measurement3 |                        +--------------+                                                         time -----------+----------------------------+------------&gt;            |                            |           start                        end &#x60;&#x60;&#x60;  - この例では、もし &#x60;partial_match&#x60; を &#x60;true&#x60; にすると、 &#x60;measurement1&#x60; 、 &#x60;measurement2&#x60; 、 &#x60;measurement3&#x60; が取得できます。 - もし &#x60;partial_match&#x60; を &#x60;false&#x60; にすると、 &#x60;measurement2&#x60; と &#x60;measurement3&#x60; が取得できます。 | [optional] [default to false]
 **basetimeType** | **String** | 計測の基準時刻のタイプ | [optional] 
 **ended** | **Bool** | 計測が終了している（ended）かどうかを指定して計測を取得します。  エッジにおいてデータの取得が終了している場合、その計測は「終了(ended)」となります。 計測は終了(ended)していても、まだサーバーに送信されていないデータがエッジに残っている可能性があります。 * &#x60;true&#x60;: 終了した計測だけを取得します。 * &#x60;false&#x60;: 終了していない計測だけを取得します。 | [optional] 
 **since** | **String** | 指定した時刻以降に更新された計測のみを取得します。  以下のいずれかの形式で指定します。    - RFC3339(例 &#x60;2019-10-29T03:04:05.341268Z&#x60; )   - UNIX時刻（マイクロ秒）(**Deprecated**) | [optional] 
 **durationStart** | **Int64** | 計測時間の最小値（マイクロ秒）。これより短い計測は取得しません。 | [optional] 
 **durationEnd** | **Int64** | 計測時間の最大値（マイクロ秒）。これより長い計測は取得しません。 | [optional] 
 **status** | [**[String]**](String.md) | 計測のステータス | [optional] 
 **limit** | **Int** | 1回のリクエストで取得する件数。ただし、0を指定するとデフォルトの値が使用されます。 | [optional] [default to 1000]
 **sort** | **String** | 並べ替えに使用するキー | [optional] [default to .baseTime]
 **page** | **Int** | 取得するページの番号 | [optional] 
 **order** | **String** | 並べ替えの順序 | [optional] 

### Return type

[**Measurements**](Measurements.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **protectMeasurement**
```swift
    open class func protectMeasurement(measurementUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Protect Measurement

計測を保護します。保護された計測は削除できません。 [See](#section/Protected-resources) も参照してください。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// Protect Measurement
MeasMeasurementsAPI.protectMeasurement(measurementUuid: measurementUuid) { (response, error) in
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

# **protectProjectMeasurement**
```swift
    open class func protectProjectMeasurement(projectUuid: String, measurementUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Protect Project Measurement

計測を保護します。保護された計測は削除できません。 [See](#section/Protected-resources) も参照してください。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// Protect Project Measurement
MeasMeasurementsAPI.protectProjectMeasurement(projectUuid: projectUuid, measurementUuid: measurementUuid) { (response, error) in
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

# **replaceMeasurementSequence**
```swift
    open class func replaceMeasurementSequence(measurementUuid: String, sequencesUuid: String, measurementSequenceGroupReplace: MeasurementSequenceGroupReplace? = nil, completion: @escaping (_ data: MeasurementSequenceGroup?, _ error: Error?) -> Void)
```

Replace Measurement Sequence

計測シーケンスを置換します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let sequencesUuid = "sequencesUuid_example" // String | 計測シーケンスのUUID
let measurementSequenceGroupReplace = MeasurementSequenceGroupReplace(expectedDataPoints: 123, finalSequenceNumber: 123) // MeasurementSequenceGroupReplace |  (optional)

// Replace Measurement Sequence
MeasMeasurementsAPI.replaceMeasurementSequence(measurementUuid: measurementUuid, sequencesUuid: sequencesUuid, measurementSequenceGroupReplace: measurementSequenceGroupReplace) { (response, error) in
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
 **sequencesUuid** | **String** | 計測シーケンスのUUID | 
 **measurementSequenceGroupReplace** | [**MeasurementSequenceGroupReplace**](MeasurementSequenceGroupReplace.md) |  | [optional] 

### Return type

[**MeasurementSequenceGroup**](MeasurementSequenceGroup.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **replaceProjectMeasurementSequence**
```swift
    open class func replaceProjectMeasurementSequence(projectUuid: String, measurementUuid: String, sequencesUuid: String, measurementSequenceGroupReplace: MeasurementSequenceGroupReplace? = nil, completion: @escaping (_ data: MeasurementSequenceGroup?, _ error: Error?) -> Void)
```

Replace Project Measurement Sequence

計測シーケンスを置換します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let sequencesUuid = "sequencesUuid_example" // String | 計測シーケンスのUUID
let measurementSequenceGroupReplace = MeasurementSequenceGroupReplace(expectedDataPoints: 123, finalSequenceNumber: 123) // MeasurementSequenceGroupReplace |  (optional)

// Replace Project Measurement Sequence
MeasMeasurementsAPI.replaceProjectMeasurementSequence(projectUuid: projectUuid, measurementUuid: measurementUuid, sequencesUuid: sequencesUuid, measurementSequenceGroupReplace: measurementSequenceGroupReplace) { (response, error) in
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
 **sequencesUuid** | **String** | 計測シーケンスのUUID | 
 **measurementSequenceGroupReplace** | [**MeasurementSequenceGroupReplace**](MeasurementSequenceGroupReplace.md) |  | [optional] 

### Return type

[**MeasurementSequenceGroup**](MeasurementSequenceGroup.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **unprotectMeasurement**
```swift
    open class func unprotectMeasurement(measurementUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Unprotect Measurement

計測の保護を解除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// Unprotect Measurement
MeasMeasurementsAPI.unprotectMeasurement(measurementUuid: measurementUuid) { (response, error) in
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

# **unprotectProjectMeasurement**
```swift
    open class func unprotectProjectMeasurement(projectUuid: String, measurementUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Unprotect Project Measurement

計測の保護を解除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID

// Unprotect Project Measurement
MeasMeasurementsAPI.unprotectProjectMeasurement(projectUuid: projectUuid, measurementUuid: measurementUuid) { (response, error) in
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

# **updateMeasurement**
```swift
    open class func updateMeasurement(measurementUuid: String, measReplace: MeasReplace? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Update Measurement

計測に関する情報を更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let measReplace = MeasReplace(name: "name_example", description: "description_example", basetime: Date(), basetimeType: MeasurementBaseTimeType()) // MeasReplace |  (optional)

// Update Measurement
MeasMeasurementsAPI.updateMeasurement(measurementUuid: measurementUuid, measReplace: measReplace) { (response, error) in
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
 **measReplace** | [**MeasReplace**](MeasReplace.md) |  | [optional] 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMeasurementBaseTime**
```swift
    open class func updateMeasurementBaseTime(measurementUuid: String, type: ModelType_updateMeasurementBaseTime, measBaseTimePut: MeasBaseTimePut? = nil, completion: @escaping (_ data: MeasBaseTime?, _ error: Error?) -> Void)
```

Replace Measurement Base Time

基準時刻を更新します。 この計測において、使用する基準時刻が設定されていない（ `basetime_type` が `undefined` ）の場合は、 新しい基準時刻を `basetime_type` に設定します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let type = "type_example" // String | 基準時刻のタイプ
let measBaseTimePut = MeasBaseTimePut(basetime: "basetime_example") // MeasBaseTimePut |  (optional)

// Replace Measurement Base Time
MeasMeasurementsAPI.updateMeasurementBaseTime(measurementUuid: measurementUuid, type: type, measBaseTimePut: measBaseTimePut) { (response, error) in
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
 **type** | **String** | 基準時刻のタイプ | 
 **measBaseTimePut** | [**MeasBaseTimePut**](MeasBaseTimePut.md) |  | [optional] 

### Return type

[**MeasBaseTime**](MeasBaseTime.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMeasurementSequence**
```swift
    open class func updateMeasurementSequence(measurementUuid: String, sequencesUuid: String, measurementSequenceGroupReplace: MeasurementSequenceGroupReplace? = nil, completion: @escaping (_ data: MeasurementSequenceGroup?, _ error: Error?) -> Void)
```

Update Measurement Sequence

計測シーケンスを更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let sequencesUuid = "sequencesUuid_example" // String | 計測シーケンスのUUID
let measurementSequenceGroupReplace = MeasurementSequenceGroupReplace(expectedDataPoints: 123, finalSequenceNumber: 123) // MeasurementSequenceGroupReplace |  (optional)

// Update Measurement Sequence
MeasMeasurementsAPI.updateMeasurementSequence(measurementUuid: measurementUuid, sequencesUuid: sequencesUuid, measurementSequenceGroupReplace: measurementSequenceGroupReplace) { (response, error) in
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
 **sequencesUuid** | **String** | 計測シーケンスのUUID | 
 **measurementSequenceGroupReplace** | [**MeasurementSequenceGroupReplace**](MeasurementSequenceGroupReplace.md) |  | [optional] 

### Return type

[**MeasurementSequenceGroup**](MeasurementSequenceGroup.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateProjectMeasurement**
```swift
    open class func updateProjectMeasurement(projectUuid: String, measurementUuid: String, measReplace: MeasReplace? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Update Project Measurement

計測に関する情報を更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let measReplace = MeasReplace(name: "name_example", description: "description_example", basetime: Date(), basetimeType: MeasurementBaseTimeType()) // MeasReplace |  (optional)

// Update Project Measurement
MeasMeasurementsAPI.updateProjectMeasurement(projectUuid: projectUuid, measurementUuid: measurementUuid, measReplace: measReplace) { (response, error) in
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
 **measReplace** | [**MeasReplace**](MeasReplace.md) |  | [optional] 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateProjectMeasurementBaseTime**
```swift
    open class func updateProjectMeasurementBaseTime(projectUuid: String, measurementUuid: String, type: ModelType_updateProjectMeasurementBaseTime, measBaseTimePut: MeasBaseTimePut? = nil, completion: @escaping (_ data: MeasBaseTime?, _ error: Error?) -> Void)
```

Replace Project Measurement Base Time

基準時刻を更新します。 この計測において、使用する基準時刻が設定されていない（ `basetime_type` が `undefined` ）の場合は、 新しい基準時刻を `basetime_type` に設定します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let type = "type_example" // String | 基準時刻のタイプ
let measBaseTimePut = MeasBaseTimePut(basetime: "basetime_example") // MeasBaseTimePut |  (optional)

// Replace Project Measurement Base Time
MeasMeasurementsAPI.updateProjectMeasurementBaseTime(projectUuid: projectUuid, measurementUuid: measurementUuid, type: type, measBaseTimePut: measBaseTimePut) { (response, error) in
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
 **type** | **String** | 基準時刻のタイプ | 
 **measBaseTimePut** | [**MeasBaseTimePut**](MeasBaseTimePut.md) |  | [optional] 

### Return type

[**MeasBaseTime**](MeasBaseTime.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateProjectMeasurementSequence**
```swift
    open class func updateProjectMeasurementSequence(projectUuid: String, measurementUuid: String, sequencesUuid: String, measurementSequenceGroupReplace: MeasurementSequenceGroupReplace? = nil, completion: @escaping (_ data: MeasurementSequenceGroup?, _ error: Error?) -> Void)
```

Update Project Measurement Sequence

計測シーケンスを更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measurementUuid = "measurementUuid_example" // String | 計測のUUID
let sequencesUuid = "sequencesUuid_example" // String | 計測シーケンスのUUID
let measurementSequenceGroupReplace = MeasurementSequenceGroupReplace(expectedDataPoints: 123, finalSequenceNumber: 123) // MeasurementSequenceGroupReplace |  (optional)

// Update Project Measurement Sequence
MeasMeasurementsAPI.updateProjectMeasurementSequence(projectUuid: projectUuid, measurementUuid: measurementUuid, sequencesUuid: sequencesUuid, measurementSequenceGroupReplace: measurementSequenceGroupReplace) { (response, error) in
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
 **sequencesUuid** | **String** | 計測シーケンスのUUID | 
 **measurementSequenceGroupReplace** | [**MeasurementSequenceGroupReplace**](MeasurementSequenceGroupReplace.md) |  | [optional] 

### Return type

[**MeasurementSequenceGroup**](MeasurementSequenceGroup.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

