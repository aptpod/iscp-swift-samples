# AuthProjectEdgesAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addProjectEdges**](AuthProjectEdgesAPI.md#addprojectedges) | **POST** /auth/projects/{project_uuid}/edges | Add Project Edge
[**getProjectEdge**](AuthProjectEdgesAPI.md#getprojectedge) | **GET** /auth/projects/{project_uuid}/edges/{edge_uuid} | Get Project Edge
[**listProjectEdges**](AuthProjectEdgesAPI.md#listprojectedges) | **GET** /auth/projects/{project_uuid}/edges | List Project Edges
[**removeProjectEdge**](AuthProjectEdgesAPI.md#removeprojectedge) | **DELETE** /auth/projects/{project_uuid}/edges/{edge_uuid} | Remove Project Edge
[**updateProjectEdge**](AuthProjectEdgesAPI.md#updateprojectedge) | **PATCH** /auth/projects/{project_uuid}/edges/{edge_uuid} | Update Project Edge


# **addProjectEdges**
```swift
    open class func addProjectEdges(projectUuid: String, addProjectEdgeRequest: AddProjectEdgeRequest? = nil, completion: @escaping (_ data: ProjectEdge?, _ error: Error?) -> Void)
```

Add Project Edge

エッジをプロジェクトに追加します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let addProjectEdgeRequest = AddProjectEdgeRequest(edgeName: "edgeName_example", nickname: "nickname_example") // AddProjectEdgeRequest |  (optional)

// Add Project Edge
AuthProjectEdgesAPI.addProjectEdges(projectUuid: projectUuid, addProjectEdgeRequest: addProjectEdgeRequest) { (response, error) in
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
 **addProjectEdgeRequest** | [**AddProjectEdgeRequest**](AddProjectEdgeRequest.md) |  | [optional] 

### Return type

[**ProjectEdge**](ProjectEdge.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectEdge**
```swift
    open class func getProjectEdge(projectUuid: String, edgeUuid: String, completion: @escaping (_ data: ProjectEdge?, _ error: Error?) -> Void)
```

Get Project Edge

プロジェクトに所属するエッジを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let edgeUuid = "edgeUuid_example" // String | エッジのUUID

// Get Project Edge
AuthProjectEdgesAPI.getProjectEdge(projectUuid: projectUuid, edgeUuid: edgeUuid) { (response, error) in
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
 **edgeUuid** | **String** | エッジのUUID | 

### Return type

[**ProjectEdge**](ProjectEdge.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listProjectEdges**
```swift
    open class func listProjectEdges(projectUuid: String, edgeUuid: [String]? = nil, page: Int? = nil, perPage: Int? = nil, completion: @escaping (_ data: ProjectEdges?, _ error: Error?) -> Void)
```

List Project Edges

プロジェクトに所属するエッジのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let edgeUuid = ["inner_example"] // [String] | エッジのUUID (optional)
let page = 987 // Int | 取得するページの番号 (optional) (default to 1)
let perPage = 987 // Int | 1回のリクエストで取得する件数 (optional) (default to 30)

// List Project Edges
AuthProjectEdgesAPI.listProjectEdges(projectUuid: projectUuid, edgeUuid: edgeUuid, page: page, perPage: perPage) { (response, error) in
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
 **edgeUuid** | [**[String]**](String.md) | エッジのUUID | [optional] 
 **page** | **Int** | 取得するページの番号 | [optional] [default to 1]
 **perPage** | **Int** | 1回のリクエストで取得する件数 | [optional] [default to 30]

### Return type

[**ProjectEdges**](ProjectEdges.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeProjectEdge**
```swift
    open class func removeProjectEdge(projectUuid: String, edgeUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Remove Project Edge

プロジェクトからエッジを外します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let edgeUuid = "edgeUuid_example" // String | エッジのUUID

// Remove Project Edge
AuthProjectEdgesAPI.removeProjectEdge(projectUuid: projectUuid, edgeUuid: edgeUuid) { (response, error) in
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
 **edgeUuid** | **String** | エッジのUUID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateProjectEdge**
```swift
    open class func updateProjectEdge(projectUuid: String, edgeUuid: String, updateProjectEdgeRequest: UpdateProjectEdgeRequest? = nil, completion: @escaping (_ data: ProjectEdge?, _ error: Error?) -> Void)
```

Update Project Edge

プロジェクトエッジを更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let edgeUuid = "edgeUuid_example" // String | エッジのUUID
let updateProjectEdgeRequest = UpdateProjectEdgeRequest(nickname: "nickname_example") // UpdateProjectEdgeRequest |  (optional)

// Update Project Edge
AuthProjectEdgesAPI.updateProjectEdge(projectUuid: projectUuid, edgeUuid: edgeUuid, updateProjectEdgeRequest: updateProjectEdgeRequest) { (response, error) in
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
 **edgeUuid** | **String** | エッジのUUID | 
 **updateProjectEdgeRequest** | [**UpdateProjectEdgeRequest**](UpdateProjectEdgeRequest.md) |  | [optional] 

### Return type

[**ProjectEdge**](ProjectEdge.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

