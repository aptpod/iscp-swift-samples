//
// MeasSignalsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class MeasSignalsAPI {

    /**
     Create Project Signal
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter createSignalRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createProjectSignal(projectUuid: String, createSignalRequest: CreateSignalRequest? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Signal?, _ error: Error?) -> Void)) {
        createProjectSignalWithRequestBuilder(projectUuid: projectUuid, createSignalRequest: createSignalRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Create Project Signal
     - POST /v1/projects/{project_uuid}/signals
     - 信号定義を作成します。  * **Note**     - 既存の信号定義と `label` が重複する場合、または `uuid` が重複する場合は、       ステータスコード `409 Conflict` が返却されます。
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter createSignalRequest: (body)  (optional)
     - returns: RequestBuilder<Signal> 
     */
    open class func createProjectSignalWithRequestBuilder(projectUuid: String, createSignalRequest: CreateSignalRequest? = nil) -> RequestBuilder<Signal> {
        var localVariablePath = "/v1/projects/{project_uuid}/signals"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: createSignalRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Signal>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Create Signal
     
     - parameter createSignalRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createSignal(createSignalRequest: CreateSignalRequest? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Signal?, _ error: Error?) -> Void)) {
        createSignalWithRequestBuilder(createSignalRequest: createSignalRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Create Signal
     - POST /v1/signals
     - 信号定義を作成します。  * **Note**     - 既存の信号定義と `label` が重複する場合、または `uuid` が重複する場合は、       ステータスコード `409 Conflict` が返却されます。
     - parameter createSignalRequest: (body)  (optional)
     - returns: RequestBuilder<Signal> 
     */
    open class func createSignalWithRequestBuilder(createSignalRequest: CreateSignalRequest? = nil) -> RequestBuilder<Signal> {
        let localVariablePath = "/v1/signals"
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: createSignalRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Signal>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Delete Project Signal
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter signalUuid: (path) 信号定義のUUID 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteProjectSignal(projectUuid: String, signalUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        deleteProjectSignalWithRequestBuilder(projectUuid: projectUuid, signalUuid: signalUuid).execute(apiResponseQueue) { result in
            switch result {
            case .success:
                completion((), nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Delete Project Signal
     - DELETE /v1/projects/{project_uuid}/signals/{signal_uuid}
     - 信号定義を削除します。
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter signalUuid: (path) 信号定義のUUID 
     - returns: RequestBuilder<Void> 
     */
    open class func deleteProjectSignalWithRequestBuilder(projectUuid: String, signalUuid: String) -> RequestBuilder<Void> {
        var localVariablePath = "/v1/projects/{project_uuid}/signals/{signal_uuid}"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let signalUuidPreEscape = "\(APIHelper.mapValueToPathItem(signalUuid))"
        let signalUuidPostEscape = signalUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{signal_uuid}", with: signalUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = intdashAPI.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "DELETE", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Delete Signal
     
     - parameter signalUuid: (path) 信号定義のUUID 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteSignal(signalUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        deleteSignalWithRequestBuilder(signalUuid: signalUuid).execute(apiResponseQueue) { result in
            switch result {
            case .success:
                completion((), nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Delete Signal
     - DELETE /v1/signals/{signal_uuid}
     - 信号定義を削除します。
     - parameter signalUuid: (path) 信号定義のUUID 
     - returns: RequestBuilder<Void> 
     */
    open class func deleteSignalWithRequestBuilder(signalUuid: String) -> RequestBuilder<Void> {
        var localVariablePath = "/v1/signals/{signal_uuid}"
        let signalUuidPreEscape = "\(APIHelper.mapValueToPathItem(signalUuid))"
        let signalUuidPostEscape = signalUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{signal_uuid}", with: signalUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = intdashAPI.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "DELETE", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Get Project Signal
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter signalUuid: (path) 信号定義のUUID 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getProjectSignal(projectUuid: String, signalUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Signal?, _ error: Error?) -> Void)) {
        getProjectSignalWithRequestBuilder(projectUuid: projectUuid, signalUuid: signalUuid).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Project Signal
     - GET /v1/projects/{project_uuid}/signals/{signal_uuid}
     - 信号定義を取得します。
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter signalUuid: (path) 信号定義のUUID 
     - returns: RequestBuilder<Signal> 
     */
    open class func getProjectSignalWithRequestBuilder(projectUuid: String, signalUuid: String) -> RequestBuilder<Signal> {
        var localVariablePath = "/v1/projects/{project_uuid}/signals/{signal_uuid}"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let signalUuidPreEscape = "\(APIHelper.mapValueToPathItem(signalUuid))"
        let signalUuidPostEscape = signalUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{signal_uuid}", with: signalUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Signal>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Get Signal
     
     - parameter signalUuid: (path) 信号定義のUUID 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getSignal(signalUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Signal?, _ error: Error?) -> Void)) {
        getSignalWithRequestBuilder(signalUuid: signalUuid).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Signal
     - GET /v1/signals/{signal_uuid}
     - 信号定義を取得します。
     - parameter signalUuid: (path) 信号定義のUUID 
     - returns: RequestBuilder<Signal> 
     */
    open class func getSignalWithRequestBuilder(signalUuid: String) -> RequestBuilder<Signal> {
        var localVariablePath = "/v1/signals/{signal_uuid}"
        let signalUuidPreEscape = "\(APIHelper.mapValueToPathItem(signalUuid))"
        let signalUuidPostEscape = signalUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{signal_uuid}", with: signalUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Signal>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     * enum for parameter sort
     */
    public enum Sort_listProjectSignals: String, CaseIterable {
        case label = "label"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    /**
     * enum for parameter order
     */
    public enum Order_listProjectSignals: String, CaseIterable {
        case asc = "asc"
        case desc = "desc"
    }

    /**
     List Project Signals
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter label: (query) ラベルが指定した文字列から始まる信号定義を取得します。 文字列をダブルクォーテーションで囲むと、完全一致のものだけを取得します。 (optional)
     - parameter sort: (query) 並べ替えに使用するキー (optional)
     - parameter order: (query) 並べ替えの順序 (optional)
     - parameter limit: (query) 1回のリクエストで取得する件数 (optional)
     - parameter page: (query) 取得するページの番号 (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func listProjectSignals(projectUuid: String, label: [String]? = nil, sort: Sort_listProjectSignals? = nil, order: Order_listProjectSignals? = nil, limit: Int? = nil, page: Int? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Signals?, _ error: Error?) -> Void)) {
        listProjectSignalsWithRequestBuilder(projectUuid: projectUuid, label: label, sort: sort, order: order, limit: limit, page: page).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     List Project Signals
     - GET /v1/projects/{project_uuid}/signals
     - 信号定義のリストを取得します。
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter label: (query) ラベルが指定した文字列から始まる信号定義を取得します。 文字列をダブルクォーテーションで囲むと、完全一致のものだけを取得します。 (optional)
     - parameter sort: (query) 並べ替えに使用するキー (optional)
     - parameter order: (query) 並べ替えの順序 (optional)
     - parameter limit: (query) 1回のリクエストで取得する件数 (optional)
     - parameter page: (query) 取得するページの番号 (optional)
     - returns: RequestBuilder<Signals> 
     */
    open class func listProjectSignalsWithRequestBuilder(projectUuid: String, label: [String]? = nil, sort: Sort_listProjectSignals? = nil, order: Order_listProjectSignals? = nil, limit: Int? = nil, page: Int? = nil) -> RequestBuilder<Signals> {
        var localVariablePath = "/v1/projects/{project_uuid}/signals"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "label": label?.encodeToJSON(),
            "sort": sort?.encodeToJSON(),
            "order": order?.encodeToJSON(),
            "limit": limit?.encodeToJSON(),
            "page": page?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Signals>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     * enum for parameter sort
     */
    public enum Sort_listSignals: String, CaseIterable {
        case label = "label"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    /**
     * enum for parameter order
     */
    public enum Order_listSignals: String, CaseIterable {
        case asc = "asc"
        case desc = "desc"
    }

    /**
     List Signals
     
     - parameter label: (query) ラベルが指定した文字列から始まる信号定義を取得します。 文字列をダブルクォーテーションで囲むと、完全一致のものだけを取得します。 (optional)
     - parameter sort: (query) 並べ替えに使用するキー (optional)
     - parameter order: (query) 並べ替えの順序 (optional)
     - parameter limit: (query) 1回のリクエストで取得する件数 (optional)
     - parameter page: (query) 取得するページの番号 (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func listSignals(label: [String]? = nil, sort: Sort_listSignals? = nil, order: Order_listSignals? = nil, limit: Int? = nil, page: Int? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Signals?, _ error: Error?) -> Void)) {
        listSignalsWithRequestBuilder(label: label, sort: sort, order: order, limit: limit, page: page).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     List Signals
     - GET /v1/signals
     - 信号定義のリストを取得します。
     - parameter label: (query) ラベルが指定した文字列から始まる信号定義を取得します。 文字列をダブルクォーテーションで囲むと、完全一致のものだけを取得します。 (optional)
     - parameter sort: (query) 並べ替えに使用するキー (optional)
     - parameter order: (query) 並べ替えの順序 (optional)
     - parameter limit: (query) 1回のリクエストで取得する件数 (optional)
     - parameter page: (query) 取得するページの番号 (optional)
     - returns: RequestBuilder<Signals> 
     */
    open class func listSignalsWithRequestBuilder(label: [String]? = nil, sort: Sort_listSignals? = nil, order: Order_listSignals? = nil, limit: Int? = nil, page: Int? = nil) -> RequestBuilder<Signals> {
        let localVariablePath = "/v1/signals"
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "label": label?.encodeToJSON(),
            "sort": sort?.encodeToJSON(),
            "order": order?.encodeToJSON(),
            "limit": limit?.encodeToJSON(),
            "page": page?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Signals>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Update Project Signal
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter signalUuid: (path) 信号定義のUUID 
     - parameter updateSignalRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func updateProjectSignal(projectUuid: String, signalUuid: String, updateSignalRequest: UpdateSignalRequest? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Signal?, _ error: Error?) -> Void)) {
        updateProjectSignalWithRequestBuilder(projectUuid: projectUuid, signalUuid: signalUuid, updateSignalRequest: updateSignalRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Update Project Signal
     - PUT /v1/projects/{project_uuid}/signals/{signal_uuid}
     - 信号定義を更新します。
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter signalUuid: (path) 信号定義のUUID 
     - parameter updateSignalRequest: (body)  (optional)
     - returns: RequestBuilder<Signal> 
     */
    open class func updateProjectSignalWithRequestBuilder(projectUuid: String, signalUuid: String, updateSignalRequest: UpdateSignalRequest? = nil) -> RequestBuilder<Signal> {
        var localVariablePath = "/v1/projects/{project_uuid}/signals/{signal_uuid}"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let signalUuidPreEscape = "\(APIHelper.mapValueToPathItem(signalUuid))"
        let signalUuidPostEscape = signalUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{signal_uuid}", with: signalUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: updateSignalRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Signal>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "PUT", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Update Signal
     
     - parameter signalUuid: (path) 信号定義のUUID 
     - parameter updateSignalRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func updateSignal(signalUuid: String, updateSignalRequest: UpdateSignalRequest? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Signal?, _ error: Error?) -> Void)) {
        updateSignalWithRequestBuilder(signalUuid: signalUuid, updateSignalRequest: updateSignalRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Update Signal
     - PUT /v1/signals/{signal_uuid}
     - 信号定義を更新します。
     - parameter signalUuid: (path) 信号定義のUUID 
     - parameter updateSignalRequest: (body)  (optional)
     - returns: RequestBuilder<Signal> 
     */
    open class func updateSignalWithRequestBuilder(signalUuid: String, updateSignalRequest: UpdateSignalRequest? = nil) -> RequestBuilder<Signal> {
        var localVariablePath = "/v1/signals/{signal_uuid}"
        let signalUuidPreEscape = "\(APIHelper.mapValueToPathItem(signalUuid))"
        let signalUuidPostEscape = signalUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{signal_uuid}", with: signalUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: updateSignalRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Signal>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "PUT", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}
