# AuthGroupsAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createGroup**](AuthGroupsAPI.md#creategroup) | **POST** /auth/groups | Create Group
[**createSubGroup**](AuthGroupsAPI.md#createsubgroup) | **POST** /auth/groups/{group_uuid}/groups | Create Sub Group
[**deleteGroup**](AuthGroupsAPI.md#deletegroup) | **DELETE** /auth/groups/{group_uuid} | Delete Group
[**getGroup**](AuthGroupsAPI.md#getgroup) | **GET** /auth/groups/{group_uuid} | Get Group
[**listGroups**](AuthGroupsAPI.md#listgroups) | **GET** /auth/groups | List Groups
[**listMyGroups**](AuthGroupsAPI.md#listmygroups) | **GET** /auth/users/me/groups | List My Groups
[**listSubGroup**](AuthGroupsAPI.md#listsubgroup) | **GET** /auth/groups/{group_uuid}/groups | List Sub Groups
[**updateGroup**](AuthGroupsAPI.md#updategroup) | **PATCH** /auth/groups/{group_uuid} | Update Group


# **createGroup**
```swift
    open class func createGroup(createGroupRequest: CreateGroupRequest? = nil, completion: @escaping (_ data: Group?, _ error: Error?) -> Void)
```

Create Group

グループを作成します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let createGroupRequest = CreateGroupRequest(name: "name_example") // CreateGroupRequest |  (optional)

// Create Group
AuthGroupsAPI.createGroup(createGroupRequest: createGroupRequest) { (response, error) in
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
 **createGroupRequest** | [**CreateGroupRequest**](CreateGroupRequest.md) |  | [optional] 

### Return type

[**Group**](Group.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createSubGroup**
```swift
    open class func createSubGroup(groupUuid: String, createGroupRequest: CreateGroupRequest? = nil, completion: @escaping (_ data: Group?, _ error: Error?) -> Void)
```

Create Sub Group

サブグループを作成します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let groupUuid = "groupUuid_example" // String | グループのUUID
let createGroupRequest = CreateGroupRequest(name: "name_example") // CreateGroupRequest |  (optional)

// Create Sub Group
AuthGroupsAPI.createSubGroup(groupUuid: groupUuid, createGroupRequest: createGroupRequest) { (response, error) in
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
 **createGroupRequest** | [**CreateGroupRequest**](CreateGroupRequest.md) |  | [optional] 

### Return type

[**Group**](Group.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteGroup**
```swift
    open class func deleteGroup(groupUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Group

グループを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let groupUuid = "groupUuid_example" // String | グループのUUID

// Delete Group
AuthGroupsAPI.deleteGroup(groupUuid: groupUuid) { (response, error) in
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

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGroup**
```swift
    open class func getGroup(groupUuid: String, completion: @escaping (_ data: Group?, _ error: Error?) -> Void)
```

Get Group

グループを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let groupUuid = "groupUuid_example" // String | グループのUUID

// Get Group
AuthGroupsAPI.getGroup(groupUuid: groupUuid) { (response, error) in
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

### Return type

[**Group**](Group.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listGroups**
```swift
    open class func listGroups(page: Int? = nil, perPage: Int? = nil, sort: Sort_listGroups? = nil, completion: @escaping (_ data: Groups?, _ error: Error?) -> Void)
```

List Groups

グループのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let page = 987 // Int | 取得するページの番号 (optional) (default to 1)
let perPage = 987 // Int | 1回のリクエストで取得する件数 (optional) (default to 30)
let sort = "sort_example" // String | 並べ替えに使用するキー。接尾辞 `+` を付けた場合は昇順、 `-` を付けた場合は降順で出力されます。 接尾辞を省略した場合は昇順となります。 例えば、 `name-` を指定すると、nameによる降順で出力されます。 (optional)

// List Groups
AuthGroupsAPI.listGroups(page: page, perPage: perPage, sort: sort) { (response, error) in
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
 **sort** | **String** | 並べ替えに使用するキー。接尾辞 &#x60;+&#x60; を付けた場合は昇順、 &#x60;-&#x60; を付けた場合は降順で出力されます。 接尾辞を省略した場合は昇順となります。 例えば、 &#x60;name-&#x60; を指定すると、nameによる降順で出力されます。 | [optional] 

### Return type

[**Groups**](Groups.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMyGroups**
```swift
    open class func listMyGroups(page: Int? = nil, perPage: Int? = nil, completion: @escaping (_ data: Groups?, _ error: Error?) -> Void)
```

List My Groups

自分（ユーザー）が所属するグループのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let page = 987 // Int | 取得するページの番号 (optional) (default to 1)
let perPage = 987 // Int | 1回のリクエストで取得する件数 (optional) (default to 30)

// List My Groups
AuthGroupsAPI.listMyGroups(page: page, perPage: perPage) { (response, error) in
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

[**Groups**](Groups.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listSubGroup**
```swift
    open class func listSubGroup(groupUuid: String, page: Int? = nil, perPage: Int? = nil, sort: Sort_listSubGroup? = nil, completion: @escaping (_ data: Groups?, _ error: Error?) -> Void)
```

List Sub Groups

サブグループを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let groupUuid = "groupUuid_example" // String | グループのUUID
let page = 987 // Int | 取得するページの番号 (optional) (default to 1)
let perPage = 987 // Int | 1回のリクエストで取得する件数 (optional) (default to 30)
let sort = "sort_example" // String | 並べ替えに使用するキー。接尾辞 `+` を付けた場合は昇順、 `-` を付けた場合は降順で出力されます。 接尾辞を省略した場合は昇順となります。 例えば、 `name-` を指定すると、nameによる降順で出力されます。 (optional)

// List Sub Groups
AuthGroupsAPI.listSubGroup(groupUuid: groupUuid, page: page, perPage: perPage, sort: sort) { (response, error) in
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

[**Groups**](Groups.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateGroup**
```swift
    open class func updateGroup(groupUuid: String, updateGroupRequest: UpdateGroupRequest? = nil, completion: @escaping (_ data: Group?, _ error: Error?) -> Void)
```

Update Group

グループを更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let groupUuid = "groupUuid_example" // String | グループのUUID
let updateGroupRequest = UpdateGroupRequest(name: "name_example") // UpdateGroupRequest |  (optional)

// Update Group
AuthGroupsAPI.updateGroup(groupUuid: groupUuid, updateGroupRequest: updateGroupRequest) { (response, error) in
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
 **updateGroupRequest** | [**UpdateGroupRequest**](UpdateGroupRequest.md) |  | [optional] 

### Return type

[**Group**](Group.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

