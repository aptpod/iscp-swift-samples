# MediaLiveAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**connectLive**](MediaLiveAPI.md#connectlive) | **GET** /media/ws/edges/{edge_uuid}/fmp4s/{channel} | Get realtime video stream
[**connectProjectLive**](MediaLiveAPI.md#connectprojectlive) | **GET** /media/projects/{project_uuid}/ws/edges/{edge_uuid}/fmp4s/{channel} | Get Project realtime video stream


# **connectLive**
```swift
    open class func connectLive(edgeUuid: String, channel: Int, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Get realtime video stream

**Deprecated** このエンドポイントの代わりに [`GET /v1/stream`](#operation/Stream) でデータを取得し、WebCodecsを使用して取得したデータをデコードしてください。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let edgeUuid = "edgeUuid_example" // String | エッジのUUID
let channel = 987 // Int | チャンネル

// Get realtime video stream
MediaLiveAPI.connectLive(edgeUuid: edgeUuid, channel: channel) { (response, error) in
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
 **channel** | **Int** | チャンネル | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **connectProjectLive**
```swift
    open class func connectProjectLive(projectUuid: String, edgeUuid: String, channel: Int, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Get Project realtime video stream

**Deprecated** このエンドポイントの代わりに [`GET /v1/stream`](#operation/Stream) でデータを取得し、WebCodecsを使用して取得したデータをデコードしてください。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let edgeUuid = "edgeUuid_example" // String | エッジのUUID
let channel = 987 // Int | チャンネル

// Get Project realtime video stream
MediaLiveAPI.connectProjectLive(projectUuid: projectUuid, edgeUuid: edgeUuid, channel: channel) { (response, error) in
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
 **edgeUuid** | **String** | エッジのUUID | 
 **channel** | **Int** | チャンネル | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

