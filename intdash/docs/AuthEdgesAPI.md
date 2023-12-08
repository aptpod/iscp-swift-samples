# AuthEdgesAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**assignOwner**](AuthEdgesAPI.md#assignowner) | **POST** /auth/edges/{edge_uuid}/owner | Assign Owner
[**createEdge**](AuthEdgesAPI.md#createedge) | **POST** /auth/edges | Create Edge
[**createMyEdge**](AuthEdgesAPI.md#createmyedge) | **POST** /auth/users/me/edges | Create My Edge
[**createMyEdgeWithUUID**](AuthEdgesAPI.md#createmyedgewithuuid) | **PUT** /auth/users/me/edges/{edge_uuid} | Create My Edge With UUID
[**createUsersEdge**](AuthEdgesAPI.md#createusersedge) | **POST** /auth/users/{user_uuid}/edges | Create User&#39;s Edge
[**deleteEdge**](AuthEdgesAPI.md#deleteedge) | **DELETE** /auth/edges/{edge_uuid} | Delete Edge
[**deleteMyEdge**](AuthEdgesAPI.md#deletemyedge) | **DELETE** /auth/users/me/edges/{edge_uuid} | Delete My Edge
[**deleteUsersEdge**](AuthEdgesAPI.md#deleteusersedge) | **DELETE** /auth/users/{user_uuid}/edges/{edge_uuid} | Delete User&#39;s Edge
[**getEdge**](AuthEdgesAPI.md#getedge) | **GET** /auth/edges/{edge_uuid} | Get Edge
[**getMeAsEdge**](AuthEdgesAPI.md#getmeasedge) | **GET** /auth/edges/me | Get Edge having the same UUID as Me
[**getMyEdge**](AuthEdgesAPI.md#getmyedge) | **GET** /auth/users/me/edges/{edge_uuid} | Get My Edge
[**getUsersEdge**](AuthEdgesAPI.md#getusersedge) | **GET** /auth/users/{user_uuid}/edges/{edge_uuid} | Get User&#39;s Edge
[**listEdges**](AuthEdgesAPI.md#listedges) | **GET** /auth/edges | List Edges
[**listMyEdges**](AuthEdgesAPI.md#listmyedges) | **GET** /auth/users/me/edges | List My Edges
[**listUsersEdges**](AuthEdgesAPI.md#listusersedges) | **GET** /auth/users/{user_uuid}/edges | List User&#39;s Edges
[**removeOwner**](AuthEdgesAPI.md#removeowner) | **DELETE** /auth/edges/{edge_uuid}/owner | Unassign Owner
[**updateEdge**](AuthEdgesAPI.md#updateedge) | **PATCH** /auth/edges/{edge_uuid} | Update Edge
[**updateMyEdge**](AuthEdgesAPI.md#updatemyedge) | **PATCH** /auth/users/me/edges/{edge_uuid} | Update My Edge
[**updateUsersEdge**](AuthEdgesAPI.md#updateusersedge) | **PATCH** /auth/users/{user_uuid}/edges/{edge_uuid} | Update User&#39;s Edge


# **assignOwner**
```swift
    open class func assignOwner(edgeUuid: String, assignOwnerRequest: AssignOwnerRequest? = nil, completion: @escaping (_ data: EdgeOwner?, _ error: Error?) -> Void)
```

Assign Owner

エッジに所有者を割り当てます。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let edgeUuid = "edgeUuid_example" // String | エッジのUUID
let assignOwnerRequest = AssignOwnerRequest(userUuid: "userUuid_example") // AssignOwnerRequest |  (optional)

// Assign Owner
AuthEdgesAPI.assignOwner(edgeUuid: edgeUuid, assignOwnerRequest: assignOwnerRequest) { (response, error) in
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
 **edgeUuid** | **String** | エッジのUUID | 
 **assignOwnerRequest** | [**AssignOwnerRequest**](AssignOwnerRequest.md) |  | [optional] 

### Return type

[**EdgeOwner**](EdgeOwner.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createEdge**
```swift
    open class func createEdge(createEdgeRequest: CreateEdgeRequest? = nil, completion: @escaping (_ data: Edge?, _ error: Error?) -> Void)
```

Create Edge

所有者がない状態でエッジを作成します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let createEdgeRequest = CreateEdgeRequest(name: "name_example", nickname: "nickname_example", description: "description_example") // CreateEdgeRequest |  (optional)

// Create Edge
AuthEdgesAPI.createEdge(createEdgeRequest: createEdgeRequest) { (response, error) in
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
 **createEdgeRequest** | [**CreateEdgeRequest**](CreateEdgeRequest.md) |  | [optional] 

### Return type

[**Edge**](Edge.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createMyEdge**
```swift
    open class func createMyEdge(createEdgeRequest: CreateEdgeRequest? = nil, completion: @escaping (_ data: Edge?, _ error: Error?) -> Void)
```

Create My Edge

新しいエッジを作成し、自分（ユーザー）を所有者に設定します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let createEdgeRequest = CreateEdgeRequest(name: "name_example", nickname: "nickname_example", description: "description_example") // CreateEdgeRequest |  (optional)

// Create My Edge
AuthEdgesAPI.createMyEdge(createEdgeRequest: createEdgeRequest) { (response, error) in
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
 **createEdgeRequest** | [**CreateEdgeRequest**](CreateEdgeRequest.md) |  | [optional] 

### Return type

[**Edge**](Edge.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createMyEdgeWithUUID**
```swift
    open class func createMyEdgeWithUUID(edgeUuid: String, createEdgeRequest: CreateEdgeRequest? = nil, completion: @escaping (_ data: Edge?, _ error: Error?) -> Void)
```

Create My Edge With UUID

指定したUUIDを持つ新しいエッジを作成し、自分を所有者に設定します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let edgeUuid = "edgeUuid_example" // String | エッジのUUID
let createEdgeRequest = CreateEdgeRequest(name: "name_example", nickname: "nickname_example", description: "description_example") // CreateEdgeRequest |  (optional)

// Create My Edge With UUID
AuthEdgesAPI.createMyEdgeWithUUID(edgeUuid: edgeUuid, createEdgeRequest: createEdgeRequest) { (response, error) in
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
 **edgeUuid** | **String** | エッジのUUID | 
 **createEdgeRequest** | [**CreateEdgeRequest**](CreateEdgeRequest.md) |  | [optional] 

### Return type

[**Edge**](Edge.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createUsersEdge**
```swift
    open class func createUsersEdge(userUuid: String, createEdgeRequest: CreateEdgeRequest? = nil, completion: @escaping (_ data: Edge?, _ error: Error?) -> Void)
```

Create User's Edge

指定されたユーザーを所有者とするエッジを作成します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 
let createEdgeRequest = CreateEdgeRequest(name: "name_example", nickname: "nickname_example", description: "description_example") // CreateEdgeRequest |  (optional)

// Create User's Edge
AuthEdgesAPI.createUsersEdge(userUuid: userUuid, createEdgeRequest: createEdgeRequest) { (response, error) in
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
 **userUuid** | **String** |  | 
 **createEdgeRequest** | [**CreateEdgeRequest**](CreateEdgeRequest.md) |  | [optional] 

### Return type

[**Edge**](Edge.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteEdge**
```swift
    open class func deleteEdge(edgeUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Edge

エッジを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let edgeUuid = "edgeUuid_example" // String | エッジのUUID

// Delete Edge
AuthEdgesAPI.deleteEdge(edgeUuid: edgeUuid) { (response, error) in
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
 **edgeUuid** | **String** | エッジのUUID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteMyEdge**
```swift
    open class func deleteMyEdge(edgeUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete My Edge

自分（ユーザー）が所有するエッジを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let edgeUuid = "edgeUuid_example" // String | エッジのUUID

// Delete My Edge
AuthEdgesAPI.deleteMyEdge(edgeUuid: edgeUuid) { (response, error) in
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
 **edgeUuid** | **String** | エッジのUUID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteUsersEdge**
```swift
    open class func deleteUsersEdge(userUuid: String, edgeUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete User's Edge

ユーザーが所有するエッジを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 
let edgeUuid = "edgeUuid_example" // String | エッジのUUID

// Delete User's Edge
AuthEdgesAPI.deleteUsersEdge(userUuid: userUuid, edgeUuid: edgeUuid) { (response, error) in
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
 **userUuid** | **String** |  | 
 **edgeUuid** | **String** | エッジのUUID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEdge**
```swift
    open class func getEdge(edgeUuid: String, completion: @escaping (_ data: Edge?, _ error: Error?) -> Void)
```

Get Edge

エッジを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let edgeUuid = "edgeUuid_example" // String | エッジのUUID

// Get Edge
AuthEdgesAPI.getEdge(edgeUuid: edgeUuid) { (response, error) in
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
 **edgeUuid** | **String** | エッジのUUID | 

### Return type

[**Edge**](Edge.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMeAsEdge**
```swift
    open class func getMeAsEdge(completion: @escaping (_ data: Edge?, _ error: Error?) -> Void)
```

Get Edge having the same UUID as Me

自分のUUIDと同じエッジUUIDを持つエッジを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash


// Get Edge having the same UUID as Me
AuthEdgesAPI.getMeAsEdge() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**Edge**](Edge.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMyEdge**
```swift
    open class func getMyEdge(edgeUuid: String, completion: @escaping (_ data: Edge?, _ error: Error?) -> Void)
```

Get My Edge

自分（ユーザー）が所有するエッジを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let edgeUuid = "edgeUuid_example" // String | エッジのUUID

// Get My Edge
AuthEdgesAPI.getMyEdge(edgeUuid: edgeUuid) { (response, error) in
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
 **edgeUuid** | **String** | エッジのUUID | 

### Return type

[**Edge**](Edge.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUsersEdge**
```swift
    open class func getUsersEdge(userUuid: String, edgeUuid: String, completion: @escaping (_ data: Edge?, _ error: Error?) -> Void)
```

Get User's Edge

ユーザーが所有するエッジを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 
let edgeUuid = "edgeUuid_example" // String | エッジのUUID

// Get User's Edge
AuthEdgesAPI.getUsersEdge(userUuid: userUuid, edgeUuid: edgeUuid) { (response, error) in
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
 **userUuid** | **String** |  | 
 **edgeUuid** | **String** | エッジのUUID | 

### Return type

[**Edge**](Edge.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listEdges**
```swift
    open class func listEdges(uuid: [String]? = nil, name: [String]? = nil, nickname: [String]? = nil, ownerUuid: [String]? = nil, hasOwner: HasOwner_listEdges? = nil, sort: String? = nil, page: Int? = nil, perPage: Int? = nil, completion: @escaping (_ data: Edges?, _ error: Error?) -> Void)
```

List Edges

エッジのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let uuid = ["inner_example"] // [String] | エッジのUUID (optional)
let name = ["inner_example"] // [String] | 名前による部分一致検索 (optional)
let nickname = ["inner_example"] // [String] | 表示名による部分一致検索 (optional)
let ownerUuid = ["inner_example"] // [String] | 所有者ユーザーのUUID (optional)
let hasOwner = "hasOwner_example" // String | 所有者の有無。  * `true` : 所有者が設定されているエッジを取得します。 * `false` : 所有者が設定されていないエッジを取得します。 (optional)
let sort = "sort_example" // String | 並べ替えに使用するキー。接尾辞 `+` を付けた場合は昇順、 `-` を付けた場合は降順で出力されます。 接尾辞を省略した場合は昇順となります。 例えば、 `name-` を指定すると、nameによる降順で出力されます。   - name   - created_at   - updated_at (optional) (default to "name+")
let page = 987 // Int | 取得するページの番号 (optional) (default to 1)
let perPage = 987 // Int | 1回のリクエストで取得する件数 (optional) (default to 30)

// List Edges
AuthEdgesAPI.listEdges(uuid: uuid, name: name, nickname: nickname, ownerUuid: ownerUuid, hasOwner: hasOwner, sort: sort, page: page, perPage: perPage) { (response, error) in
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
 **uuid** | [**[String]**](String.md) | エッジのUUID | [optional] 
 **name** | [**[String]**](String.md) | 名前による部分一致検索 | [optional] 
 **nickname** | [**[String]**](String.md) | 表示名による部分一致検索 | [optional] 
 **ownerUuid** | [**[String]**](String.md) | 所有者ユーザーのUUID | [optional] 
 **hasOwner** | **String** | 所有者の有無。  * &#x60;true&#x60; : 所有者が設定されているエッジを取得します。 * &#x60;false&#x60; : 所有者が設定されていないエッジを取得します。 | [optional] 
 **sort** | **String** | 並べ替えに使用するキー。接尾辞 &#x60;+&#x60; を付けた場合は昇順、 &#x60;-&#x60; を付けた場合は降順で出力されます。 接尾辞を省略した場合は昇順となります。 例えば、 &#x60;name-&#x60; を指定すると、nameによる降順で出力されます。   - name   - created_at   - updated_at | [optional] [default to &quot;name+&quot;]
 **page** | **Int** | 取得するページの番号 | [optional] [default to 1]
 **perPage** | **Int** | 1回のリクエストで取得する件数 | [optional] [default to 30]

### Return type

[**Edges**](Edges.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMyEdges**
```swift
    open class func listMyEdges(completion: @escaping (_ data: Edges?, _ error: Error?) -> Void)
```

List My Edges

自分（ユーザー）が所有するエッジのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash


// List My Edges
AuthEdgesAPI.listMyEdges() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**Edges**](Edges.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listUsersEdges**
```swift
    open class func listUsersEdges(userUuid: String, completion: @escaping (_ data: Edges?, _ error: Error?) -> Void)
```

List User's Edges

指定されたユーザーが所有するエッジのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 

// List User's Edges
AuthEdgesAPI.listUsersEdges(userUuid: userUuid) { (response, error) in
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
 **userUuid** | **String** |  | 

### Return type

[**Edges**](Edges.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeOwner**
```swift
    open class func removeOwner(edgeUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Unassign Owner

エッジに所有者がない状態にします。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let edgeUuid = "edgeUuid_example" // String | エッジのUUID

// Unassign Owner
AuthEdgesAPI.removeOwner(edgeUuid: edgeUuid) { (response, error) in
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
 **edgeUuid** | **String** | エッジのUUID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateEdge**
```swift
    open class func updateEdge(edgeUuid: String, patchEdgeRequest: PatchEdgeRequest? = nil, completion: @escaping (_ data: Edge?, _ error: Error?) -> Void)
```

Update Edge

エッジを更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let edgeUuid = "edgeUuid_example" // String | エッジのUUID
let patchEdgeRequest = PatchEdgeRequest(name: "name_example", nickname: "nickname_example", description: "description_example") // PatchEdgeRequest |  (optional)

// Update Edge
AuthEdgesAPI.updateEdge(edgeUuid: edgeUuid, patchEdgeRequest: patchEdgeRequest) { (response, error) in
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
 **edgeUuid** | **String** | エッジのUUID | 
 **patchEdgeRequest** | [**PatchEdgeRequest**](PatchEdgeRequest.md) |  | [optional] 

### Return type

[**Edge**](Edge.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMyEdge**
```swift
    open class func updateMyEdge(edgeUuid: String, patchEdgeRequest: PatchEdgeRequest? = nil, completion: @escaping (_ data: Edge?, _ error: Error?) -> Void)
```

Update My Edge

自分（ユーザー）が所有するエッジを更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let edgeUuid = "edgeUuid_example" // String | エッジのUUID
let patchEdgeRequest = PatchEdgeRequest(name: "name_example", nickname: "nickname_example", description: "description_example") // PatchEdgeRequest |  (optional)

// Update My Edge
AuthEdgesAPI.updateMyEdge(edgeUuid: edgeUuid, patchEdgeRequest: patchEdgeRequest) { (response, error) in
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
 **edgeUuid** | **String** | エッジのUUID | 
 **patchEdgeRequest** | [**PatchEdgeRequest**](PatchEdgeRequest.md) |  | [optional] 

### Return type

[**Edge**](Edge.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateUsersEdge**
```swift
    open class func updateUsersEdge(userUuid: String, edgeUuid: String, patchEdgeRequest: PatchEdgeRequest? = nil, completion: @escaping (_ data: Edge?, _ error: Error?) -> Void)
```

Update User's Edge

ユーザーが所有するエッジを更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 
let edgeUuid = "edgeUuid_example" // String | エッジのUUID
let patchEdgeRequest = PatchEdgeRequest(name: "name_example", nickname: "nickname_example", description: "description_example") // PatchEdgeRequest |  (optional)

// Update User's Edge
AuthEdgesAPI.updateUsersEdge(userUuid: userUuid, edgeUuid: edgeUuid, patchEdgeRequest: patchEdgeRequest) { (response, error) in
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
 **userUuid** | **String** |  | 
 **edgeUuid** | **String** | エッジのUUID | 
 **patchEdgeRequest** | [**PatchEdgeRequest**](PatchEdgeRequest.md) |  | [optional] 

### Return type

[**Edge**](Edge.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

