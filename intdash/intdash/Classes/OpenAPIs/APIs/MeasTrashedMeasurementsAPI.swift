//
// MeasTrashedMeasurementsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class MeasTrashedMeasurementsAPI {

    /**
     Delete Project Trashed Measurement and Delete Data Points Immediately
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter measurementUuid: (path) 計測のUUID 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteProjectTrashedMeasurement(projectUuid: String, measurementUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        deleteProjectTrashedMeasurementWithRequestBuilder(projectUuid: projectUuid, measurementUuid: measurementUuid).execute(apiResponseQueue) { result in
            switch result {
            case .success:
                completion((), nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Delete Project Trashed Measurement and Delete Data Points Immediately
     - DELETE /v1/projects/{project_uuid}/trashed_measurements/{measurement_uuid}
     - ゴミ箱に入っている計測と、その計測に関連付けられているデータポイントを直ちに削除します。
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter measurementUuid: (path) 計測のUUID 
     - returns: RequestBuilder<Void> 
     */
    open class func deleteProjectTrashedMeasurementWithRequestBuilder(projectUuid: String, measurementUuid: String) -> RequestBuilder<Void> {
        var localVariablePath = "/v1/projects/{project_uuid}/trashed_measurements/{measurement_uuid}"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let measurementUuidPreEscape = "\(APIHelper.mapValueToPathItem(measurementUuid))"
        let measurementUuidPostEscape = measurementUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{measurement_uuid}", with: measurementUuidPostEscape, options: .literal, range: nil)
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
     Delete Trashed Measurement and Delete Data Points Immediately
     
     - parameter measurementUuid: (path) 計測のUUID 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteTrashedMeasurement(measurementUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        deleteTrashedMeasurementWithRequestBuilder(measurementUuid: measurementUuid).execute(apiResponseQueue) { result in
            switch result {
            case .success:
                completion((), nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Delete Trashed Measurement and Delete Data Points Immediately
     - DELETE /v1/trashed_measurements/{measurement_uuid}
     - ゴミ箱に入っている計測と、その計測に関連付けられているデータポイントを直ちに削除します。
     - parameter measurementUuid: (path) 計測のUUID 
     - returns: RequestBuilder<Void> 
     */
    open class func deleteTrashedMeasurementWithRequestBuilder(measurementUuid: String) -> RequestBuilder<Void> {
        var localVariablePath = "/v1/trashed_measurements/{measurement_uuid}"
        let measurementUuidPreEscape = "\(APIHelper.mapValueToPathItem(measurementUuid))"
        let measurementUuidPostEscape = measurementUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{measurement_uuid}", with: measurementUuidPostEscape, options: .literal, range: nil)
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
     List Project Trashed Measurements
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter limit: (query) 1回のリクエストで取得する件数。&#x60;0&#x60; を指定した場合は、デフォルト値の50件となります。 (optional)
     - parameter page: (query) 取得するページの番号 (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func listProjectTrashedMeasurements(projectUuid: String, limit: Int? = nil, page: Int? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: TrashedMeasurements?, _ error: Error?) -> Void)) {
        listProjectTrashedMeasurementsWithRequestBuilder(projectUuid: projectUuid, limit: limit, page: page).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     List Project Trashed Measurements
     - GET /v1/projects/{project_uuid}/trashed_measurements
     - ゴミ箱に入っている計測のリストを取得します。
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter limit: (query) 1回のリクエストで取得する件数。&#x60;0&#x60; を指定した場合は、デフォルト値の50件となります。 (optional)
     - parameter page: (query) 取得するページの番号 (optional)
     - returns: RequestBuilder<TrashedMeasurements> 
     */
    open class func listProjectTrashedMeasurementsWithRequestBuilder(projectUuid: String, limit: Int? = nil, page: Int? = nil) -> RequestBuilder<TrashedMeasurements> {
        var localVariablePath = "/v1/projects/{project_uuid}/trashed_measurements"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "limit": limit?.encodeToJSON(),
            "page": page?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<TrashedMeasurements>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     List Trashed Measurements
     
     - parameter limit: (query) 1回のリクエストで取得する件数。&#x60;0&#x60; を指定した場合は、デフォルト値の50件となります。 (optional)
     - parameter page: (query) 取得するページの番号 (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func listTrashedMeasurements(limit: Int? = nil, page: Int? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: TrashedMeasurements?, _ error: Error?) -> Void)) {
        listTrashedMeasurementsWithRequestBuilder(limit: limit, page: page).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     List Trashed Measurements
     - GET /v1/trashed_measurements
     - ゴミ箱に入っている計測のリストを取得します。
     - parameter limit: (query) 1回のリクエストで取得する件数。&#x60;0&#x60; を指定した場合は、デフォルト値の50件となります。 (optional)
     - parameter page: (query) 取得するページの番号 (optional)
     - returns: RequestBuilder<TrashedMeasurements> 
     */
    open class func listTrashedMeasurementsWithRequestBuilder(limit: Int? = nil, page: Int? = nil) -> RequestBuilder<TrashedMeasurements> {
        let localVariablePath = "/v1/trashed_measurements"
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "limit": limit?.encodeToJSON(),
            "page": page?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<TrashedMeasurements>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Restore Project Measurement
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter measurementUuid: (path) 計測のUUID 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func restoreProjectTrashedMeasurement(projectUuid: String, measurementUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        restoreProjectTrashedMeasurementWithRequestBuilder(projectUuid: projectUuid, measurementUuid: measurementUuid).execute(apiResponseQueue) { result in
            switch result {
            case .success:
                completion((), nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Restore Project Measurement
     - DELETE /v1/projects/{project_uuid}/trashed_measurements/{measurement_uuid}/restore
     - ゴミ箱に入っている計測を復元します。
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter measurementUuid: (path) 計測のUUID 
     - returns: RequestBuilder<Void> 
     */
    open class func restoreProjectTrashedMeasurementWithRequestBuilder(projectUuid: String, measurementUuid: String) -> RequestBuilder<Void> {
        var localVariablePath = "/v1/projects/{project_uuid}/trashed_measurements/{measurement_uuid}/restore"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let measurementUuidPreEscape = "\(APIHelper.mapValueToPathItem(measurementUuid))"
        let measurementUuidPostEscape = measurementUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{measurement_uuid}", with: measurementUuidPostEscape, options: .literal, range: nil)
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
     Restore Measurement
     
     - parameter measurementUuid: (path) 計測のUUID 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func restoreTrashedMeasurement(measurementUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        restoreTrashedMeasurementWithRequestBuilder(measurementUuid: measurementUuid).execute(apiResponseQueue) { result in
            switch result {
            case .success:
                completion((), nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Restore Measurement
     - DELETE /v1/trashed_measurements/{measurement_uuid}/restore
     - ゴミ箱に入っている計測を復元します。
     - parameter measurementUuid: (path) 計測のUUID 
     - returns: RequestBuilder<Void> 
     */
    open class func restoreTrashedMeasurementWithRequestBuilder(measurementUuid: String) -> RequestBuilder<Void> {
        var localVariablePath = "/v1/trashed_measurements/{measurement_uuid}/restore"
        let measurementUuidPreEscape = "\(APIHelper.mapValueToPathItem(measurementUuid))"
        let measurementUuidPostEscape = measurementUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{measurement_uuid}", with: measurementUuidPostEscape, options: .literal, range: nil)
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
}
