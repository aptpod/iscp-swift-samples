# AuthUsersAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**assignRole**](AuthUsersAPI.md#assignrole) | **PUT** /auth/users/{user_uuid}/roles/{role_uuid} | Assign Role
[**createAPIToken**](AuthUsersAPI.md#createapitoken) | **POST** /auth/users/{user_uuid}/tokens | Create API Token
[**createEmail**](AuthUsersAPI.md#createemail) | **POST** /auth/users/{user_uuid}/emails | Create Email
[**createTemporaryPassword**](AuthUsersAPI.md#createtemporarypassword) | **PUT** /auth/users/{user_uuid}/password | Create Temporary Password
[**createUser**](AuthUsersAPI.md#createuser) | **POST** /auth/users | Create User
[**deleteAPIToken**](AuthUsersAPI.md#deleteapitoken) | **DELETE** /auth/users/{user_uuid}/tokens/{user_api_token_id} | Delete API Token
[**deleteEmail**](AuthUsersAPI.md#deleteemail) | **DELETE** /auth/users/{user_uuid}/emails/{user_email_id} | Delete Email
[**deleteUser**](AuthUsersAPI.md#deleteuser) | **DELETE** /auth/users/{user_uuid} | Delete User
[**disableUser**](AuthUsersAPI.md#disableuser) | **PUT** /auth/users/{user_uuid}/disable | Disable User
[**enableUser**](AuthUsersAPI.md#enableuser) | **PUT** /auth/users/{user_uuid}/enable | Enable User
[**getUser**](AuthUsersAPI.md#getuser) | **GET** /auth/users/{user_uuid} | Get User
[**introspectAPIToken**](AuthUsersAPI.md#introspectapitoken) | **POST** /auth/users/tokens/introspection | Introspect API Token
[**listAPITokens**](AuthUsersAPI.md#listapitokens) | **GET** /auth/users/{user_uuid}/tokens | List API Tokens
[**listUsers**](AuthUsersAPI.md#listusers) | **GET** /auth/users | List Users
[**listUsersRoles**](AuthUsersAPI.md#listusersroles) | **GET** /auth/users/{user_uuid}/roles | List User&#39;s Roles
[**sendVerificationEmail**](AuthUsersAPI.md#sendverificationemail) | **PUT** /auth/users/{user_uuid}/emails/{user_email_id}/verification | Send Verification Email
[**unassignRole**](AuthUsersAPI.md#unassignrole) | **DELETE** /auth/users/{user_uuid}/roles/{role_uuid} | Unassign Role
[**unlockPassword**](AuthUsersAPI.md#unlockpassword) | **PUT** /auth/users/{user_uuid}/password/unlock | Unlock Password
[**updateAPIToken**](AuthUsersAPI.md#updateapitoken) | **PATCH** /auth/users/{user_uuid}/tokens/{user_api_token_id} | Update API Token
[**updateEmail**](AuthUsersAPI.md#updateemail) | **PATCH** /auth/users/{user_uuid}/emails/{user_email_id} | Update Email
[**updateToVerified**](AuthUsersAPI.md#updatetoverified) | **PUT** /auth/users/{user_uuid}/emails/{user_email_id}/verified | Set Email as Verified
[**updateUser**](AuthUsersAPI.md#updateuser) | **PATCH** /auth/users/{user_uuid} | Update User


# **assignRole**
```swift
    open class func assignRole(userUuid: String, roleUuid: String, completion: @escaping (_ data: Role?, _ error: Error?) -> Void)
```

Assign Role

ユーザーにロールを割り当てます。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 
let roleUuid = "roleUuid_example" // String | ロールのUUID

// Assign Role
AuthUsersAPI.assignRole(userUuid: userUuid, roleUuid: roleUuid) { (response, error) in
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
 **roleUuid** | **String** | ロールのUUID | 

### Return type

[**Role**](Role.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createAPIToken**
```swift
    open class func createAPIToken(userUuid: String, createUserAPITokenRequest: CreateUserAPITokenRequest? = nil, completion: @escaping (_ data: UserAPIToken?, _ error: Error?) -> Void)
```

Create API Token

ユーザーのAPIトークンを作成します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 
let createUserAPITokenRequest = CreateUserAPITokenRequest(name: "name_example", expiredAt: Date()) // CreateUserAPITokenRequest |  (optional)

// Create API Token
AuthUsersAPI.createAPIToken(userUuid: userUuid, createUserAPITokenRequest: createUserAPITokenRequest) { (response, error) in
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
 **createUserAPITokenRequest** | [**CreateUserAPITokenRequest**](CreateUserAPITokenRequest.md) |  | [optional] 

### Return type

[**UserAPIToken**](UserAPIToken.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createEmail**
```swift
    open class func createEmail(userUuid: String, createEmailRequest: CreateEmailRequest? = nil, completion: @escaping (_ data: UserEmail?, _ error: Error?) -> Void)
```

Create Email

ユーザーのメールアドレスを設定します。 メールアドレスの設定が成功すると、確認用URLを含むメールがそのアドレスに送信されます。 確認用URLには、メールアドレス確認用トークンとメールアドレスのIDが含まれます。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 
let createEmailRequest = CreateEmailRequest(address: "address_example") // CreateEmailRequest |  (optional)

// Create Email
AuthUsersAPI.createEmail(userUuid: userUuid, createEmailRequest: createEmailRequest) { (response, error) in
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
 **createEmailRequest** | [**CreateEmailRequest**](CreateEmailRequest.md) |  | [optional] 

### Return type

[**UserEmail**](UserEmail.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createTemporaryPassword**
```swift
    open class func createTemporaryPassword(userUuid: String, completion: @escaping (_ data: UserPassword?, _ error: Error?) -> Void)
```

Create Temporary Password

ユーザーのパスワードを、ランダムな一時パスワードに変更します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 

// Create Temporary Password
AuthUsersAPI.createTemporaryPassword(userUuid: userUuid) { (response, error) in
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

[**UserPassword**](UserPassword.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createUser**
```swift
    open class func createUser(createUserRequest: CreateUserRequest? = nil, completion: @escaping (_ data: User?, _ error: Error?) -> Void)
```

Create User

ユーザーを作成します。新しいユーザーには自動生成された一時パスワードが設定されます。 ユーザー作成のリクエストにメールアドレス（ `email` ）が含まれていた場合は、 そのメールアドレスに確認メールが送信されます。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let createUserRequest = CreateUserRequest(name: "name_example", nickname: "nickname_example", description: "description_example", roleUuids: ["roleUuids_example"], email: "email_example") // CreateUserRequest |  (optional)

// Create User
AuthUsersAPI.createUser(createUserRequest: createUserRequest) { (response, error) in
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
 **createUserRequest** | [**CreateUserRequest**](CreateUserRequest.md) |  | [optional] 

### Return type

[**User**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteAPIToken**
```swift
    open class func deleteAPIToken(userUuid: String, userApiTokenId: Int64, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete API Token

ユーザーのAPIトークンを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 
let userApiTokenId = 987 // Int64 | APIトークンのID

// Delete API Token
AuthUsersAPI.deleteAPIToken(userUuid: userUuid, userApiTokenId: userApiTokenId) { (response, error) in
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
 **userApiTokenId** | **Int64** | APIトークンのID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteEmail**
```swift
    open class func deleteEmail(userUuid: String, userEmailId: Int64, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Email

ユーザーのメールアドレスを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 
let userEmailId = 987 // Int64 | ユーザーのメールアドレスのID

// Delete Email
AuthUsersAPI.deleteEmail(userUuid: userUuid, userEmailId: userEmailId) { (response, error) in
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
 **userEmailId** | **Int64** | ユーザーのメールアドレスのID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteUser**
```swift
    open class func deleteUser(userUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete User

ユーザーを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 

// Delete User
AuthUsersAPI.deleteUser(userUuid: userUuid) { (response, error) in
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

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **disableUser**
```swift
    open class func disableUser(userUuid: String, completion: @escaping (_ data: User?, _ error: Error?) -> Void)
```

Disable User

ユーザーを無効化します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 

// Disable User
AuthUsersAPI.disableUser(userUuid: userUuid) { (response, error) in
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

[**User**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **enableUser**
```swift
    open class func enableUser(userUuid: String, completion: @escaping (_ data: User?, _ error: Error?) -> Void)
```

Enable User

ユーザーを有効化します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 

// Enable User
AuthUsersAPI.enableUser(userUuid: userUuid) { (response, error) in
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

[**User**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUser**
```swift
    open class func getUser(userUuid: String, completion: @escaping (_ data: User?, _ error: Error?) -> Void)
```

Get User

ユーザーを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 

// Get User
AuthUsersAPI.getUser(userUuid: userUuid) { (response, error) in
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

[**User**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **introspectAPIToken**
```swift
    open class func introspectAPIToken(aPITokenIntrospectionRequest: APITokenIntrospectionRequest? = nil, completion: @escaping (_ data: APITokenIntrospectionResponse?, _ error: Error?) -> Void)
```

Introspect API Token

APIトークンの検証を行います。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let aPITokenIntrospectionRequest = APITokenIntrospectionRequest(token: "token_example") // APITokenIntrospectionRequest |  (optional)

// Introspect API Token
AuthUsersAPI.introspectAPIToken(aPITokenIntrospectionRequest: aPITokenIntrospectionRequest) { (response, error) in
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
 **aPITokenIntrospectionRequest** | [**APITokenIntrospectionRequest**](APITokenIntrospectionRequest.md) |  | [optional] 

### Return type

[**APITokenIntrospectionResponse**](APITokenIntrospectionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listAPITokens**
```swift
    open class func listAPITokens(userUuid: String, completion: @escaping (_ data: UserAPITokens?, _ error: Error?) -> Void)
```

List API Tokens

ユーザーのAPIトークンのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 

// List API Tokens
AuthUsersAPI.listAPITokens(userUuid: userUuid) { (response, error) in
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

[**UserAPITokens**](UserAPITokens.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listUsers**
```swift
    open class func listUsers(uuid: [String]? = nil, roleUuid: [String]? = nil, name: [String]? = nil, nickname: [String]? = nil, email: [String]? = nil, disabled: Bool? = nil, isSuper: Bool? = nil, isTemporary: Bool? = nil, minSignInAttemptCount: Int? = nil, maxSignInAttemptCount: Int? = nil, sort: String? = nil, page: Int? = nil, perPage: Int? = nil, completion: @escaping (_ data: Users?, _ error: Error?) -> Void)
```

List Users

ユーザーのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let uuid = ["inner_example"] // [String] | ユーザーのUUID (optional)
let roleUuid = ["inner_example"] // [String] | ロールのUUID (optional)
let name = ["inner_example"] // [String] | ユーザーの名前による部分一致検索。文字列をダブルクォーテーションで囲むと、完全一致のものだけを取得します。 (optional)
let nickname = ["inner_example"] // [String] | ユーザーの表示名による部分一致検索。文字列をダブルクォーテーションで囲むと、完全一致のものだけを取得します。 (optional)
let email = ["inner_example"] // [String] | メールアドレスによる部分一致検索。文字列をダブルクォーテーションで囲むと、完全一致のものだけを取得します。 (optional)
let disabled = false // Bool | * `true` を指定した場合、無効化されているユーザーのみを取得します。 * `false` を指定した場合、有効なユーザーのみを取得します。 * 指定を省略した場合、有効／無効にかかわらずユーザーを取得します。 (optional)
let isSuper = false // Bool | * `true` を指定した場合、スーパーユーザーのみを取得します。 * `false` を指定した場合、スーパーユーザー以外を取得します。 * 指定を省略した場合、スーパーユーザーであるかにかかわらずユーザーを取得します。 (optional)
let isTemporary = false // Bool | * `true` を指定した場合、一時パスワードを使用しているユーザーのみを取得します。 * `false` を指定した場合、パスワードを設定済みのユーザーのみを取得します。 * 指定を省略した場合、一時パスワードを使用しているかにかかわらずユーザーを取得します。 (optional)
let minSignInAttemptCount = 987 // Int | ログイン失敗回数の最小値。ログイン失敗回数がこの数値以上のユーザーを取得します。 (optional)
let maxSignInAttemptCount = 987 // Int | ログイン失敗回数の最大値。ログイン失敗回数がこの数値以下のユーザーを取得します。 (optional)
let sort = "sort_example" // String | 並べ替えに使用するキー。接尾辞 `+` を付けた場合は昇順、 `-` を付けた場合は降順で出力されます。 接尾辞を省略した場合は昇順となります。 例えば、 `name-` を指定すると、nameによる降順で出力されます。   - name   - created_at   - updated_at   - last_sign_in_at (optional) (default to "name+")
let page = 987 // Int | 取得するページの番号 (optional) (default to 1)
let perPage = 987 // Int | 1回のリクエストで取得する件数 (optional) (default to 30)

// List Users
AuthUsersAPI.listUsers(uuid: uuid, roleUuid: roleUuid, name: name, nickname: nickname, email: email, disabled: disabled, isSuper: isSuper, isTemporary: isTemporary, minSignInAttemptCount: minSignInAttemptCount, maxSignInAttemptCount: maxSignInAttemptCount, sort: sort, page: page, perPage: perPage) { (response, error) in
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
 **uuid** | [**[String]**](String.md) | ユーザーのUUID | [optional] 
 **roleUuid** | [**[String]**](String.md) | ロールのUUID | [optional] 
 **name** | [**[String]**](String.md) | ユーザーの名前による部分一致検索。文字列をダブルクォーテーションで囲むと、完全一致のものだけを取得します。 | [optional] 
 **nickname** | [**[String]**](String.md) | ユーザーの表示名による部分一致検索。文字列をダブルクォーテーションで囲むと、完全一致のものだけを取得します。 | [optional] 
 **email** | [**[String]**](String.md) | メールアドレスによる部分一致検索。文字列をダブルクォーテーションで囲むと、完全一致のものだけを取得します。 | [optional] 
 **disabled** | **Bool** | * &#x60;true&#x60; を指定した場合、無効化されているユーザーのみを取得します。 * &#x60;false&#x60; を指定した場合、有効なユーザーのみを取得します。 * 指定を省略した場合、有効／無効にかかわらずユーザーを取得します。 | [optional] 
 **isSuper** | **Bool** | * &#x60;true&#x60; を指定した場合、スーパーユーザーのみを取得します。 * &#x60;false&#x60; を指定した場合、スーパーユーザー以外を取得します。 * 指定を省略した場合、スーパーユーザーであるかにかかわらずユーザーを取得します。 | [optional] 
 **isTemporary** | **Bool** | * &#x60;true&#x60; を指定した場合、一時パスワードを使用しているユーザーのみを取得します。 * &#x60;false&#x60; を指定した場合、パスワードを設定済みのユーザーのみを取得します。 * 指定を省略した場合、一時パスワードを使用しているかにかかわらずユーザーを取得します。 | [optional] 
 **minSignInAttemptCount** | **Int** | ログイン失敗回数の最小値。ログイン失敗回数がこの数値以上のユーザーを取得します。 | [optional] 
 **maxSignInAttemptCount** | **Int** | ログイン失敗回数の最大値。ログイン失敗回数がこの数値以下のユーザーを取得します。 | [optional] 
 **sort** | **String** | 並べ替えに使用するキー。接尾辞 &#x60;+&#x60; を付けた場合は昇順、 &#x60;-&#x60; を付けた場合は降順で出力されます。 接尾辞を省略した場合は昇順となります。 例えば、 &#x60;name-&#x60; を指定すると、nameによる降順で出力されます。   - name   - created_at   - updated_at   - last_sign_in_at | [optional] [default to &quot;name+&quot;]
 **page** | **Int** | 取得するページの番号 | [optional] [default to 1]
 **perPage** | **Int** | 1回のリクエストで取得する件数 | [optional] [default to 30]

### Return type

[**Users**](Users.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listUsersRoles**
```swift
    open class func listUsersRoles(userUuid: String, completion: @escaping (_ data: Roles?, _ error: Error?) -> Void)
```

List User's Roles

ユーザーのロールのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 

// List User's Roles
AuthUsersAPI.listUsersRoles(userUuid: userUuid) { (response, error) in
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

[**Roles**](Roles.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendVerificationEmail**
```swift
    open class func sendVerificationEmail(userUuid: String, userEmailId: Int64, completion: @escaping (_ data: UserEmailVerification?, _ error: Error?) -> Void)
```

Send Verification Email

メールアドレスを確認するため確認メールを送信します。メールアドレス確認用トークンを使用します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 
let userEmailId = 987 // Int64 | ユーザーのメールアドレスのID

// Send Verification Email
AuthUsersAPI.sendVerificationEmail(userUuid: userUuid, userEmailId: userEmailId) { (response, error) in
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
 **userEmailId** | **Int64** | ユーザーのメールアドレスのID | 

### Return type

[**UserEmailVerification**](UserEmailVerification.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **unassignRole**
```swift
    open class func unassignRole(userUuid: String, roleUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Unassign Role

ユーザーへのロールの割り当てを解除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 
let roleUuid = "roleUuid_example" // String | ロールのUUID

// Unassign Role
AuthUsersAPI.unassignRole(userUuid: userUuid, roleUuid: roleUuid) { (response, error) in
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
 **roleUuid** | **String** | ロールのUUID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **unlockPassword**
```swift
    open class func unlockPassword(userUuid: String, completion: @escaping (_ data: UserPassword?, _ error: Error?) -> Void)
```

Unlock Password

ユーザーのパスワードのロックを解除します。このユーザーのログイン失敗回数は0にリセットされます。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 

// Unlock Password
AuthUsersAPI.unlockPassword(userUuid: userUuid) { (response, error) in
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

[**UserPassword**](UserPassword.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateAPIToken**
```swift
    open class func updateAPIToken(userUuid: String, userApiTokenId: Int64, updateUserAPITokenRequest: UpdateUserAPITokenRequest? = nil, completion: @escaping (_ data: UserAPIToken?, _ error: Error?) -> Void)
```

Update API Token

ユーザーのAPIトークンを更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 
let userApiTokenId = 987 // Int64 | APIトークンのID
let updateUserAPITokenRequest = UpdateUserAPITokenRequest(name: "name_example") // UpdateUserAPITokenRequest |  (optional)

// Update API Token
AuthUsersAPI.updateAPIToken(userUuid: userUuid, userApiTokenId: userApiTokenId, updateUserAPITokenRequest: updateUserAPITokenRequest) { (response, error) in
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
 **userApiTokenId** | **Int64** | APIトークンのID | 
 **updateUserAPITokenRequest** | [**UpdateUserAPITokenRequest**](UpdateUserAPITokenRequest.md) |  | [optional] 

### Return type

[**UserAPIToken**](UserAPIToken.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateEmail**
```swift
    open class func updateEmail(userUuid: String, userEmailId: Int64, patchEmailRequest: PatchEmailRequest? = nil, completion: @escaping (_ data: UserEmail?, _ error: Error?) -> Void)
```

Update Email

ユーザーのメールアドレスを更新します。 メールアドレスの設定が成功すると、確認用URLを含むメールがそのアドレスに送信されます。 確認用URLには、メールアドレス確認用トークンとメールアドレスのIDが含まれます。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 
let userEmailId = 987 // Int64 | ユーザーのメールアドレスのID
let patchEmailRequest = PatchEmailRequest(address: "address_example") // PatchEmailRequest |  (optional)

// Update Email
AuthUsersAPI.updateEmail(userUuid: userUuid, userEmailId: userEmailId, patchEmailRequest: patchEmailRequest) { (response, error) in
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
 **userEmailId** | **Int64** | ユーザーのメールアドレスのID | 
 **patchEmailRequest** | [**PatchEmailRequest**](PatchEmailRequest.md) |  | [optional] 

### Return type

[**UserEmail**](UserEmail.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateToVerified**
```swift
    open class func updateToVerified(userUuid: String, userEmailId: Int64, updateEmailVerifiedRequest: UpdateEmailVerifiedRequest? = nil, completion: @escaping (_ data: UserEmail?, _ error: Error?) -> Void)
```

Set Email as Verified

ユーザーのメールアドレスを確認済みにします。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 
let userEmailId = 987 // Int64 | ユーザーのメールアドレスのID
let updateEmailVerifiedRequest = UpdateEmailVerifiedRequest(verificationToken: "verificationToken_example") // UpdateEmailVerifiedRequest |  (optional)

// Set Email as Verified
AuthUsersAPI.updateToVerified(userUuid: userUuid, userEmailId: userEmailId, updateEmailVerifiedRequest: updateEmailVerifiedRequest) { (response, error) in
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
 **userEmailId** | **Int64** | ユーザーのメールアドレスのID | 
 **updateEmailVerifiedRequest** | [**UpdateEmailVerifiedRequest**](UpdateEmailVerifiedRequest.md) |  | [optional] 

### Return type

[**UserEmail**](UserEmail.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateUser**
```swift
    open class func updateUser(userUuid: String, patchUserRequest: PatchUserRequest? = nil, completion: @escaping (_ data: User?, _ error: Error?) -> Void)
```

Update User

ユーザーを更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userUuid = "userUuid_example" // String | 
let patchUserRequest = PatchUserRequest(name: "name_example", nickname: "nickname_example", description: "description_example") // PatchUserRequest |  (optional)

// Update User
AuthUsersAPI.updateUser(userUuid: userUuid, patchUserRequest: patchUserRequest) { (response, error) in
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
 **patchUserRequest** | [**PatchUserRequest**](PatchUserRequest.md) |  | [optional] 

### Return type

[**User**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

