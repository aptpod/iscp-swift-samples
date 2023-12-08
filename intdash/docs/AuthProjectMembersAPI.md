# AuthProjectMembersAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addProjectMember**](AuthProjectMembersAPI.md#addprojectmember) | **POST** /auth/projects/{project_uuid}/members | Add Project Member
[**addProjectOwnerAttribute**](AuthProjectMembersAPI.md#addprojectownerattribute) | **PUT** /auth/projects/{project_uuid}/members/{user_uuid}/owner | Add Project Owner Attribute
[**getProjectMember**](AuthProjectMembersAPI.md#getprojectmember) | **GET** /auth/projects/{project_uuid}/members/{user_uuid} | Get Project Member
[**listProjectMembers**](AuthProjectMembersAPI.md#listprojectmembers) | **GET** /auth/projects/{project_uuid}/members | List Project Members
[**removeProjectMember**](AuthProjectMembersAPI.md#removeprojectmember) | **DELETE** /auth/projects/{project_uuid}/members/{user_uuid} | Remove Project Member
[**removeProjectOwnerAttribute**](AuthProjectMembersAPI.md#removeprojectownerattribute) | **DELETE** /auth/projects/{project_uuid}/members/{user_uuid}/owner | Remove Project Owner Attribute
[**updateProjectMember**](AuthProjectMembersAPI.md#updateprojectmember) | **PATCH** /auth/projects/{project_uuid}/members/{user_uuid} | Update Project Member


# **addProjectMember**
```swift
    open class func addProjectMember(projectUuid: String, addProjectMemberRequest: AddProjectMemberRequest? = nil, completion: @escaping (_ data: Member?, _ error: Error?) -> Void)
```

Add Project Member

プロジェクトメンバーを追加します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let addProjectMemberRequest = AddProjectMemberRequest(userEmailAddress: "userEmailAddress_example", userUuid: "userUuid_example", roleUuids: ["roleUuids_example"]) // AddProjectMemberRequest |  (optional)

// Add Project Member
AuthProjectMembersAPI.addProjectMember(projectUuid: projectUuid, addProjectMemberRequest: addProjectMemberRequest) { (response, error) in
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
 **addProjectMemberRequest** | [**AddProjectMemberRequest**](AddProjectMemberRequest.md) |  | [optional] 

### Return type

[**Member**](Member.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **addProjectOwnerAttribute**
```swift
    open class func addProjectOwnerAttribute(projectUuid: String, userUuid: String, completion: @escaping (_ data: Member?, _ error: Error?) -> Void)
```

Add Project Owner Attribute

オーナー属性を追加します。オーナー属性を追加したメンバーは自動的にそのプロジェクトにおける全ての権限が付与されます。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let userUuid = "userUuid_example" // String | 

// Add Project Owner Attribute
AuthProjectMembersAPI.addProjectOwnerAttribute(projectUuid: projectUuid, userUuid: userUuid) { (response, error) in
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
 **userUuid** | **String** |  | 

### Return type

[**Member**](Member.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectMember**
```swift
    open class func getProjectMember(projectUuid: String, userUuid: String, completion: @escaping (_ data: Member?, _ error: Error?) -> Void)
```

Get Project Member

プロジェクトメンバーを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let userUuid = "userUuid_example" // String | 

// Get Project Member
AuthProjectMembersAPI.getProjectMember(projectUuid: projectUuid, userUuid: userUuid) { (response, error) in
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
 **userUuid** | **String** |  | 

### Return type

[**Member**](Member.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listProjectMembers**
```swift
    open class func listProjectMembers(projectUuid: String, userUuid: [String]? = nil, page: Int? = nil, perPage: Int? = nil, completion: @escaping (_ data: Members?, _ error: Error?) -> Void)
```

List Project Members

プロジェクトメンバーリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let userUuid = ["inner_example"] // [String] | ユーザーのUUID (optional)
let page = 987 // Int | 取得するページの番号 (optional) (default to 1)
let perPage = 987 // Int | 1回のリクエストで取得する件数 (optional) (default to 30)

// List Project Members
AuthProjectMembersAPI.listProjectMembers(projectUuid: projectUuid, userUuid: userUuid, page: page, perPage: perPage) { (response, error) in
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
 **userUuid** | [**[String]**](String.md) | ユーザーのUUID | [optional] 
 **page** | **Int** | 取得するページの番号 | [optional] [default to 1]
 **perPage** | **Int** | 1回のリクエストで取得する件数 | [optional] [default to 30]

### Return type

[**Members**](Members.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeProjectMember**
```swift
    open class func removeProjectMember(projectUuid: String, userUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Remove Project Member

プロジェクトからメンバーを外します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let userUuid = "userUuid_example" // String | 

// Remove Project Member
AuthProjectMembersAPI.removeProjectMember(projectUuid: projectUuid, userUuid: userUuid) { (response, error) in
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
 **userUuid** | **String** |  | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeProjectOwnerAttribute**
```swift
    open class func removeProjectOwnerAttribute(projectUuid: String, userUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Remove Project Owner Attribute

オーナー属性を取り除きます。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let userUuid = "userUuid_example" // String | 

// Remove Project Owner Attribute
AuthProjectMembersAPI.removeProjectOwnerAttribute(projectUuid: projectUuid, userUuid: userUuid) { (response, error) in
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
 **userUuid** | **String** |  | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateProjectMember**
```swift
    open class func updateProjectMember(projectUuid: String, userUuid: String, updateProjectMemberRequest: UpdateProjectMemberRequest? = nil, completion: @escaping (_ data: Member?, _ error: Error?) -> Void)
```

Update Project Member

プロジェクトメンバーを更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let userUuid = "userUuid_example" // String | 
let updateProjectMemberRequest = UpdateProjectMemberRequest(roleUuids: ["roleUuids_example"]) // UpdateProjectMemberRequest |  (optional)

// Update Project Member
AuthProjectMembersAPI.updateProjectMember(projectUuid: projectUuid, userUuid: userUuid, updateProjectMemberRequest: updateProjectMemberRequest) { (response, error) in
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
 **userUuid** | **String** |  | 
 **updateProjectMemberRequest** | [**UpdateProjectMemberRequest**](UpdateProjectMemberRequest.md) |  | [optional] 

### Return type

[**Member**](Member.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

