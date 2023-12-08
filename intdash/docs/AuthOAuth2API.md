# AuthOAuth2API

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authOauth2JwksGet**](AuthOAuth2API.md#authoauth2jwksget) | **GET** /auth/oauth2/jwks | List JSON Web Keys
[**issueToken**](AuthOAuth2API.md#issuetoken) | **POST** /auth/oauth2/token | Token Endpoint
[**oauth2Authorization**](AuthOAuth2API.md#oauth2authorization) | **GET** /auth/oauth2/authorization | Authorization Endpoint
[**reovokeToken**](AuthOAuth2API.md#reovoketoken) | **POST** /auth/oauth2/revocation | Revoke Token


# **authOauth2JwksGet**
```swift
    open class func authOauth2JwksGet(completion: @escaping (_ data: OAuth2JWKs?, _ error: Error?) -> Void)
```

List JSON Web Keys

JSON Web Keysのリストを取得します。 [RFC7517:JSON Web Key](https://tools.ietf.org/html/rfc7517)

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash


// List JSON Web Keys
AuthOAuth2API.authOauth2JwksGet() { (response, error) in
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

[**OAuth2JWKs**](OAuth2JWKs.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/jwk-set+json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **issueToken**
```swift
    open class func issueToken(grantType: GrantType_issueToken? = nil, refreshToken: String? = nil, tenantUuid: String? = nil, username: String? = nil, password: String? = nil, clientId: String? = nil, clientSecret: String? = nil, clientCertification: String? = nil, redirectUri: String? = nil, codeVerifier: String? = nil, code: String? = nil, completion: @escaping (_ data: InlineResponse200?, _ error: Error?) -> Void)
```

Token Endpoint

OAuth2のアクセストークンを取得します。 [RFC6749:The OAuth 2.0 Authorization Framework](https://tools.ietf.org/html/rfc6749)

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let grantType = "grantType_example" // String | グラントタイプ (optional)
let refreshToken = "refreshToken_example" // String | 認可時に発行されたリフレッシュトークン。grant_typeが `refresh_token` の場合にだけ指定します。 (optional)
let tenantUuid = "tenantUuid_example" // String | テナントのUUID。grant_typeが `password` の場合にだけ指定します。 grant_typeが `password` で、テナントUUIDを省略した場合は、デフォルトのテナントが使用されます。 (optional) (default to "00000000-0000-0000-0000-000000000000")
let username = "username_example" // String | ユーザーの名前。grant_typeが `password` の場合にだけ指定します。 (optional)
let password = "password_example" // String | パスワード。grant_typeが `password` の場合にだけ指定します。 (optional)
let clientId = "clientId_example" // String | OAuth2クライアントのID (optional)
let clientSecret = "clientSecret_example" // String | OAuth2のクライアントシークレット。 OAuth2クライアントの `token_endpoint_auth_method` が `client_secret_post` の場合にだけ指定します。 (optional)
let clientCertification = "clientCertification_example" // String | OAuth2のクライアント証明書。 OAuth2クライアントの `token_endpoint_auth_method` が `tls_client_auth` の場合にだけ指定します。 (optional)
let redirectUri = "redirectUri_example" // String | 認可後のリダイレクト先URI。 grant_typeが `authorization_code` の場合にだけ必要です。 (optional)
let codeVerifier = "codeVerifier_example" // String | PKCE code verifier.  * 使用可能な文字:  `[a-Z] / [0-9] / \\\"-\\\" / \\\".\\\" / \\\"_\\\" / \\\"~\\\"`  * 長さ: 43文字以上、128文字以下 (optional)
let code = "code_example" // String | 認可コード (optional)

// Token Endpoint
AuthOAuth2API.issueToken(grantType: grantType, refreshToken: refreshToken, tenantUuid: tenantUuid, username: username, password: password, clientId: clientId, clientSecret: clientSecret, clientCertification: clientCertification, redirectUri: redirectUri, codeVerifier: codeVerifier, code: code) { (response, error) in
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
 **grantType** | **String** | グラントタイプ | [optional] 
 **refreshToken** | **String** | 認可時に発行されたリフレッシュトークン。grant_typeが &#x60;refresh_token&#x60; の場合にだけ指定します。 | [optional] 
 **tenantUuid** | **String** | テナントのUUID。grant_typeが &#x60;password&#x60; の場合にだけ指定します。 grant_typeが &#x60;password&#x60; で、テナントUUIDを省略した場合は、デフォルトのテナントが使用されます。 | [optional] [default to &quot;00000000-0000-0000-0000-000000000000&quot;]
 **username** | **String** | ユーザーの名前。grant_typeが &#x60;password&#x60; の場合にだけ指定します。 | [optional] 
 **password** | **String** | パスワード。grant_typeが &#x60;password&#x60; の場合にだけ指定します。 | [optional] 
 **clientId** | **String** | OAuth2クライアントのID | [optional] 
 **clientSecret** | **String** | OAuth2のクライアントシークレット。 OAuth2クライアントの &#x60;token_endpoint_auth_method&#x60; が &#x60;client_secret_post&#x60; の場合にだけ指定します。 | [optional] 
 **clientCertification** | **String** | OAuth2のクライアント証明書。 OAuth2クライアントの &#x60;token_endpoint_auth_method&#x60; が &#x60;tls_client_auth&#x60; の場合にだけ指定します。 | [optional] 
 **redirectUri** | **String** | 認可後のリダイレクト先URI。 grant_typeが &#x60;authorization_code&#x60; の場合にだけ必要です。 | [optional] 
 **codeVerifier** | **String** | PKCE code verifier.  * 使用可能な文字:  &#x60;[a-Z] / [0-9] / \\\&quot;-\\\&quot; / \\\&quot;.\\\&quot; / \\\&quot;_\\\&quot; / \\\&quot;~\\\&quot;&#x60;  * 長さ: 43文字以上、128文字以下 | [optional] 
 **code** | **String** | 認可コード | [optional] 

### Return type

[**InlineResponse200**](InlineResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **oauth2Authorization**
```swift
    open class func oauth2Authorization(clientId: String, responseType: ResponseType_oauth2Authorization, redirectUri: String, state: String, codeChallenge: String? = nil, codeChallengeMethod: CodeChallengeMethod_oauth2Authorization? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Authorization Endpoint

OAuth2認可エンドポイント。 [RFC6749:The OAuth 2.0 Authorization Framework](https://tools.ietf.org/html/rfc6749)

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let clientId = "clientId_example" // String | OAuth2クライアントID
let responseType = "responseType_example" // String | OAuth2のresponse_type。 `code` のみサポートされています。
let redirectUri = "redirectUri_example" // String | 認可後のリダイレクト先URI
let state = "state_example" // String | CSRF対策のためのstate
let codeChallenge = "codeChallenge_example" // String | PKCEコードチャレンジ。 `code_verifier` から計算したSHA-256ハッシュを、Base64 URLエンコードしたもの。 (optional)
let codeChallengeMethod = "codeChallengeMethod_example" // String | PKCEコードチャレンジの方式。 `S256` （SHA-256）のみサポートされます。 (optional)

// Authorization Endpoint
AuthOAuth2API.oauth2Authorization(clientId: clientId, responseType: responseType, redirectUri: redirectUri, state: state, codeChallenge: codeChallenge, codeChallengeMethod: codeChallengeMethod) { (response, error) in
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
 **responseType** | **String** | OAuth2のresponse_type。 &#x60;code&#x60; のみサポートされています。 | 
 **redirectUri** | **String** | 認可後のリダイレクト先URI | 
 **state** | **String** | CSRF対策のためのstate | 
 **codeChallenge** | **String** | PKCEコードチャレンジ。 &#x60;code_verifier&#x60; から計算したSHA-256ハッシュを、Base64 URLエンコードしたもの。 | [optional] 
 **codeChallengeMethod** | **String** | PKCEコードチャレンジの方式。 &#x60;S256&#x60; （SHA-256）のみサポートされます。 | [optional] 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reovokeToken**
```swift
    open class func reovokeToken(clientId: String, tokenTypeHint: TokenTypeHint_reovokeToken? = nil, token: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Revoke Token

トークンを無効化します。 このエンドポイントをコールしてからトークンが無効化されるまで、通常数秒程度かかります。 [RFC7009:OAuth 2.0 Token Revocation](https://tools.ietf.org/html/rfc7009)

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let clientId = "clientId_example" // String | OAuth2クライアントID
let tokenTypeHint = "tokenTypeHint_example" // String | OAuth2トークンタイプについてのヒント (optional) (default to .refreshToken)
let token = "token_example" // String | 無効化したいリフレッシュトークンまたはアクセストークン。 指定を省略した場合、サーバーは、cookieの `_bearer_token` に指定されたアクセストークン、または、Authorizationヘッダーに指定されたアクセストークン（ `Bearer` トークン）を無効化します。 (optional)

// Revoke Token
AuthOAuth2API.reovokeToken(clientId: clientId, tokenTypeHint: tokenTypeHint, token: token) { (response, error) in
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
 **tokenTypeHint** | **String** | OAuth2トークンタイプについてのヒント | [optional] [default to .refreshToken]
 **token** | **String** | 無効化したいリフレッシュトークンまたはアクセストークン。 指定を省略した場合、サーバーは、cookieの &#x60;_bearer_token&#x60; に指定されたアクセストークン、または、Authorizationヘッダーに指定されたアクセストークン（ &#x60;Bearer&#x60; トークン）を無効化します。 | [optional] 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

