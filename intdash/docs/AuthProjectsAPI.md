# AuthProjectsAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createProject**](AuthProjectsAPI.md#createproject) | **POST** /auth/groups/{group_uuid}/projects | Create Project
[**deleteProject**](AuthProjectsAPI.md#deleteproject) | **DELETE** /auth/projects/{project_uuid} | Delete Project
[**getProject**](AuthProjectsAPI.md#getproject) | **GET** /auth/projects/{project_uuid} | Get Project
[**listGroupProjects**](AuthProjectsAPI.md#listgroupprojects) | **GET** /auth/groups/{group_uuid}/projects | List Group Projects
[**listMyProjects**](AuthProjectsAPI.md#listmyprojects) | **GET** /auth/users/me/projects | List My Projects
[**listProjects**](AuthProjectsAPI.md#listprojects) | **GET** /auth/projects | List Projects
[**updateProject**](AuthProjectsAPI.md#updateproject) | **PATCH** /auth/projects/{project_uuid} | Update Project


# **createProject**
```swift
    open class func createProject(groupUuid: String, createProjectRequest: CreateProjectRequest? = nil, completion: @escaping (_ data: Project?, _ error: Error?) -> Void)
```

Create Project

プロジェクトを作成します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let groupUuid = "groupUuid_example" // String | グループのUUID
let createProjectRequest = CreateProjectRequest(name: "name_example") // CreateProjectRequest |  (optional)

// Create Project
AuthProjectsAPI.createProject(groupUuid: groupUuid, createProjectRequest: createProjectRequest) { (response, error) in
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
 **groupUuid** | **String** | グループのUUID | 
 **createProjectRequest** | [**CreateProjectRequest**](CreateProjectRequest.md) |  | [optional] 

### Return type

[**Project**](Project.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteProject**
```swift
    open class func deleteProject(projectUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Project

プロジェクトを削除します。プロジェクトを削除できるのはプロジェクトのオーナーのみです。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID

// Delete Project
AuthProjectsAPI.deleteProject(projectUuid: projectUuid) { (response, error) in
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

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProject**
```swift
    open class func getProject(projectUuid: String, completion: @escaping (_ data: Project?, _ error: Error?) -> Void)
```

Get Project

プロジェクトを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID

// Get Project
AuthProjectsAPI.getProject(projectUuid: projectUuid) { (response, error) in
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

### Return type

[**Project**](Project.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listGroupProjects**
```swift
    open class func listGroupProjects(groupUuid: String, page: Int? = nil, perPage: Int? = nil, sort: Sort_listGroupProjects? = nil, completion: @escaping (_ data: Projects?, _ error: Error?) -> Void)
```

List Group Projects

プロジェクトのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let groupUuid = "groupUuid_example" // String | グループのUUID
let page = 987 // Int | 取得するページの番号 (optional) (default to 1)
let perPage = 987 // Int | 1回のリクエストで取得する件数 (optional) (default to 30)
let sort = "sort_example" // String | 並べ替えに使用するキー。接尾辞 `+` を付けた場合は昇順、 `-` を付けた場合は降順で出力されます。 接尾辞を省略した場合は昇順となります。 例えば、 `name-` を指定すると、nameによる降順で出力されます。 (optional)

// List Group Projects
AuthProjectsAPI.listGroupProjects(groupUuid: groupUuid, page: page, perPage: perPage, sort: sort) { (response, error) in
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
 **groupUuid** | **String** | グループのUUID | 
 **page** | **Int** | 取得するページの番号 | [optional] [default to 1]
 **perPage** | **Int** | 1回のリクエストで取得する件数 | [optional] [default to 30]
 **sort** | **String** | 並べ替えに使用するキー。接尾辞 &#x60;+&#x60; を付けた場合は昇順、 &#x60;-&#x60; を付けた場合は降順で出力されます。 接尾辞を省略した場合は昇順となります。 例えば、 &#x60;name-&#x60; を指定すると、nameによる降順で出力されます。 | [optional] 

### Return type

[**Projects**](Projects.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMyProjects**
```swift
    open class func listMyProjects(page: Int? = nil, perPage: Int? = nil, completion: @escaping (_ data: Projects?, _ error: Error?) -> Void)
```

List My Projects

自分（ユーザー）が所属するプロジェクトのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let page = 987 // Int | 取得するページの番号 (optional) (default to 1)
let perPage = 987 // Int | 1回のリクエストで取得する件数 (optional) (default to 30)

// List My Projects
AuthProjectsAPI.listMyProjects(page: page, perPage: perPage) { (response, error) in
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
 **page** | **Int** | 取得するページの番号 | [optional] [default to 1]
 **perPage** | **Int** | 1回のリクエストで取得する件数 | [optional] [default to 30]

### Return type

[**Projects**](Projects.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listProjects**
```swift
    open class func listProjects(sinceCreatedAt: Date? = nil, page: Int? = nil, perPage: Int? = nil, sort: Sort_listProjects? = nil, completion: @escaping (_ data: Projects?, _ error: Error?) -> Void)
```

List Projects

プロジェクトのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let sinceCreatedAt = Date() // Date | 指定した時刻より後に作成されたリソースを取得します。 (optional)
let page = 987 // Int | 取得するページの番号 (optional) (default to 1)
let perPage = 987 // Int | 1回のリクエストで取得する件数 (optional) (default to 30)
let sort = "sort_example" // String | 並べ替えに使用するキー。接尾辞 `+` を付けた場合は昇順、 `-` を付けた場合は降順で出力されます。 接尾辞を省略した場合は昇順となります。 例えば、 `name-` を指定すると、nameによる降順で出力されます。 (optional)

// List Projects
AuthProjectsAPI.listProjects(sinceCreatedAt: sinceCreatedAt, page: page, perPage: perPage, sort: sort) { (response, error) in
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
 **sinceCreatedAt** | **Date** | 指定した時刻より後に作成されたリソースを取得します。 | [optional] 
 **page** | **Int** | 取得するページの番号 | [optional] [default to 1]
 **perPage** | **Int** | 1回のリクエストで取得する件数 | [optional] [default to 30]
 **sort** | **String** | 並べ替えに使用するキー。接尾辞 &#x60;+&#x60; を付けた場合は昇順、 &#x60;-&#x60; を付けた場合は降順で出力されます。 接尾辞を省略した場合は昇順となります。 例えば、 &#x60;name-&#x60; を指定すると、nameによる降順で出力されます。 | [optional] 

### Return type

[**Projects**](Projects.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateProject**
```swift
    open class func updateProject(projectUuid: String, updateProjectRequest: UpdateProjectRequest? = nil, completion: @escaping (_ data: Project?, _ error: Error?) -> Void)
```

Update Project

プロジェクトを更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let updateProjectRequest = UpdateProjectRequest(name: "name_example") // UpdateProjectRequest |  (optional)

// Update Project
AuthProjectsAPI.updateProject(projectUuid: projectUuid, updateProjectRequest: updateProjectRequest) { (response, error) in
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
 **updateProjectRequest** | [**UpdateProjectRequest**](UpdateProjectRequest.md) |  | [optional] 

### Return type

[**Project**](Project.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

