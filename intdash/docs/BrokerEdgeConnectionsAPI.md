# BrokerEdgeConnectionsAPI

All URIs are relative to *http://localhost/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getEdgeConnection**](BrokerEdgeConnectionsAPI.md#getedgeconnection) | **GET** /v1/edge_connections/{edge_connection_uuid} | Get Edge Connection
[**getProjectEdgeConnection**](BrokerEdgeConnectionsAPI.md#getprojectedgeconnection) | **GET** /v1/projects/{project_uuid}/edge_connections/{edge_connection_uuid} | Get Project Edge Connection
[**listEdgeConnections**](BrokerEdgeConnectionsAPI.md#listedgeconnections) | **GET** /v1/edge_connections | List Edge Connections
[**listProjectEdgeConnections**](BrokerEdgeConnectionsAPI.md#listprojectedgeconnections) | **GET** /v1/projects/{project_uuid}/edge_connections | List Project Edge Connections


# **getEdgeConnection**
```swift
    open class func getEdgeConnection(edgeConnectionUuid: String, completion: @escaping (_ data: EdgeConnection?, _ error: Error?) -> Void)
```

Get Edge Connection

エッジ接続（ `/v1/ws/measurements` に接続されたエッジの接続情報）を取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let edgeConnectionUuid = "edgeConnectionUuid_example" // String | エッジ接続のUUID

// Get Edge Connection
BrokerEdgeConnectionsAPI.getEdgeConnection(edgeConnectionUuid: edgeConnectionUuid) { (response, error) in
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
 **edgeConnectionUuid** | **String** | エッジ接続のUUID | 

### Return type

[**EdgeConnection**](EdgeConnection.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectEdgeConnection**
```swift
    open class func getProjectEdgeConnection(projectUuid: String, edgeConnectionUuid: String, completion: @escaping (_ data: EdgeConnection?, _ error: Error?) -> Void)
```

Get Project Edge Connection

エッジ接続（ `/v1/ws/measurements` に接続されたエッジの接続情報）を取得します。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let edgeConnectionUuid = "edgeConnectionUuid_example" // String | エッジ接続のUUID

// Get Project Edge Connection
BrokerEdgeConnectionsAPI.getProjectEdgeConnection(projectUuid: projectUuid, edgeConnectionUuid: edgeConnectionUuid) { (response, error) in
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
 **edgeConnectionUuid** | **String** | エッジ接続のUUID | 

### Return type

[**EdgeConnection**](EdgeConnection.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listEdgeConnections**
```swift
    open class func listEdgeConnections(edge: [String]? = nil, sort: Sort_listEdgeConnections? = nil, order: Order_listEdgeConnections? = nil, limit: Int? = nil, page: Int? = nil, completion: @escaping (_ data: EdgeConnectionList?, _ error: Error?) -> Void)
```

List Edge Connections

エッジ接続のリストを取得します。 エッジ接続は、エッジが `/v1/ws/measurements` エンドポイントに接続したときに新規作成され、 3日間更新がないと削除されます。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let edge = ["inner_example"] // [String] | エッジのUUID (optional)
let sort = "sort_example" // String | 並べ替えに使用するキー (optional) (default to .lastLivedAt)
let order = "order_example" // String | 並べ替えの順序 (optional) (default to .desc)
let limit = 987 // Int | 1回のリクエストで取得する件数 (optional) (default to 100)
let page = 987 // Int | 取得するページの番号 (optional) (default to 1)

// List Edge Connections
BrokerEdgeConnectionsAPI.listEdgeConnections(edge: edge, sort: sort, order: order, limit: limit, page: page) { (response, error) in
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
 **edge** | [**[String]**](String.md) | エッジのUUID | [optional] 
 **sort** | **String** | 並べ替えに使用するキー | [optional] [default to .lastLivedAt]
 **order** | **String** | 並べ替えの順序 | [optional] [default to .desc]
 **limit** | **Int** | 1回のリクエストで取得する件数 | [optional] [default to 100]
 **page** | **Int** | 取得するページの番号 | [optional] [default to 1]

### Return type

[**EdgeConnectionList**](EdgeConnectionList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listProjectEdgeConnections**
```swift
    open class func listProjectEdgeConnections(projectUuid: String, edge: [String]? = nil, sort: Sort_listProjectEdgeConnections? = nil, order: Order_listProjectEdgeConnections? = nil, limit: Int? = nil, page: Int? = nil, completion: @escaping (_ data: EdgeConnectionList?, _ error: Error?) -> Void)
```

List Project Edge Connections

エッジ接続のリストを取得します。 エッジ接続は、エッジが `/v1/ws/measurements` エンドポイントに接続したときに新規作成され、 3日間更新がないと削除されます。

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import intdash

let projectUuid = "projectUuid_example" // String | プロジェクトのUUID
let edge = ["inner_example"] // [String] | エッジのUUID (optional)
let sort = "sort_example" // String | 並べ替えに使用するキー (optional) (default to .lastLivedAt)
let order = "order_example" // String | 並べ替えの順序 (optional) (default to .desc)
let limit = 987 // Int | 1回のリクエストで取得する件数 (optional) (default to 100)
let page = 987 // Int | 取得するページの番号 (optional) (default to 1)

// List Project Edge Connections
BrokerEdgeConnectionsAPI.listProjectEdgeConnections(projectUuid: projectUuid, edge: edge, sort: sort, order: order, limit: limit, page: page) { (response, error) in
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
 **edge** | [**[String]**](String.md) | エッジのUUID | [optional] 
 **sort** | **String** | 並べ替えに使用するキー | [optional] [default to .lastLivedAt]
 **order** | **String** | 並べ替えの順序 | [optional] [default to .desc]
 **limit** | **Int** | 1回のリクエストで取得する件数 | [optional] [default to 100]
 **page** | **Int** | 取得するページの番号 | [optional] [default to 1]

### Return type

[**EdgeConnectionList**](EdgeConnectionList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

