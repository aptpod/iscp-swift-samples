# AuthGroupMembersAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addGroupMember**](AuthGroupMembersAPI.md#addgroupmember) | **POST** /auth/groups/{group_uuid}/members | Add Group Member
[**addGroupOwnerAttribute**](AuthGroupMembersAPI.md#addgroupownerattribute) | **PUT** /auth/groups/{group_uuid}/members/{user_uuid}/owner | Add Group Owner Attribute
[**getGroupMember**](AuthGroupMembersAPI.md#getgroupmember) | **GET** /auth/groups/{group_uuid}/members/{user_uuid} | Get Group Member
[**listGroupMembers**](AuthGroupMembersAPI.md#listgroupmembers) | **GET** /auth/groups/{group_uuid}/members | List Group Members
[**removeGroupMember**](AuthGroupMembersAPI.md#removegroupmember) | **DELETE** /auth/groups/{group_uuid}/members/{user_uuid} | Remove Group Member
[**removeGroupOwnerAttribute**](AuthGroupMembersAPI.md#removegroupownerattribute) | **DELETE** /auth/groups/{group_uuid}/members/{user_uuid}/owner | Remove Group Owner Attribute
[**updateGroupMember**](AuthGroupMembersAPI.md#updategroupmember) | **PATCH** /auth/groups/{group_uuid}/members/{user_uuid} | Update Group Member


# **addGroupMember**
```swift
    open class func addGroupMember(groupUuid: String, addGroupMemberRequest: AddGroupMemberRequest? = nil, completion: @escaping (_ data: Member?, _ error: Error?) -> Void)
```

Add Group Member

グループメンバーを追加します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let groupUuid = "groupUuid_example" // String | グループのUUID
let addGroupMemberRequest = AddGroupMemberRequest(userEmailAddress: "userEmailAddress_example", roleUuids: ["roleUuids_example"]) // AddGroupMemberRequest |  (optional)

// Add Group Member
AuthGroupMembersAPI.addGroupMember(groupUuid: groupUuid, addGroupMemberRequest: addGroupMemberRequest) { (response, error) in
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
 **addGroupMemberRequest** | [**AddGroupMemberRequest**](AddGroupMemberRequest.md) |  | [optional] 

### Return type

[**Member**](Member.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **addGroupOwnerAttribute**
```swift
    open class func addGroupOwnerAttribute(groupUuid: String, userUuid: String, completion: @escaping (_ data: Member?, _ error: Error?) -> Void)
```

Add Group Owner Attribute

オーナー属性を追加します。オーナー属性を追加したメンバーは自動的にそのグループにおける全ての権限が付与されます。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let groupUuid = "groupUuid_example" // String | グループのUUID
let userUuid = "userUuid_example" // String | 

// Add Group Owner Attribute
AuthGroupMembersAPI.addGroupOwnerAttribute(groupUuid: groupUuid, userUuid: userUuid) { (response, error) in
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
 **userUuid** | **String** |  | 

### Return type

[**Member**](Member.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGroupMember**
```swift
    open class func getGroupMember(groupUuid: String, userUuid: String, completion: @escaping (_ data: Member?, _ error: Error?) -> Void)
```

Get Group Member

グループメンバーを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let groupUuid = "groupUuid_example" // String | グループのUUID
let userUuid = "userUuid_example" // String | 

// Get Group Member
AuthGroupMembersAPI.getGroupMember(groupUuid: groupUuid, userUuid: userUuid) { (response, error) in
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
 **userUuid** | **String** |  | 

### Return type

[**Member**](Member.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listGroupMembers**
```swift
    open class func listGroupMembers(groupUuid: String, userUuid: [String]? = nil, page: Int? = nil, perPage: Int? = nil, completion: @escaping (_ data: Members?, _ error: Error?) -> Void)
```

List Group Members

グループメンバーリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let groupUuid = "groupUuid_example" // String | グループのUUID
let userUuid = ["inner_example"] // [String] | ユーザーのUUID (optional)
let page = 987 // Int | 取得するページの番号 (optional) (default to 1)
let perPage = 987 // Int | 1回のリクエストで取得する件数 (optional) (default to 30)

// List Group Members
AuthGroupMembersAPI.listGroupMembers(groupUuid: groupUuid, userUuid: userUuid, page: page, perPage: perPage) { (response, error) in
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

# **removeGroupMember**
```swift
    open class func removeGroupMember(groupUuid: String, userUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Remove Group Member

グループメンバーを除名します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let groupUuid = "groupUuid_example" // String | グループのUUID
let userUuid = "userUuid_example" // String | 

// Remove Group Member
AuthGroupMembersAPI.removeGroupMember(groupUuid: groupUuid, userUuid: userUuid) { (response, error) in
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
 **userUuid** | **String** |  | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeGroupOwnerAttribute**
```swift
    open class func removeGroupOwnerAttribute(groupUuid: String, userUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Remove Group Owner Attribute

オーナー属性を取り除きます。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let groupUuid = "groupUuid_example" // String | グループのUUID
let userUuid = "userUuid_example" // String | 

// Remove Group Owner Attribute
AuthGroupMembersAPI.removeGroupOwnerAttribute(groupUuid: groupUuid, userUuid: userUuid) { (response, error) in
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
 **userUuid** | **String** |  | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateGroupMember**
```swift
    open class func updateGroupMember(groupUuid: String, userUuid: String, updateGroupMemberRequest: UpdateGroupMemberRequest? = nil, completion: @escaping (_ data: Member?, _ error: Error?) -> Void)
```

Update Group Member

グループメンバーを更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let groupUuid = "groupUuid_example" // String | グループのUUID
let userUuid = "userUuid_example" // String | 
let updateGroupMemberRequest = UpdateGroupMemberRequest(roleUuids: ["roleUuids_example"]) // UpdateGroupMemberRequest |  (optional)

// Update Group Member
AuthGroupMembersAPI.updateGroupMember(groupUuid: groupUuid, userUuid: userUuid, updateGroupMemberRequest: updateGroupMemberRequest) { (response, error) in
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
 **userUuid** | **String** |  | 
 **updateGroupMemberRequest** | [**UpdateGroupMemberRequest**](UpdateGroupMemberRequest.md) |  | [optional] 

### Return type

[**Member**](Member.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

