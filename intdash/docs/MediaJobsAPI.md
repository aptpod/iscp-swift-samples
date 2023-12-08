# MediaJobsAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createJob**](MediaJobsAPI.md#createjob) | **POST** /media/jobs | Create Job
[**createProjectJob**](MediaJobsAPI.md#createprojectjob) | **POST** /media/projects/{project_uuid}/jobs | Create Project Job
[**getJobs**](MediaJobsAPI.md#getjobs) | **GET** /media/jobs | List Jobs
[**getProjectJobs**](MediaJobsAPI.md#getprojectjobs) | **GET** /media/projects/{project_uuid}/jobs | List Project Jobs


# **createJob**
```swift
    open class func createJob(createJobRequest: CreateJobRequest? = nil, completion: @escaping (_ data: Job?, _ error: Error?) -> Void)
```

Create Job

HLSへの変換ジョブを作成します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let createJobRequest = CreateJobRequest(measUuid: "measUuid_example", type: JobType()) // CreateJobRequest |  (optional)

// Create Job
MediaJobsAPI.createJob(createJobRequest: createJobRequest) { (response, error) in
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
 **createJobRequest** | [**CreateJobRequest**](CreateJobRequest.md) |  | [optional] 

### Return type

[**Job**](Job.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createProjectJob**
```swift
    open class func createProjectJob(projectUuid: String, createJobRequest: CreateJobRequest? = nil, completion: @escaping (_ data: Job?, _ error: Error?) -> Void)
```

Create Project Job

HLSへの変換ジョブを作成します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let createJobRequest = CreateJobRequest(measUuid: "measUuid_example", type: JobType()) // CreateJobRequest |  (optional)

// Create Project Job
MediaJobsAPI.createProjectJob(projectUuid: projectUuid, createJobRequest: createJobRequest) { (response, error) in
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
 **createJobRequest** | [**CreateJobRequest**](CreateJobRequest.md) |  | [optional] 

### Return type

[**Job**](Job.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getJobs**
```swift
    open class func getJobs(uuid: [String]? = nil, measUuid: [String]? = nil, type: [JobType]? = nil, status: [JobStatus]? = nil, limit: Double? = nil, page: Int? = nil, sort: Sort_getJobs? = nil, order: Order_getJobs? = nil, completion: @escaping (_ data: JobList?, _ error: Error?) -> Void)
```

List Jobs

HLSへの変換ジョブのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let uuid = ["inner_example"] // [String] | 取得したいジョブのUUID (optional)
let measUuid = ["inner_example"] // [String] | 計測のUUID (optional)
let type = [JobType()] // [JobType] | - update   - 計測内の動画データのうち、新しくサーバーが受信した部分（HLSにまだ変換されていない部分）を     HLSに変換するジョブ。通常は計測実行中に行います。 - finalize   - 計測全体をサーバーに回収した後に、動画データ全体をHLSに変換するジョブ - delete   - 変換によって作成されたHLSデータを削除するジョブ。     このジョブを実行すると、HLSプレイリスト、セグメントファイル、     データベース内のHLSに関する情報が削除され、この動画のHLSによる再生はできなくなります。 (optional)
let status = [JobStatus()] // [JobStatus] | ジョブのステータス (optional)
let limit = 987 // Double | 1回のリクエストで取得する件数 (optional)
let page = 987 // Int | 取得するページ番号 (optional) (default to 1)
let sort = "sort_example" // String | 並べ替えに使用するキー (optional) (default to .createdAt)
let order = "order_example" // String | 並べ替えの順序 (optional)

// List Jobs
MediaJobsAPI.getJobs(uuid: uuid, measUuid: measUuid, type: type, status: status, limit: limit, page: page, sort: sort, order: order) { (response, error) in
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
 **uuid** | [**[String]**](String.md) | 取得したいジョブのUUID | [optional] 
 **measUuid** | [**[String]**](String.md) | 計測のUUID | [optional] 
 **type** | [**[JobType]**](JobType.md) | - update   - 計測内の動画データのうち、新しくサーバーが受信した部分（HLSにまだ変換されていない部分）を     HLSに変換するジョブ。通常は計測実行中に行います。 - finalize   - 計測全体をサーバーに回収した後に、動画データ全体をHLSに変換するジョブ - delete   - 変換によって作成されたHLSデータを削除するジョブ。     このジョブを実行すると、HLSプレイリスト、セグメントファイル、     データベース内のHLSに関する情報が削除され、この動画のHLSによる再生はできなくなります。 | [optional] 
 **status** | [**[JobStatus]**](JobStatus.md) | ジョブのステータス | [optional] 
 **limit** | **Double** | 1回のリクエストで取得する件数 | [optional] 
 **page** | **Int** | 取得するページ番号 | [optional] [default to 1]
 **sort** | **String** | 並べ替えに使用するキー | [optional] [default to .createdAt]
 **order** | **String** | 並べ替えの順序 | [optional] 

### Return type

[**JobList**](JobList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectJobs**
```swift
    open class func getProjectJobs(projectUuid: String, uuid: [String]? = nil, measUuid: [String]? = nil, type: [JobType]? = nil, status: [JobStatus]? = nil, limit: Double? = nil, page: Int? = nil, sort: Sort_getProjectJobs? = nil, order: Order_getProjectJobs? = nil, completion: @escaping (_ data: JobList?, _ error: Error?) -> Void)
```

List Project Jobs

HLSへの変換ジョブのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let uuid = ["inner_example"] // [String] | 取得したいジョブのUUID (optional)
let measUuid = ["inner_example"] // [String] | 計測のUUID (optional)
let type = [JobType()] // [JobType] | - update   - 計測内の動画データのうち、新しくサーバーが受信した部分（HLSにまだ変換されていない部分）を     HLSに変換するジョブ。通常は計測実行中に行います。 - finalize   - 計測全体をサーバーに回収した後に、動画データ全体をHLSに変換するジョブ - delete   - 変換によって作成されたHLSデータを削除するジョブ。     このジョブを実行すると、HLSプレイリスト、セグメントファイル、     データベース内のHLSに関する情報が削除され、この動画のHLSによる再生はできなくなります。 (optional)
let status = [JobStatus()] // [JobStatus] | ジョブのステータス (optional)
let limit = 987 // Double | 1回のリクエストで取得する件数 (optional)
let page = 987 // Int | 取得するページ番号 (optional) (default to 1)
let sort = "sort_example" // String | 並べ替えに使用するキー (optional) (default to .createdAt)
let order = "order_example" // String | 並べ替えの順序 (optional)

// List Project Jobs
MediaJobsAPI.getProjectJobs(projectUuid: projectUuid, uuid: uuid, measUuid: measUuid, type: type, status: status, limit: limit, page: page, sort: sort, order: order) { (response, error) in
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
 **uuid** | [**[String]**](String.md) | 取得したいジョブのUUID | [optional] 
 **measUuid** | [**[String]**](String.md) | 計測のUUID | [optional] 
 **type** | [**[JobType]**](JobType.md) | - update   - 計測内の動画データのうち、新しくサーバーが受信した部分（HLSにまだ変換されていない部分）を     HLSに変換するジョブ。通常は計測実行中に行います。 - finalize   - 計測全体をサーバーに回収した後に、動画データ全体をHLSに変換するジョブ - delete   - 変換によって作成されたHLSデータを削除するジョブ。     このジョブを実行すると、HLSプレイリスト、セグメントファイル、     データベース内のHLSに関する情報が削除され、この動画のHLSによる再生はできなくなります。 | [optional] 
 **status** | [**[JobStatus]**](JobStatus.md) | ジョブのステータス | [optional] 
 **limit** | **Double** | 1回のリクエストで取得する件数 | [optional] 
 **page** | **Int** | 取得するページ番号 | [optional] [default to 1]
 **sort** | **String** | 並べ替えに使用するキー | [optional] [default to .createdAt]
 **order** | **String** | 並べ替えの順序 | [optional] 

### Return type

[**JobList**](JobList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

