//
// MediaLiveAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class MediaLiveAPI {

    /**
     Get realtime video stream
     
     - parameter edgeUuid: (path) エッジのUUID 
     - parameter channel: (path) チャンネル 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @available(*, deprecated, message: "This operation is deprecated.")
    open class func connectLive(edgeUuid: String, channel: Int, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        connectLiveWithRequestBuilder(edgeUuid: edgeUuid, channel: channel).execute(apiResponseQueue) { result in
            switch result {
            case .success:
                completion((), nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get realtime video stream
     - GET /media/ws/edges/{edge_uuid}/fmp4s/{channel}
     - **Deprecated** このエンドポイントの代わりに [`GET /v1/stream`](#operation/Stream) でデータを取得し、WebCodecsを使用して取得したデータをデコードしてください。
     - parameter edgeUuid: (path) エッジのUUID 
     - parameter channel: (path) チャンネル 
     - returns: RequestBuilder<Void> 
     */
    @available(*, deprecated, message: "This operation is deprecated.")
    open class func connectLiveWithRequestBuilder(edgeUuid: String, channel: Int) -> RequestBuilder<Void> {
        var localVariablePath = "/media/ws/edges/{edge_uuid}/fmp4s/{channel}"
        let edgeUuidPreEscape = "\(APIHelper.mapValueToPathItem(edgeUuid))"
        let edgeUuidPostEscape = edgeUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{edge_uuid}", with: edgeUuidPostEscape, options: .literal, range: nil)
        let channelPreEscape = "\(APIHelper.mapValueToPathItem(channel))"
        let channelPostEscape = channelPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{channel}", with: channelPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = intdashAPI.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Get Project realtime video stream
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter edgeUuid: (path) エッジのUUID 
     - parameter channel: (path) チャンネル 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @available(*, deprecated, message: "This operation is deprecated.")
    open class func connectProjectLive(projectUuid: String, edgeUuid: String, channel: Int, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        connectProjectLiveWithRequestBuilder(projectUuid: projectUuid, edgeUuid: edgeUuid, channel: channel).execute(apiResponseQueue) { result in
            switch result {
            case .success:
                completion((), nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Project realtime video stream
     - GET /media/projects/{project_uuid}/ws/edges/{edge_uuid}/fmp4s/{channel}
     - **Deprecated** このエンドポイントの代わりに [`GET /v1/stream`](#operation/Stream) でデータを取得し、WebCodecsを使用して取得したデータをデコードしてください。
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter edgeUuid: (path) エッジのUUID 
     - parameter channel: (path) チャンネル 
     - returns: RequestBuilder<Void> 
     */
    @available(*, deprecated, message: "This operation is deprecated.")
    open class func connectProjectLiveWithRequestBuilder(projectUuid: String, edgeUuid: String, channel: Int) -> RequestBuilder<Void> {
        var localVariablePath = "/media/projects/{project_uuid}/ws/edges/{edge_uuid}/fmp4s/{channel}"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let edgeUuidPreEscape = "\(APIHelper.mapValueToPathItem(edgeUuid))"
        let edgeUuidPostEscape = edgeUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{edge_uuid}", with: edgeUuidPostEscape, options: .literal, range: nil)
        let channelPreEscape = "\(APIHelper.mapValueToPathItem(channel))"
        let channelPostEscape = channelPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{channel}", with: channelPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = intdashAPI.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}