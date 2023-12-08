# BrokerISCPAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**connectISCPV1**](BrokerISCPAPI.md#connectiscpv1) | **GET** /v1/ws/measurements | Connect ISCPv1
[**connectISCPV2**](BrokerISCPAPI.md#connectiscpv2) | **GET** /iscp/connect | Connect ISCPv2
[**connectProjectISCPV1**](BrokerISCPAPI.md#connectprojectiscpv1) | **GET** /v1/projects/{project_uuid}/ws/measurements | Connect Project ISCPv1
[**issueISCPTicket**](BrokerISCPAPI.md#issueiscpticket) | **POST** /iscp/tickets | Issue ISCP Ticket


# **connectISCPV1**
```swift
    open class func connectISCPV1(completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Connect ISCPv1

iSCP v1（WebSocket上でリアルタイムデータを送受信するintdash独自プロトコル）の使用を開始するためのエンドポイントです。  このリクエストを送ることで、プロトコルがWebSocketに切り替えられ、iSCP v1を使用できます。 \"permessage-deflate\" (RFC 7692) が使用できます。  iSCP v1の詳細については、別ドキュメント [詳説iSCP 1.0](https://docs.intdash.jp/manual/iscp1-essentials/latest/ja/iscp1-essentials-ja.pdf) を参照してください。  「詳説iSCP 1.0」に記載されいていない事項ついては、 [アプトポッド](https://www.aptpod.co.jp/contact/) にお問い合わせください。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash


// Connect ISCPv1
BrokerISCPAPI.connectISCPV1() { (response, error) in
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

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **connectISCPV2**
```swift
    open class func connectISCPV2(completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Connect ISCPv2

iSCP v2（WebSocket上でリアルタイムデータを送受信するintdash独自プロトコル）の使用を開始するためのエンドポイントです。 このリクエストを送ることで、プロトコルがWebSocketに切り替えられ、iSCP v2を使用できます。  iSCP v2の詳細については、 [アプトポッド](https://www.aptpod.co.jp/contact/) にお問い合わせください。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash


// Connect ISCPv2
BrokerISCPAPI.connectISCPV2() { (response, error) in
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

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **connectProjectISCPV1**
```swift
    open class func connectProjectISCPV1(projectUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Connect Project ISCPv1

iSCP v1（WebSocket上でリアルタイムデータを送受信するintdash独自プロトコル）の使用を開始するためのエンドポイントです。  このリクエストを送ることで、プロトコルがWebSocketに切り替えられ、iSCP v1を使用できます。 \"permessage-deflate\" (RFC 7692) が使用できます。  iSCP v1の詳細については、別ドキュメント [詳説iSCP 1.0](https://docs.intdash.jp/manual/iscp1-essentials/latest/ja/iscp1-essentials-ja.pdf) を参照してください。  「詳説iSCP 1.0」に記載されいていない事項ついては、 [アプトポッド](https://www.aptpod.co.jp/contact/) にお問い合わせください。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID

// Connect Project ISCPv1
BrokerISCPAPI.connectProjectISCPV1(projectUuid: projectUuid) { (response, error) in
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
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **issueISCPTicket**
```swift
    open class func issueISCPTicket(completion: @escaping (_ data: ISCPTicket?, _ error: Error?) -> Void)
```

Issue ISCP Ticket

iSCPの認証チケットを発行します。  iSCPの認証チケットは、iSCPv2の接続リクエスト時の拡張用アクセストークンとして使用することができます。 また、認証チケットは有効期限内で一回のみ使用することができます。 一度使用した認証チケットは有効期限に関わらず使用することはできません。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash


// Issue ISCP Ticket
BrokerISCPAPI.issueISCPTicket() { (response, error) in
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

[**ISCPTicket**](ISCPTicket.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

