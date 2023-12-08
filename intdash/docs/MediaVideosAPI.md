# MediaVideosAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cancelCreatingJpeg**](MediaVideosAPI.md#cancelcreatingjpeg) | **PUT** /media/videos/{video_uuid}/jpegs/{jpeg_uuid}/cancel_convert | Cancel Creating JPEG
[**cancelCreatingMP4**](MediaVideosAPI.md#cancelcreatingmp4) | **PUT** /media/videos/{video_uuid}/mp4s/{mp4_uuid}/cancel_convert | Cancel Creating MP4
[**cancelCreatingProjectJpeg**](MediaVideosAPI.md#cancelcreatingprojectjpeg) | **PUT** /media/projects/{project_uuid}/videos/{video_uuid}/jpegs/{jpeg_uuid}/cancel_convert | Cancel Creating Project JPEG
[**cancelCreatingProjectMP4**](MediaVideosAPI.md#cancelcreatingprojectmp4) | **PUT** /media/projects/{project_uuid}/videos/{video_uuid}/mp4s/{mp4_uuid}/cancel_convert | Cancel Creating Project MP4
[**createJpeg**](MediaVideosAPI.md#createjpeg) | **POST** /media/videos/{video_uuid}/jpegs | Create JPEG
[**createMP4**](MediaVideosAPI.md#createmp4) | **POST** /media/videos/{video_uuid}/mp4s | Create MP4
[**createProjectJpeg**](MediaVideosAPI.md#createprojectjpeg) | **POST** /media/projects/{project_uuid}/videos/{video_uuid}/jpegs | Create Project JPEG
[**createProjectMP4**](MediaVideosAPI.md#createprojectmp4) | **POST** /media/projects/{project_uuid}/videos/{video_uuid}/mp4s | Create Project MP4
[**deleteJpeg**](MediaVideosAPI.md#deletejpeg) | **DELETE** /media/videos/{video_uuid}/jpegs/{jpeg_uuid} | Delete JPEG
[**deleteMP4**](MediaVideosAPI.md#deletemp4) | **DELETE** /media/videos/{video_uuid}/mp4s/{mp4_uuid} | Delete MP4
[**deleteProjectJpeg**](MediaVideosAPI.md#deleteprojectjpeg) | **DELETE** /media/projects/{project_uuid}/videos/{video_uuid}/jpegs/{jpeg_uuid} | Delete Project JPEG
[**deleteProjectMP4**](MediaVideosAPI.md#deleteprojectmp4) | **DELETE** /media/projects/{project_uuid}/videos/{video_uuid}/mp4s/{mp4_uuid} | Delete Project MP4
[**getJpeg**](MediaVideosAPI.md#getjpeg) | **GET** /media/videos/{video_uuid}/jpegs/{jpeg_uuid} | Get JPEG
[**getJpegAsZip**](MediaVideosAPI.md#getjpegaszip) | **GET** /media/videos/{video_uuid}/jpegs/{jpeg_uuid}/images/selected.zip | Get JPEG as zip
[**getJpegs**](MediaVideosAPI.md#getjpegs) | **GET** /media/videos/{video_uuid}/jpegs | List JPEGs
[**getMP4**](MediaVideosAPI.md#getmp4) | **GET** /media/videos/{video_uuid}/mp4s/{mp4_uuid} | Get MP4
[**getMP4s**](MediaVideosAPI.md#getmp4s) | **GET** /media/videos/{video_uuid}/mp4s | List MP4s
[**getProjectJpeg**](MediaVideosAPI.md#getprojectjpeg) | **GET** /media/projects/{project_uuid}/videos/{video_uuid}/jpegs/{jpeg_uuid} | Get Project JPEG
[**getProjectJpegAsZip**](MediaVideosAPI.md#getprojectjpegaszip) | **GET** /media/projects/{project_uuid}/videos/{video_uuid}/jpegs/{jpeg_uuid}/images/selected.zip | Get Project JPEG as zip
[**getProjectJpegs**](MediaVideosAPI.md#getprojectjpegs) | **GET** /media/projects/{project_uuid}/videos/{video_uuid}/jpegs | List Project JPEGs
[**getProjectMP4**](MediaVideosAPI.md#getprojectmp4) | **GET** /media/projects/{project_uuid}/videos/{video_uuid}/mp4s/{mp4_uuid} | Get Project MP4
[**getProjectMP4s**](MediaVideosAPI.md#getprojectmp4s) | **GET** /media/projects/{project_uuid}/videos/{video_uuid}/mp4s | List Project MP4s
[**getProjectVideo**](MediaVideosAPI.md#getprojectvideo) | **GET** /media/projects/{project_uuid}/videos/{video_uuid} | Get Project Video
[**getProjectVideos**](MediaVideosAPI.md#getprojectvideos) | **GET** /media/projects/{project_uuid}/videos | List Project Videos
[**getVideo**](MediaVideosAPI.md#getvideo) | **GET** /media/videos/{video_uuid} | Get Video
[**getVideos**](MediaVideosAPI.md#getvideos) | **GET** /media/videos | List Videos


# **cancelCreatingJpeg**
```swift
    open class func cancelCreatingJpeg(videoUuid: String, jpegUuid: String, completion: @escaping (_ data: Jpeg?, _ error: Error?) -> Void)
```

Cancel Creating JPEG

動画（video）からJPEGデータへの変換をキャンセルします。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID
let jpegUuid = "jpegUuid_example" // String | JPEGのUUID

// Cancel Creating JPEG
MediaVideosAPI.cancelCreatingJpeg(videoUuid: videoUuid, jpegUuid: jpegUuid) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 
 **jpegUuid** | **String** | JPEGのUUID | 

### Return type

[**Jpeg**](Jpeg.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cancelCreatingMP4**
```swift
    open class func cancelCreatingMP4(videoUuid: String, mp4Uuid: String, completion: @escaping (_ data: MP4?, _ error: Error?) -> Void)
```

Cancel Creating MP4

動画（video）からMP4データへの変換をキャンセルします。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID
let mp4Uuid = "mp4Uuid_example" // String | MP4のUUID

// Cancel Creating MP4
MediaVideosAPI.cancelCreatingMP4(videoUuid: videoUuid, mp4Uuid: mp4Uuid) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 
 **mp4Uuid** | **String** | MP4のUUID | 

### Return type

[**MP4**](MP4.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cancelCreatingProjectJpeg**
```swift
    open class func cancelCreatingProjectJpeg(projectUuid: String, videoUuid: String, jpegUuid: String, completion: @escaping (_ data: Jpeg?, _ error: Error?) -> Void)
```

Cancel Creating Project JPEG

動画（video）からJPEGデータへの変換をキャンセルします。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID
let jpegUuid = "jpegUuid_example" // String | JPEGのUUID

// Cancel Creating Project JPEG
MediaVideosAPI.cancelCreatingProjectJpeg(projectUuid: projectUuid, videoUuid: videoUuid, jpegUuid: jpegUuid) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 
 **jpegUuid** | **String** | JPEGのUUID | 

### Return type

[**Jpeg**](Jpeg.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cancelCreatingProjectMP4**
```swift
    open class func cancelCreatingProjectMP4(projectUuid: String, videoUuid: String, mp4Uuid: String, completion: @escaping (_ data: MP4?, _ error: Error?) -> Void)
```

Cancel Creating Project MP4

動画（video）からMP4データへの変換をキャンセルします。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID
let mp4Uuid = "mp4Uuid_example" // String | MP4のUUID

// Cancel Creating Project MP4
MediaVideosAPI.cancelCreatingProjectMP4(projectUuid: projectUuid, videoUuid: videoUuid, mp4Uuid: mp4Uuid) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 
 **mp4Uuid** | **String** | MP4のUUID | 

### Return type

[**MP4**](MP4.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createJpeg**
```swift
    open class func createJpeg(videoUuid: String, createJpegRequest: CreateJpegRequest? = nil, completion: @escaping (_ data: Jpeg?, _ error: Error?) -> Void)
```

Create JPEG

動画（video）を変換してJPEGデータを作成します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID
let createJpegRequest = CreateJpegRequest(trim: false, startOffset: 123, duration: 123, fps: 123, quality: JpegQuality()) // CreateJpegRequest |  (optional)

// Create JPEG
MediaVideosAPI.createJpeg(videoUuid: videoUuid, createJpegRequest: createJpegRequest) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 
 **createJpegRequest** | [**CreateJpegRequest**](CreateJpegRequest.md) |  | [optional] 

### Return type

[**Jpeg**](Jpeg.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createMP4**
```swift
    open class func createMP4(videoUuid: String, createMP4Request: CreateMP4Request? = nil, completion: @escaping (_ data: MP4?, _ error: Error?) -> Void)
```

Create MP4

動画（video）を変換してMP4データを作成します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID
let createMP4Request = CreateMP4Request(trimmed: false, startOffset: 123, duration: 123) // CreateMP4Request |  (optional)

// Create MP4
MediaVideosAPI.createMP4(videoUuid: videoUuid, createMP4Request: createMP4Request) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 
 **createMP4Request** | [**CreateMP4Request**](CreateMP4Request.md) |  | [optional] 

### Return type

[**MP4**](MP4.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createProjectJpeg**
```swift
    open class func createProjectJpeg(projectUuid: String, videoUuid: String, createJpegRequest: CreateJpegRequest? = nil, completion: @escaping (_ data: Jpeg?, _ error: Error?) -> Void)
```

Create Project JPEG

動画（video）を変換してJPEGデータを作成します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID
let createJpegRequest = CreateJpegRequest(trim: false, startOffset: 123, duration: 123, fps: 123, quality: JpegQuality()) // CreateJpegRequest |  (optional)

// Create Project JPEG
MediaVideosAPI.createProjectJpeg(projectUuid: projectUuid, videoUuid: videoUuid, createJpegRequest: createJpegRequest) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 
 **createJpegRequest** | [**CreateJpegRequest**](CreateJpegRequest.md) |  | [optional] 

### Return type

[**Jpeg**](Jpeg.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createProjectMP4**
```swift
    open class func createProjectMP4(projectUuid: String, videoUuid: String, createMP4Request: CreateMP4Request? = nil, completion: @escaping (_ data: MP4?, _ error: Error?) -> Void)
```

Create Project MP4

動画（video）を変換してMP4データを作成します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID
let createMP4Request = CreateMP4Request(trimmed: false, startOffset: 123, duration: 123) // CreateMP4Request |  (optional)

// Create Project MP4
MediaVideosAPI.createProjectMP4(projectUuid: projectUuid, videoUuid: videoUuid, createMP4Request: createMP4Request) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 
 **createMP4Request** | [**CreateMP4Request**](CreateMP4Request.md) |  | [optional] 

### Return type

[**MP4**](MP4.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteJpeg**
```swift
    open class func deleteJpeg(videoUuid: String, jpegUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete JPEG

動画（video）から変換されたJPEGデータを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID
let jpegUuid = "jpegUuid_example" // String | JPEGのUUID

// Delete JPEG
MediaVideosAPI.deleteJpeg(videoUuid: videoUuid, jpegUuid: jpegUuid) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 
 **jpegUuid** | **String** | JPEGのUUID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteMP4**
```swift
    open class func deleteMP4(videoUuid: String, mp4Uuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete MP4

動画（video）から変換されたMP4データを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID
let mp4Uuid = "mp4Uuid_example" // String | MP4のUUID

// Delete MP4
MediaVideosAPI.deleteMP4(videoUuid: videoUuid, mp4Uuid: mp4Uuid) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 
 **mp4Uuid** | **String** | MP4のUUID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteProjectJpeg**
```swift
    open class func deleteProjectJpeg(projectUuid: String, videoUuid: String, jpegUuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Project JPEG

動画（video）から変換されたJPEGデータを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID
let jpegUuid = "jpegUuid_example" // String | JPEGのUUID

// Delete Project JPEG
MediaVideosAPI.deleteProjectJpeg(projectUuid: projectUuid, videoUuid: videoUuid, jpegUuid: jpegUuid) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 
 **jpegUuid** | **String** | JPEGのUUID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteProjectMP4**
```swift
    open class func deleteProjectMP4(projectUuid: String, videoUuid: String, mp4Uuid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Project MP4

動画（video）から変換されたMP4データを削除します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID
let mp4Uuid = "mp4Uuid_example" // String | MP4のUUID

// Delete Project MP4
MediaVideosAPI.deleteProjectMP4(projectUuid: projectUuid, videoUuid: videoUuid, mp4Uuid: mp4Uuid) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 
 **mp4Uuid** | **String** | MP4のUUID | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getJpeg**
```swift
    open class func getJpeg(videoUuid: String, jpegUuid: String, completion: @escaping (_ data: Jpeg?, _ error: Error?) -> Void)
```

Get JPEG

動画（video）から変換されたJPEGデータの情報を取得します。 JPEGファイル自体を取得するには、`GET /media/videos/{video_uuid}/jpegs/{jpeg_uuid}/images/selected.zip` を使用してください。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID
let jpegUuid = "jpegUuid_example" // String | JPEGのUUID

// Get JPEG
MediaVideosAPI.getJpeg(videoUuid: videoUuid, jpegUuid: jpegUuid) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 
 **jpegUuid** | **String** | JPEGのUUID | 

### Return type

[**Jpeg**](Jpeg.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getJpegAsZip**
```swift
    open class func getJpegAsZip(videoUuid: String, jpegUuid: String, indexes: [Int]? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get JPEG as zip

JPEGデータをZIPファイルにまとめた形で取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID
let jpegUuid = "jpegUuid_example" // String | JPEGのUUID
let indexes = [123] // [Int] | 取得したいJPEGのインデックス番号（最初の番号は1）。指定がない場合はすべて取得します。 `indexes` パラメーターを複数回指定することで、複数のJPEGファイルを取得することができます。 (optional)

// Get JPEG as zip
MediaVideosAPI.getJpegAsZip(videoUuid: videoUuid, jpegUuid: jpegUuid, indexes: indexes) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 
 **jpegUuid** | **String** | JPEGのUUID | 
 **indexes** | [**[Int]**](Int.md) | 取得したいJPEGのインデックス番号（最初の番号は1）。指定がない場合はすべて取得します。 &#x60;indexes&#x60; パラメーターを複数回指定することで、複数のJPEGファイルを取得することができます。 | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/zip

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getJpegs**
```swift
    open class func getJpegs(videoUuid: String, completion: @escaping (_ data: Jpegs?, _ error: Error?) -> Void)
```

List JPEGs

動画（video）から変換されたJPEGデータのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID

// List JPEGs
MediaVideosAPI.getJpegs(videoUuid: videoUuid) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 

### Return type

[**Jpegs**](Jpegs.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMP4**
```swift
    open class func getMP4(videoUuid: String, mp4Uuid: String, completion: @escaping (_ data: MP4?, _ error: Error?) -> Void)
```

Get MP4

動画（video）から変換されたMP4データの情報を取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID
let mp4Uuid = "mp4Uuid_example" // String | MP4のUUID

// Get MP4
MediaVideosAPI.getMP4(videoUuid: videoUuid, mp4Uuid: mp4Uuid) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 
 **mp4Uuid** | **String** | MP4のUUID | 

### Return type

[**MP4**](MP4.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMP4s**
```swift
    open class func getMP4s(videoUuid: String, completion: @escaping (_ data: MP4s?, _ error: Error?) -> Void)
```

List MP4s

動画（video）から変換されたMP4データのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID

// List MP4s
MediaVideosAPI.getMP4s(videoUuid: videoUuid) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 

### Return type

[**MP4s**](MP4s.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectJpeg**
```swift
    open class func getProjectJpeg(projectUuid: String, videoUuid: String, jpegUuid: String, completion: @escaping (_ data: Jpeg?, _ error: Error?) -> Void)
```

Get Project JPEG

動画（video）から変換されたJPEGデータの情報を取得します。 JPEGファイル自体を取得するには、`GET /media/videos/{video_uuid}/jpegs/{jpeg_uuid}/images/selected.zip` を使用してください。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID
let jpegUuid = "jpegUuid_example" // String | JPEGのUUID

// Get Project JPEG
MediaVideosAPI.getProjectJpeg(projectUuid: projectUuid, videoUuid: videoUuid, jpegUuid: jpegUuid) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 
 **jpegUuid** | **String** | JPEGのUUID | 

### Return type

[**Jpeg**](Jpeg.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectJpegAsZip**
```swift
    open class func getProjectJpegAsZip(projectUuid: String, videoUuid: String, jpegUuid: String, indexes: [Int]? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get Project JPEG as zip

JPEGデータをZIPファイルにまとめた形で取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID
let jpegUuid = "jpegUuid_example" // String | JPEGのUUID
let indexes = [123] // [Int] | 取得したいJPEGのインデックス番号（最初の番号は1）。指定がない場合はすべて取得します。 `indexes` パラメーターを複数回指定することで、複数のJPEGファイルを取得することができます。 (optional)

// Get Project JPEG as zip
MediaVideosAPI.getProjectJpegAsZip(projectUuid: projectUuid, videoUuid: videoUuid, jpegUuid: jpegUuid, indexes: indexes) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 
 **jpegUuid** | **String** | JPEGのUUID | 
 **indexes** | [**[Int]**](Int.md) | 取得したいJPEGのインデックス番号（最初の番号は1）。指定がない場合はすべて取得します。 &#x60;indexes&#x60; パラメーターを複数回指定することで、複数のJPEGファイルを取得することができます。 | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/zip

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectJpegs**
```swift
    open class func getProjectJpegs(projectUuid: String, videoUuid: String, completion: @escaping (_ data: Jpegs?, _ error: Error?) -> Void)
```

List Project JPEGs

動画（video）から変換されたJPEGデータのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID

// List Project JPEGs
MediaVideosAPI.getProjectJpegs(projectUuid: projectUuid, videoUuid: videoUuid) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 

### Return type

[**Jpegs**](Jpegs.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectMP4**
```swift
    open class func getProjectMP4(projectUuid: String, videoUuid: String, mp4Uuid: String, completion: @escaping (_ data: MP4?, _ error: Error?) -> Void)
```

Get Project MP4

動画（video）から変換されたMP4データの情報を取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID
let mp4Uuid = "mp4Uuid_example" // String | MP4のUUID

// Get Project MP4
MediaVideosAPI.getProjectMP4(projectUuid: projectUuid, videoUuid: videoUuid, mp4Uuid: mp4Uuid) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 
 **mp4Uuid** | **String** | MP4のUUID | 

### Return type

[**MP4**](MP4.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectMP4s**
```swift
    open class func getProjectMP4s(projectUuid: String, videoUuid: String, completion: @escaping (_ data: MP4s?, _ error: Error?) -> Void)
```

List Project MP4s

動画（video）から変換されたMP4データのリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID

// List Project MP4s
MediaVideosAPI.getProjectMP4s(projectUuid: projectUuid, videoUuid: videoUuid) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 

### Return type

[**MP4s**](MP4s.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectVideo**
```swift
    open class func getProjectVideo(projectUuid: String, videoUuid: String, completion: @escaping (_ data: Video?, _ error: Error?) -> Void)
```

Get Project Video

動画を取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID

// Get Project Video
MediaVideosAPI.getProjectVideo(projectUuid: projectUuid, videoUuid: videoUuid) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 

### Return type

[**Video**](Video.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectVideos**
```swift
    open class func getProjectVideos(projectUuid: String, uuid: String? = nil, measUuid: String? = nil, channel: Int? = nil, sort: String? = nil, page: Int? = nil, perPage: Int? = nil, completion: @escaping (_ data: Videos?, _ error: Error?) -> Void)
```

List Project Videos

動画（video）のリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let uuid = "uuid_example" // String | 動画（video）のUUID (optional)
let measUuid = "measUuid_example" // String | 計測のUUID (optional)
let channel = 987 // Int | チャンネル (optional)
let sort = "sort_example" // String | 並べ替えに使用するキー。接尾辞 `+` を付けた場合は昇順、 `-` を付けた場合は降順で出力されます。 接尾辞を省略した場合は昇順となります。例えば、 `name-` を指定すると、nameによる降順で出力されます。    - `channel`   - `created_at`   - `updated_at` (optional) (default to "create_at+")
let page = 987 // Int | 取得するページ番号 (optional) (default to 1)
let perPage = 987 // Int | 1回のリクエストで取得する件数 (optional) (default to 100)

// List Project Videos
MediaVideosAPI.getProjectVideos(projectUuid: projectUuid, uuid: uuid, measUuid: measUuid, channel: channel, sort: sort, page: page, perPage: perPage) { (response, error) in
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
 **uuid** | **String** | 動画（video）のUUID | [optional] 
 **measUuid** | **String** | 計測のUUID | [optional] 
 **channel** | **Int** | チャンネル | [optional] 
 **sort** | **String** | 並べ替えに使用するキー。接尾辞 &#x60;+&#x60; を付けた場合は昇順、 &#x60;-&#x60; を付けた場合は降順で出力されます。 接尾辞を省略した場合は昇順となります。例えば、 &#x60;name-&#x60; を指定すると、nameによる降順で出力されます。    - &#x60;channel&#x60;   - &#x60;created_at&#x60;   - &#x60;updated_at&#x60; | [optional] [default to &quot;create_at+&quot;]
 **page** | **Int** | 取得するページ番号 | [optional] [default to 1]
 **perPage** | **Int** | 1回のリクエストで取得する件数 | [optional] [default to 100]

### Return type

[**Videos**](Videos.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getVideo**
```swift
    open class func getVideo(videoUuid: String, completion: @escaping (_ data: Video?, _ error: Error?) -> Void)
```

Get Video

動画を取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let videoUuid = "videoUuid_example" // String | 変換元の動画（video）のUUID

// Get Video
MediaVideosAPI.getVideo(videoUuid: videoUuid) { (response, error) in
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
 **videoUuid** | **String** | 変換元の動画（video）のUUID | 

### Return type

[**Video**](Video.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getVideos**
```swift
    open class func getVideos(uuid: String? = nil, measUuid: String? = nil, channel: Int? = nil, sort: String? = nil, page: Int? = nil, perPage: Int? = nil, completion: @escaping (_ data: Videos?, _ error: Error?) -> Void)
```

List Videos

動画（video）のリストを取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let uuid = "uuid_example" // String | 動画（video）のUUID (optional)
let measUuid = "measUuid_example" // String | 計測のUUID (optional)
let channel = 987 // Int | チャンネル (optional)
let sort = "sort_example" // String | 並べ替えに使用するキー。接尾辞 `+` を付けた場合は昇順、 `-` を付けた場合は降順で出力されます。 接尾辞を省略した場合は昇順となります。例えば、 `name-` を指定すると、nameによる降順で出力されます。    - `channel`   - `created_at`   - `updated_at` (optional) (default to "create_at+")
let page = 987 // Int | 取得するページ番号 (optional) (default to 1)
let perPage = 987 // Int | 1回のリクエストで取得する件数 (optional) (default to 100)

// List Videos
MediaVideosAPI.getVideos(uuid: uuid, measUuid: measUuid, channel: channel, sort: sort, page: page, perPage: perPage) { (response, error) in
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
 **uuid** | **String** | 動画（video）のUUID | [optional] 
 **measUuid** | **String** | 計測のUUID | [optional] 
 **channel** | **Int** | チャンネル | [optional] 
 **sort** | **String** | 並べ替えに使用するキー。接尾辞 &#x60;+&#x60; を付けた場合は昇順、 &#x60;-&#x60; を付けた場合は降順で出力されます。 接尾辞を省略した場合は昇順となります。例えば、 &#x60;name-&#x60; を指定すると、nameによる降順で出力されます。    - &#x60;channel&#x60;   - &#x60;created_at&#x60;   - &#x60;updated_at&#x60; | [optional] [default to &quot;create_at+&quot;]
 **page** | **Int** | 取得するページ番号 | [optional] [default to 1]
 **perPage** | **Int** | 1回のリクエストで取得する件数 | [optional] [default to 100]

### Return type

[**Videos**](Videos.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

