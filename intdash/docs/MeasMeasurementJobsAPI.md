# MeasMeasurementJobsAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cancelMeasurementJob**](MeasMeasurementJobsAPI.md#cancelmeasurementjob) | **PUT** /v1/measurements/jobs/{job_uuid}/cancel | Cancel Measurement Job
[**cancelProjectMeasurementJob**](MeasMeasurementJobsAPI.md#cancelprojectmeasurementjob) | **PUT** /v1/projects/{project_uuid}/measurements/jobs/{job_uuid}/cancel | Cancel Project Measurement Job
[**deleteMeasurementJob**](MeasMeasurementJobsAPI.md#deletemeasurementjob) | **DELETE** /v1/measurements/jobs/{job_uuid} | Delete Measurement Job
[**deleteProjectMeasurementJob**](MeasMeasurementJobsAPI.md#deleteprojectmeasurementjob) | **DELETE** /v1/projects/{project_uuid}/measurements/jobs/{job_uuid} | Delete Project Measurement Job
[**getMeasurementJob**](MeasMeasurementJobsAPI.md#getmeasurementjob) | **GET** /v1/measurements/jobs/{job_uuid} | Get Measurement Job
[**getProjectMeasurementJob**](MeasMeasurementJobsAPI.md#getprojectmeasurementjob) | **GET** /v1/projects/{project_uuid}/measurements/jobs/{job_uuid} | Get Project Measurement Job
[**listMeasurementJobs**](MeasMeasurementJobsAPI.md#listmeasurementjobs) | **GET** /v1/measurements/jobs | List Measurement Jobs
[**listProjectMeasurementJobs**](MeasMeasurementJobsAPI.md#listprojectmeasurementjobs) | **GET** /v1/projects/{project_uuid}/measurements/jobs | List Project Measurement Jobs


# **cancelMeasurementJob**
```swift
    open class func cancelMeasurementJob(jobUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Cancel Measurement Job

ジョブをキャンセルします。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let jobUuid = "jobUuid_example" // String | ジョブのUUID

// Cancel Measurement Job
MeasMeasurementJobsAPI.cancelMeasurementJob(jobUuid: jobUuid) { (response, error) in
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
 **jobUuid** | **String** | ジョブのUUID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cancelProjectMeasurementJob**
```swift
    open class func cancelProjectMeasurementJob(projectUuid: String, jobUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Cancel Project Measurement Job

ジョブをキャンセルします。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let jobUuid = "jobUuid_example" // String | ジョブのUUID

// Cancel Project Measurement Job
MeasMeasurementJobsAPI.cancelProjectMeasurementJob(projectUuid: projectUuid, jobUuid: jobUuid) { (response, error) in
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
 **jobUuid** | **String** | ジョブのUUID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteMeasurementJob**
```swift
    open class func deleteMeasurementJob(jobUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Measurement Job

ジョブを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let jobUuid = "jobUuid_example" // String | ジョブのUUID

// Delete Measurement Job
MeasMeasurementJobsAPI.deleteMeasurementJob(jobUuid: jobUuid) { (response, error) in
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
 **jobUuid** | **String** | ジョブのUUID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteProjectMeasurementJob**
```swift
    open class func deleteProjectMeasurementJob(projectUuid: String, jobUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Project Measurement Job

ジョブを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let jobUuid = "jobUuid_example" // String | ジョブのUUID

// Delete Project Measurement Job
MeasMeasurementJobsAPI.deleteProjectMeasurementJob(projectUuid: projectUuid, jobUuid: jobUuid) { (response, error) in
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
 **jobUuid** | **String** | ジョブのUUID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMeasurementJob**
```swift
    open class func getMeasurementJob(jobUuid: String, completion: @escaping (_ data: MeasurementJob?, _ error: Error?) -> Void)
```

Get Measurement Job

ジョブを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let jobUuid = "jobUuid_example" // String | ジョブのUUID

// Get Measurement Job
MeasMeasurementJobsAPI.getMeasurementJob(jobUuid: jobUuid) { (response, error) in
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
 **jobUuid** | **String** | ジョブのUUID | 

### Return type

[**MeasurementJob**](MeasurementJob.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectMeasurementJob**
```swift
    open class func getProjectMeasurementJob(projectUuid: String, jobUuid: String, completion: @escaping (_ data: MeasurementJob?, _ error: Error?) -> Void)
```

Get Project Measurement Job

ジョブを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let jobUuid = "jobUuid_example" // String | ジョブのUUID

// Get Project Measurement Job
MeasMeasurementJobsAPI.getProjectMeasurementJob(projectUuid: projectUuid, jobUuid: jobUuid) { (response, error) in
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
 **jobUuid** | **String** | ジョブのUUID | 

### Return type

[**MeasurementJob**](MeasurementJob.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMeasurementJobs**
```swift
    open class func listMeasurementJobs(limit: Int? = nil, sort: Sort_listMeasurementJobs? = nil, status: Status_listMeasurementJobs? = nil, page: Int? = nil, order: Order_listMeasurementJobs? = nil, completion: @escaping (_ data: MeasurementJobs?, _ error: Error?) -> Void)
```

List Measurement Jobs

ジョブ（CSVファイルを計測に変換するジョブなど）のリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let limit = 987 // Int | 1回のリクエストで取得する件数 (optional)
let sort = "sort_example" // String | 並べ替えに使用するキー (optional) (default to .createdAt)
let status = "status_example" // String | ジョブのステータス (optional)
let page = 987 // Int | 取得するページの番号 (optional)
let order = "order_example" // String | 並べ替えの順序 (optional)

// List Measurement Jobs
MeasMeasurementJobsAPI.listMeasurementJobs(limit: limit, sort: sort, status: status, page: page, order: order) { (response, error) in
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
 **status** | **String** | ジョブのステータス | [optional] 
 **page** | **Int** | 取得するページの番号 | [optional] 
 **order** | **String** | 並べ替えの順序 | [optional] 

### Return type

[**MeasurementJobs**](MeasurementJobs.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listProjectMeasurementJobs**
```swift
    open class func listProjectMeasurementJobs(projectUuid: String, limit: Int? = nil, sort: Sort_listProjectMeasurementJobs? = nil, status: Status_listProjectMeasurementJobs? = nil, page: Int? = nil, order: Order_listProjectMeasurementJobs? = nil, completion: @escaping (_ data: MeasurementJobs?, _ error: Error?) -> Void)
```

List Project Measurement Jobs

ジョブ（CSVファイルを計測に変換するジョブなど）のリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let limit = 987 // Int | 1回のリクエストで取得する件数 (optional)
let sort = "sort_example" // String | 並べ替えに使用するキー (optional) (default to .createdAt)
let status = "status_example" // String | ジョブのステータス (optional)
let page = 987 // Int | 取得するページの番号 (optional)
let order = "order_example" // String | 並べ替えの順序 (optional)

// List Project Measurement Jobs
MeasMeasurementJobsAPI.listProjectMeasurementJobs(projectUuid: projectUuid, limit: limit, sort: sort, status: status, page: page, order: order) { (response, error) in
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
 **status** | **String** | ジョブのステータス | [optional] 
 **page** | **Int** | 取得するページの番号 | [optional] 
 **order** | **String** | 並べ替えの順序 | [optional] 

### Return type

[**MeasurementJobs**](MeasurementJobs.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

