# AuthAuthorizationAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**checkHTTPAuthorization**](AuthAuthorizationAPI.md#checkhttpauthorization) | **POST** /auth/authorize/http | Check HTTP Authorization
[**checkMeHTTPAuthorization**](AuthAuthorizationAPI.md#checkmehttpauthorization) | **POST** /auth/users/me/authorize/http | Check Me HTTP Authorization


# **checkHTTPAuthorization**
```swift
    open class func checkHTTPAuthorization(checkHTTPAuthorizationRequest: CheckHTTPAuthorizationRequest? = nil, completion: @escaping (_ data: CheckAuthorizationResponse?, _ error: Error?) -> Void)
```

Check HTTP Authorization

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let checkHTTPAuthorizationRequest = CheckHTTPAuthorizationRequest(subject: "subject_example", scopes: ["scopes_example"], path: "path_example", method: "method_example") // CheckHTTPAuthorizationRequest |  (optional)

// Check HTTP Authorization
AuthAuthorizationAPI.checkHTTPAuthorization(checkHTTPAuthorizationRequest: checkHTTPAuthorizationRequest) { (response, error) in
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
 **checkHTTPAuthorizationRequest** | [**CheckHTTPAuthorizationRequest**](CheckHTTPAuthorizationRequest.md) |  | [optional] 

### Return type

[**CheckAuthorizationResponse**](CheckAuthorizationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkMeHTTPAuthorization**
```swift
    open class func checkMeHTTPAuthorization(checkMeHTTPAuthorizationRequest: CheckMeHTTPAuthorizationRequest? = nil, completion: @escaping (_ data: CheckAuthorizationResponse?, _ error: Error?) -> Void)
```

Check Me HTTP Authorization

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let checkMeHTTPAuthorizationRequest = CheckMeHTTPAuthorizationRequest(path: "path_example", method: "method_example") // CheckMeHTTPAuthorizationRequest |  (optional)

// Check Me HTTP Authorization
AuthAuthorizationAPI.checkMeHTTPAuthorization(checkMeHTTPAuthorizationRequest: checkMeHTTPAuthorizationRequest) { (response, error) in
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
 **checkMeHTTPAuthorizationRequest** | [**CheckMeHTTPAuthorizationRequest**](CheckMeHTTPAuthorizationRequest.md) |  | [optional] 

### Return type

[**CheckAuthorizationResponse**](CheckAuthorizationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

