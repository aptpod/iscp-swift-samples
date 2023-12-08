# MediaHLSAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getFMP4**](MediaHLSAPI.md#getfmp4) | **GET** /media/measurements/{meas_uuid}/channels/{channel}/mp4s/measurement.mp4 | Get HLS as FMP4
[**getHLSes**](MediaHLSAPI.md#gethlses) | **GET** /media/hlses | List HLSes
[**getPlaylist**](MediaHLSAPI.md#getplaylist) | **GET** /media/measurements/{meas_uuid}/channels/{channel}/hlses/playlist.m3u8 | Get HLS Playlist
[**getProjectFMP4**](MediaHLSAPI.md#getprojectfmp4) | **GET** /media/projects/{project_uuid}/measurements/{meas_uuid}/channels/{channel}/mp4s/measurement.mp4 | Get Project HLS as FMP4
[**getProjectHLSes**](MediaHLSAPI.md#getprojecthlses) | **GET** /media/projects/{project_uuid}/hlses | List Project HLSes
[**getProjectPlaylist**](MediaHLSAPI.md#getprojectplaylist) | **GET** /media/projects/{project_uuid}/measurements/{meas_uuid}/channels/{channel}/hlses/playlist.m3u8 | Get Project HLS Playlist


# **getFMP4**
```swift
    open class func getFMP4(measUuid: String, channel: Int, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get HLS as FMP4

**Deprecated** このエンドポイントの代わりに [`POST /media/videos/{video_uuid}/mp4s`](#operation/createMP4) を使用してください。 mp4リソース作成後、 `MP4`オブジェクトの `file_path`にあるPATHに従って動画を取得してください

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measUuid = "measUuid_example" // String | 計測のUUID
let channel = 987 // Int | チャンネル

// Get HLS as FMP4
MediaHLSAPI.getFMP4(measUuid: measUuid, channel: channel) { (response, error) in
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
 **measUuid** | **String** | 計測のUUID | 
 **channel** | **Int** | チャンネル | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: video/mp4

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getHLSes**
```swift
    open class func getHLSes(start: Int? = nil, end: Int? = nil, edgeUuid: String? = nil, channel: Int? = nil, limit: Int? = nil, completion: @escaping (_ data: HLSList?, _ error: Error?) -> Void)
```

List HLSes

**Deprecated** このエンドポイントではなく [`GET /media/videos`](#operation/getVideos) を使用してください

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let start = 987 // Int | 取得対象範囲の始点（マイクロ秒単位のUNIX時刻） (optional)
let end = 987 // Int | 取得対象範囲の終点（マイクロ秒単位のUNIX時刻） (optional)
let edgeUuid = "edgeUuid_example" // String | エッジのUUID (optional)
let channel = 987 // Int | チャンネル (optional)
let limit = 987 // Int | 1回のリクエストで取得する件数 (optional)

// List HLSes
MediaHLSAPI.getHLSes(start: start, end: end, edgeUuid: edgeUuid, channel: channel, limit: limit) { (response, error) in
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
 **start** | **Int** | 取得対象範囲の始点（マイクロ秒単位のUNIX時刻） | [optional] 
 **end** | **Int** | 取得対象範囲の終点（マイクロ秒単位のUNIX時刻） | [optional] 
 **edgeUuid** | **String** | エッジのUUID | [optional] 
 **channel** | **Int** | チャンネル | [optional] 
 **limit** | **Int** | 1回のリクエストで取得する件数 | [optional] 

### Return type

[**HLSList**](HLSList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPlaylist**
```swift
    open class func getPlaylist(measUuid: String, channel: Int, forceEnd: Bool? = nil, completion: @escaping (_ data: String?, _ error: Error?) -> Void)
```

Get HLS Playlist

**Depricated** このエンドポイントの代わりに、Videoオブジェクトの `hls`にあるPATHにしたがってPlaylistを取得してください。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let measUuid = "measUuid_example" // String | 計測のUUID
let channel = 987 // Int | チャンネル
let forceEnd = true // Bool | `true` にすると、取得するm3u8形式のプレイリストに強制的にEXT-X-ENDLISTを追加します。 (optional)

// Get HLS Playlist
MediaHLSAPI.getPlaylist(measUuid: measUuid, channel: channel, forceEnd: forceEnd) { (response, error) in
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
 **measUuid** | **String** | 計測のUUID | 
 **channel** | **Int** | チャンネル | 
 **forceEnd** | **Bool** | &#x60;true&#x60; にすると、取得するm3u8形式のプレイリストに強制的にEXT-X-ENDLISTを追加します。 | [optional] 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/vnd.apple.mpegurl

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectFMP4**
```swift
    open class func getProjectFMP4(projectUuid: String, measUuid: String, channel: Int, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get Project HLS as FMP4

**Deprecated** このエンドポイントの代わりに [`POST /media/videos/{video_uuid}/mp4s`](#operation/createMP4) を使用してください。 mp4リソース作成後、 `MP4`オブジェクトの `file_path`にあるPATHに従って動画を取得してください

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measUuid = "measUuid_example" // String | 計測のUUID
let channel = 987 // Int | チャンネル

// Get Project HLS as FMP4
MediaHLSAPI.getProjectFMP4(projectUuid: projectUuid, measUuid: measUuid, channel: channel) { (response, error) in
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
 **measUuid** | **String** | 計測のUUID | 
 **channel** | **Int** | チャンネル | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: video/mp4

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectHLSes**
```swift
    open class func getProjectHLSes(projectUuid: String, start: Int? = nil, end: Int? = nil, edgeUuid: String? = nil, channel: Int? = nil, limit: Int? = nil, completion: @escaping (_ data: HLSList?, _ error: Error?) -> Void)
```

List Project HLSes

**Deprecated** このエンドポイントではなく [`GET /media/videos`](#operation/getVideos) を使用してください

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let start = 987 // Int | 取得対象範囲の始点（マイクロ秒単位のUNIX時刻） (optional)
let end = 987 // Int | 取得対象範囲の終点（マイクロ秒単位のUNIX時刻） (optional)
let edgeUuid = "edgeUuid_example" // String | エッジのUUID (optional)
let channel = 987 // Int | チャンネル (optional)
let limit = 987 // Int | 1回のリクエストで取得する件数 (optional)

// List Project HLSes
MediaHLSAPI.getProjectHLSes(projectUuid: projectUuid, start: start, end: end, edgeUuid: edgeUuid, channel: channel, limit: limit) { (response, error) in
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
 **start** | **Int** | 取得対象範囲の始点（マイクロ秒単位のUNIX時刻） | [optional] 
 **end** | **Int** | 取得対象範囲の終点（マイクロ秒単位のUNIX時刻） | [optional] 
 **edgeUuid** | **String** | エッジのUUID | [optional] 
 **channel** | **Int** | チャンネル | [optional] 
 **limit** | **Int** | 1回のリクエストで取得する件数 | [optional] 

### Return type

[**HLSList**](HLSList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectPlaylist**
```swift
    open class func getProjectPlaylist(projectUuid: String, measUuid: String, channel: Int, forceEnd: Bool? = nil, completion: @escaping (_ data: String?, _ error: Error?) -> Void)
```

Get Project HLS Playlist

**Depricated** このエンドポイントの代わりに、Videoオブジェクトの `hls`にあるPATHにしたがってPlaylistを取得してください。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let measUuid = "measUuid_example" // String | 計測のUUID
let channel = 987 // Int | チャンネル
let forceEnd = true // Bool | `true` にすると、取得するm3u8形式のプレイリストに強制的にEXT-X-ENDLISTを追加します。 (optional)

// Get Project HLS Playlist
MediaHLSAPI.getProjectPlaylist(projectUuid: projectUuid, measUuid: measUuid, channel: channel, forceEnd: forceEnd) { (response, error) in
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
 **measUuid** | **String** | 計測のUUID | 
 **channel** | **Int** | チャンネル | 
 **forceEnd** | **Bool** | &#x60;true&#x60; にすると、取得するm3u8形式のプレイリストに強制的にEXT-X-ENDLISTを追加します。 | [optional] 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/vnd.apple.mpegurl

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

