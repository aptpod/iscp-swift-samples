# AuthMeAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**changePassword**](AuthMeAPI.md#changepassword) | **PUT** /auth/users/me/password | Change Password
[**checkPassword**](AuthMeAPI.md#checkpassword) | **POST** /auth/users/me/password/check | Check Password
[**createMyAPIToken**](AuthMeAPI.md#createmyapitoken) | **POST** /auth/users/me/tokens | Create My API Token
[**createMyEmail**](AuthMeAPI.md#createmyemail) | **POST** /auth/users/me/emails | Create My Email
[**deleteMyAPIToken**](AuthMeAPI.md#deletemyapitoken) | **DELETE** /auth/users/me/tokens/{user_api_token_id} | Delete My API Token
[**deleteMyEmail**](AuthMeAPI.md#deletemyemail) | **DELETE** /auth/users/me/emails/{user_email_id} | Delete My Email
[**getMe**](AuthMeAPI.md#getme) | **GET** /auth/users/me | Get Me
[**listMyAPITokens**](AuthMeAPI.md#listmyapitokens) | **GET** /auth/users/me/tokens | List My API Tokens
[**listMyRoles**](AuthMeAPI.md#listmyroles) | **GET** /auth/users/me/roles | List My Roles
[**sendVerificationEmailToMyAddress**](AuthMeAPI.md#sendverificationemailtomyaddress) | **PUT** /auth/users/me/emails/{user_email_id}/verification | Send Verification Email to Me
[**updateMe**](AuthMeAPI.md#updateme) | **PATCH** /auth/users/me | Update Me
[**updateMyAPIToken**](AuthMeAPI.md#updatemyapitoken) | **PATCH** /auth/users/me/tokens/{user_api_token_id} | Update My API Token
[**updateMyAddressToVerified**](AuthMeAPI.md#updatemyaddresstoverified) | **PUT** /auth/users/me/emails/{user_email_id}/verified | Set My Email as Verified
[**updateMyEmail**](AuthMeAPI.md#updatemyemail) | **PATCH** /auth/users/me/emails/{user_email_id} | Update My Email


# **changePassword**
```swift
    open class func changePassword(changePasswordRequest: ChangePasswordRequest? = nil, completion: @escaping (_ data: UserPassword?, _ error: Error?) -> Void)
```

Change Password

パスワードを変更します。 現在のパスワード `old_password` または `recovery_token` が必要です。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let changePasswordRequest = ChangePasswordRequest(password: "password_example", oldPassword: "oldPassword_example", recoveryToken: "recoveryToken_example") // ChangePasswordRequest |  (optional)

// Change Password
AuthMeAPI.changePassword(changePasswordRequest: changePasswordRequest) { (response, error) in
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
 **changePasswordRequest** | [**ChangePasswordRequest**](ChangePasswordRequest.md) |  | [optional] 

### Return type

[**UserPassword**](UserPassword.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkPassword**
```swift
    open class func checkPassword(checkPasswordRequest: CheckPasswordRequest? = nil, completion: @escaping (_ data: CheckPasswordResult?, _ error: Error?) -> Void)
```

Check Password

パスワードがポリシーに適合しているかをチェックします。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let checkPasswordRequest = CheckPasswordRequest(password: "password_example") // CheckPasswordRequest |  (optional)

// Check Password
AuthMeAPI.checkPassword(checkPasswordRequest: checkPasswordRequest) { (response, error) in
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
 **checkPasswordRequest** | [**CheckPasswordRequest**](CheckPasswordRequest.md) |  | [optional] 

### Return type

[**CheckPasswordResult**](CheckPasswordResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createMyAPIToken**
```swift
    open class func createMyAPIToken(createUserAPITokenRequest: CreateUserAPITokenRequest? = nil, completion: @escaping (_ data: UserAPIToken?, _ error: Error?) -> Void)
```

Create My API Token

自分（ユーザー）のAPIトークンを作成します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let createUserAPITokenRequest = CreateUserAPITokenRequest(name: "name_example", expiredAt: Date()) // CreateUserAPITokenRequest |  (optional)

// Create My API Token
AuthMeAPI.createMyAPIToken(createUserAPITokenRequest: createUserAPITokenRequest) { (response, error) in
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
 **createUserAPITokenRequest** | [**CreateUserAPITokenRequest**](CreateUserAPITokenRequest.md) |  | [optional] 

### Return type

[**UserAPIToken**](UserAPIToken.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createMyEmail**
```swift
    open class func createMyEmail(createEmailRequest: CreateEmailRequest? = nil, completion: @escaping (_ data: UserEmail?, _ error: Error?) -> Void)
```

Create My Email

自分（ユーザー）のメールアドレスを設定します。 メールアドレスの設定が成功すると、確認用URLを含むメールがそのアドレスに送信されます。 確認用URLには、メールアドレス確認用トークンとメールアドレスのIDが含まれます。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let createEmailRequest = CreateEmailRequest(address: "address_example") // CreateEmailRequest |  (optional)

// Create My Email
AuthMeAPI.createMyEmail(createEmailRequest: createEmailRequest) { (response, error) in
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
 **createEmailRequest** | [**CreateEmailRequest**](CreateEmailRequest.md) |  | [optional] 

### Return type

[**UserEmail**](UserEmail.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteMyAPIToken**
```swift
    open class func deleteMyAPIToken(userApiTokenId: Int64, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete My API Token

自分（ユーザー）のAPIトークンを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userApiTokenId = 987 // Int64 | APIトークンのID

// Delete My API Token
AuthMeAPI.deleteMyAPIToken(userApiTokenId: userApiTokenId) { (response, error) in
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
 **userApiTokenId** | **Int64** | APIトークンのID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteMyEmail**
```swift
    open class func deleteMyEmail(userEmailId: Int64, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete My Email

自分（ユーザー）のメールアドレスを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userEmailId = 987 // Int64 | ユーザーのメールアドレスのID

// Delete My Email
AuthMeAPI.deleteMyEmail(userEmailId: userEmailId) { (response, error) in
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
 **userEmailId** | **Int64** | ユーザーのメールアドレスのID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMe**
```swift
    open class func getMe(completion: @escaping (_ data: User?, _ error: Error?) -> Void)
```

Get Me

自分（ユーザー）を取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash


// Get Me
AuthMeAPI.getMe() { (response, error) in
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

[**User**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMyAPITokens**
```swift
    open class func listMyAPITokens(completion: @escaping (_ data: UserAPITokens?, _ error: Error?) -> Void)
```

List My API Tokens

自分（ユーザー）のAPIトークンのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash


// List My API Tokens
AuthMeAPI.listMyAPITokens() { (response, error) in
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

[**UserAPITokens**](UserAPITokens.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMyRoles**
```swift
    open class func listMyRoles(completion: @escaping (_ data: Roles?, _ error: Error?) -> Void)
```

List My Roles

自分（ユーザー）に割り当てられたロールのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash


// List My Roles
AuthMeAPI.listMyRoles() { (response, error) in
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

[**Roles**](Roles.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendVerificationEmailToMyAddress**
```swift
    open class func sendVerificationEmailToMyAddress(userEmailId: Int64, completion: @escaping (_ data: UserEmailVerification?, _ error: Error?) -> Void)
```

Send Verification Email to Me

メールアドレスを確認するための確認メールを送信します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userEmailId = 987 // Int64 | ユーザーのメールアドレスのID

// Send Verification Email to Me
AuthMeAPI.sendVerificationEmailToMyAddress(userEmailId: userEmailId) { (response, error) in
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
 **userEmailId** | **Int64** | ユーザーのメールアドレスのID | 

### Return type

[**UserEmailVerification**](UserEmailVerification.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMe**
```swift
    open class func updateMe(patchUserRequest: PatchUserRequest? = nil, completion: @escaping (_ data: User?, _ error: Error?) -> Void)
```

Update Me

自分（ユーザー）を更新します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let patchUserRequest = PatchUserRequest(name: "name_example", nickname: "nickname_example", description: "description_example") // PatchUserRequest |  (optional)

// Update Me
AuthMeAPI.updateMe(patchUserRequest: patchUserRequest) { (response, error) in
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
 **patchUserRequest** | [**PatchUserRequest**](PatchUserRequest.md) |  | [optional] 

### Return type

[**User**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMyAPIToken**
```swift
    open class func updateMyAPIToken(userApiTokenId: Int64, updateUserAPITokenRequest: UpdateUserAPITokenRequest? = nil, completion: @escaping (_ data: UserAPIToken?, _ error: Error?) -> Void)
```

Update My API Token

自分（ユーザー）のAPIトークンを作成します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userApiTokenId = 987 // Int64 | APIトークンのID
let updateUserAPITokenRequest = UpdateUserAPITokenRequest(name: "name_example") // UpdateUserAPITokenRequest |  (optional)

// Update My API Token
AuthMeAPI.updateMyAPIToken(userApiTokenId: userApiTokenId, updateUserAPITokenRequest: updateUserAPITokenRequest) { (response, error) in
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

# **updateMyAddressToVerified**
```swift
    open class func updateMyAddressToVerified(userEmailId: Int64, updateEmailVerifiedRequest: UpdateEmailVerifiedRequest? = nil, completion: @escaping (_ data: UserEmail?, _ error: Error?) -> Void)
```

Set My Email as Verified

自分（ユーザー）のメールアドレスを確認済みにします。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userEmailId = 987 // Int64 | ユーザーのメールアドレスのID
let updateEmailVerifiedRequest = UpdateEmailVerifiedRequest(verificationToken: "verificationToken_example") // UpdateEmailVerifiedRequest |  (optional)

// Set My Email as Verified
AuthMeAPI.updateMyAddressToVerified(userEmailId: userEmailId, updateEmailVerifiedRequest: updateEmailVerifiedRequest) { (response, error) in
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

# **updateMyEmail**
```swift
    open class func updateMyEmail(userEmailId: Int64, patchEmailRequest: PatchEmailRequest? = nil, completion: @escaping (_ data: UserEmail?, _ error: Error?) -> Void)
```

Update My Email

自分（ユーザー）のメールアドレスを更新します。 メールアドレスの設定が成功すると、確認用URLを含むメールがそのアドレスに送信されます。 確認用URLには、メールアドレス確認用トークンとメールアドレスのIDが含まれます。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let userEmailId = 987 // Int64 | ユーザーのメールアドレスのID
let patchEmailRequest = PatchEmailRequest(address: "address_example") // PatchEmailRequest |  (optional)

// Update My Email
AuthMeAPI.updateMyEmail(userEmailId: userEmailId, patchEmailRequest: patchEmailRequest) { (response, error) in
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

