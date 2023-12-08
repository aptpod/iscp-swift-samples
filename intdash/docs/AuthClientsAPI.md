# AuthClientsAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createMyOAuth2Clients**](AuthClientsAPI.md#createmyoauth2clients) | **POST** /auth/users/me/clients | Create My OAuth2Client
[**deleteMyOAuth2Client**](AuthClientsAPI.md#deletemyoauth2client) | **DELETE** /auth/users/me/clients/{client_id} | Delete My OAuth2Client
[**deleteOAuth2Client**](AuthClientsAPI.md#deleteoauth2client) | **DELETE** /auth/clients/{client_id} | Delete OAuth2Client
[**getMyOAuth2Client**](AuthClientsAPI.md#getmyoauth2client) | **GET** /auth/users/me/clients/{client_id} | Get My OAuth2Client
[**getOAuth2Client**](AuthClientsAPI.md#getoauth2client) | **GET** /auth/clients/{client_id} | Get OAuth2Client
[**listMyOAuth2Clients**](AuthClientsAPI.md#listmyoauth2clients) | **GET** /auth/users/me/clients | List My OAuth2Clients
[**listOAuth2Clients**](AuthClientsAPI.md#listoauth2clients) | **GET** /auth/clients | List OAuth2Clients
[**listUsersOAuth2Clients**](AuthClientsAPI.md#listusersoauth2clients) | **GET** /auth/users/{user_uuid}/clients | List User&#39;s OAuth2Clients
[**updateMyOAuth2Client**](AuthClientsAPI.md#updatemyoauth2client) | **PATCH** /auth/users/me/clients/{client_id} | Update My OAuth2Client
[**updateOAuth2Client**](AuthClientsAPI.md#updateoauth2client) | **PATCH** /auth/clients/{client_id} | Update OAuth2Client


# **createMyOAuth2Clients**
```swift
    open class func createMyOAuth2Clients(createMyOAuth2ClientRequest: CreateMyOAuth2ClientRequest? = nil, completion: @escaping (_ data: OAuth2ClientWithSecret?, _ error: Error?) -> Void)
```

Create My OAuth2Client

自分（ユーザー）のOAuth2クライアントを作成します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let createMyOAuth2ClientRequest = CreateMyOAuth2ClientRequest(name: "name_example", grantType: "grantType_example", redirectUris: ["redirectUris_example"], tokenEndpointAuthMethod: "tokenEndpointAuthMethod_example", tlsClientAuthSubjectDn: "tlsClientAuthSubjectDn_example") // CreateMyOAuth2ClientRequest |  (optional)

// Create My OAuth2Client
AuthClientsAPI.createMyOAuth2Clients(createMyOAuth2ClientRequest: createMyOAuth2ClientRequest) { (response, error) in
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
 **createMyOAuth2ClientRequest** | [**CreateMyOAuth2ClientRequest**](CreateMyOAuth2ClientRequest.md) |  | [optional] 

### Return type

[**OAuth2ClientWithSecret**](OAuth2ClientWithSecret.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteMyOAuth2Client**
```swift
    open class func deleteMyOAuth2Client(clientId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete My OAuth2Client

自分（ユーザー）のOAuth2クライアントを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let clientId = "clientId_example" // String | OAuth2クライアントID

// Delete My OAuth2Client
AuthClientsAPI.deleteMyOAuth2Client(clientId: clientId) { (response, error) in
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
 **clientId** | **String** | OAuth2クライアントID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOAuth2Client**
```swift
    open class func deleteOAuth2Client(clientId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete OAuth2Client

OAuth2クライアントを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let clientId = "clientId_example" // String | OAuth2クライアントID

// Delete OAuth2Client
AuthClientsAPI.deleteOAuth2Client(clientId: clientId) { (response, error) in
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
 **clientId** | **String** | OAuth2クライアントID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMyOAuth2Client**
```swift
    open class func getMyOAuth2Client(clientId: String, completion: @escaping (_ data: OAuth2Client?, _ error: Error?) -> Void)
```

Get My OAuth2Client

自分（ユーザー）のOAuth2クライアントを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let clientId = "clientId_example" // String | OAuth2クライアントID

// Get My OAuth2Client
AuthClientsAPI.getMyOAuth2Client(clientId: clientId) { (response, error) in
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
 **clientId** | **String** | OAuth2クライアントID | 

### Return type

[**OAuth2Client**](OAuth2Client.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOAuth2Client**
```swift
    open class func getOAuth2Client(clientId: String, completion: @escaping (_ data: OAuth2Client?, _ error: Error?) -> Void)
```

Get OAuth2Client

OAuth2クライアントを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let clientId = "clientId_example" // String | OAuth2クライアントID

// Get OAuth2Client
AuthClientsAPI.getOAuth2Client(clientId: clientId) { (response, error) in
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
 **clientId** | **String** | OAuth2クライアントID | 

### Return type

[**OAuth2Client**](OAuth2Client.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMyOAuth2Clients**
```swift
    open class func listMyOAuth2Clients(completion: @escaping (_ data: OAuth2Clients?, _ error: Error?) -> Void)
```

List My OAuth2Clients

自分（ユーザー）のOAuth2クライアントのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash


// List My OAuth2Clients
AuthClientsAPI.listMyOAuth2Clients() { (response, error) in
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

[**OAuth2Clients**](OAuth2Clients.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listOAuth2Clients**
```swift
    open class func listOAuth2Clients(id: [String]? = nil, name: [String]? = nil, sort: String? = nil, page: Int? = nil, perPage: Int? = nil, completion: @escaping (_ data: OAuth2Clients?, _ error: Error?) -> Void)
```

List OAuth2Clients

OAuth2クライアントのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let id = ["inner_example"] // [String] | OAuth2クライアントID (optional)
let name = ["inner_example"] // [String] | 名前による部分一致検索 (optional)
let sort = "sort_example" // String | 並べ替えに使用するキー。接尾辞 `+` を付けた場合は昇順、 `-` を付けた場合は降順で出力されます。 接尾辞を省略した場合は昇順となります。 例えば、 `name-` を指定すると、nameによる降順で出力されます。   - name   - created_at   - updated_at (optional) (default to "name+")
let page = 987 // Int | 取得するページの番号 (optional) (default to 1)
let perPage = 987 // Int | 1回のリクエストで取得する件数 (optional) (default to 30)

// List OAuth2Clients
AuthClientsAPI.listOAuth2Clients(id: id, name: name, sort: sort, page: page, perPage: perPage) { (response, error) in
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
 **id** | [**[String]**](String.md) | OAuth2クライアントID | [optional] 
 **name** | [**[String]**](String.md) | 名前による部分一致検索 | [optional] 
 **sort** | **String** | 並べ替えに使用するキー。接尾辞 &#x60;+&#x60; を付けた場合は昇順、 &#x60;-&#x60; を付けた場合は降順で出力されます。 接尾辞を省略した場合は昇順となります。 例えば、 &#x60;name-&#x60; を指定すると、nameによる降順で出力されます。   - name   - created_at   - updated_at | [optional] [default to &quot;name+&quot;]
 **page** | **Int** | 取得するページの番号 | [optional] [default to 1]
 **perPage** | **Int** | 1回のリクエストで取得する件数 | [optional] [default to 30]

### Return type

[**OAuth2Clients**](OAuth2Clients.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listUsersOAuth2Clients**
```swift
    open class func listUsersOAuth2Clients(userUuid: String, completion: @escaping (_ data: OAuth2Clients?, _ error: Error?) -> Void)
```

List User's OAuth2Clients

ユーザーのOAuth2クライアントのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 

// List User's OAuth2Clients
AuthClientsAPI.listUsersOAuth2Clients(userUuid: userUuid) { (response, error) in
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

[**OAuth2Clients**](OAuth2Clients.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMyOAuth2Client**
```swift
    open class func updateMyOAuth2Client(clientId: String, updateOAuth2ClientRequest: UpdateOAuth2ClientRequest? = nil, completion: @escaping (_ data: OAuth2Client?, _ error: Error?) -> Void)
```

Update My OAuth2Client

自分（ユーザー）のOAuth2クライアントを更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let clientId = "clientId_example" // String | OAuth2クライアントID
let updateOAuth2ClientRequest = UpdateOAuth2ClientRequest(name: "name_example", redirectUris: ["redirectUris_example"]) // UpdateOAuth2ClientRequest |  (optional)

// Update My OAuth2Client
AuthClientsAPI.updateMyOAuth2Client(clientId: clientId, updateOAuth2ClientRequest: updateOAuth2ClientRequest) { (response, error) in
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
 **clientId** | **String** | OAuth2クライアントID | 
 **updateOAuth2ClientRequest** | [**UpdateOAuth2ClientRequest**](UpdateOAuth2ClientRequest.md) |  | [optional] 

### Return type

[**OAuth2Client**](OAuth2Client.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOAuth2Client**
```swift
    open class func updateOAuth2Client(clientId: String, updateOAuth2ClientRequest: UpdateOAuth2ClientRequest? = nil, completion: @escaping (_ data: OAuth2Client?, _ error: Error?) -> Void)
```

Update OAuth2Client

OAuth2クライアントを更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let clientId = "clientId_example" // String | OAuth2クライアントID
let updateOAuth2ClientRequest = UpdateOAuth2ClientRequest(name: "name_example", redirectUris: ["redirectUris_example"]) // UpdateOAuth2ClientRequest |  (optional)

// Update OAuth2Client
AuthClientsAPI.updateOAuth2Client(clientId: clientId, updateOAuth2ClientRequest: updateOAuth2ClientRequest) { (response, error) in
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
 **clientId** | **String** | OAuth2クライアントID | 
 **updateOAuth2ClientRequest** | [**UpdateOAuth2ClientRequest**](UpdateOAuth2ClientRequest.md) |  | [optional] 

### Return type

[**OAuth2Client**](OAuth2Client.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

