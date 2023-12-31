//
// MeasMeasurementJobsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class MeasMeasurementJobsAPI {

    /**
     Cancel Measurement Job
     
     - parameter jobUuid: (path) ジョブのUUID 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func cancelMeasurementJob(jobUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        cancelMeasurementJobWithRequestBuilder(jobUuid: jobUuid).execute(apiResponseQueue) { result in
            switch result {
            case .success:
                completion((), nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Cancel Measurement Job
     - PUT /v1/measurements/jobs/{job_uuid}/cancel
     - ジョブをキャンセルします。
     - parameter jobUuid: (path) ジョブのUUID 
     - returns: RequestBuilder<Void> 
     */
    open class func cancelMeasurementJobWithRequestBuilder(jobUuid: String) -> RequestBuilder<Void> {
        var localVariablePath = "/v1/measurements/jobs/{job_uuid}/cancel"
        let jobUuidPreEscape = "\(APIHelper.mapValueToPathItem(jobUuid))"
        let jobUuidPostEscape = jobUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{job_uuid}", with: jobUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = intdashAPI.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "PUT", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Cancel Project Measurement Job
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter jobUuid: (path) ジョブのUUID 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func cancelProjectMeasurementJob(projectUuid: String, jobUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        cancelProjectMeasurementJobWithRequestBuilder(projectUuid: projectUuid, jobUuid: jobUuid).execute(apiResponseQueue) { result in
            switch result {
            case .success:
                completion((), nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Cancel Project Measurement Job
     - PUT /v1/projects/{project_uuid}/measurements/jobs/{job_uuid}/cancel
     - ジョブをキャンセルします。
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter jobUuid: (path) ジョブのUUID 
     - returns: RequestBuilder<Void> 
     */
    open class func cancelProjectMeasurementJobWithRequestBuilder(projectUuid: String, jobUuid: String) -> RequestBuilder<Void> {
        var localVariablePath = "/v1/projects/{project_uuid}/measurements/jobs/{job_uuid}/cancel"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let jobUuidPreEscape = "\(APIHelper.mapValueToPathItem(jobUuid))"
        let jobUuidPostEscape = jobUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{job_uuid}", with: jobUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = intdashAPI.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "PUT", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Delete Measurement Job
     
     - parameter jobUuid: (path) ジョブのUUID 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteMeasurementJob(jobUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        deleteMeasurementJobWithRequestBuilder(jobUuid: jobUuid).execute(apiResponseQueue) { result in
            switch result {
            case .success:
                completion((), nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Delete Measurement Job
     - DELETE /v1/measurements/jobs/{job_uuid}
     - ジョブを削除します。
     - parameter jobUuid: (path) ジョブのUUID 
     - returns: RequestBuilder<Void> 
     */
    open class func deleteMeasurementJobWithRequestBuilder(jobUuid: String) -> RequestBuilder<Void> {
        var localVariablePath = "/v1/measurements/jobs/{job_uuid}"
        let jobUuidPreEscape = "\(APIHelper.mapValueToPathItem(jobUuid))"
        let jobUuidPostEscape = jobUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{job_uuid}", with: jobUuidPostEscape, options: .literal, range: nil)
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
     Delete Project Measurement Job
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter jobUuid: (path) ジョブのUUID 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteProjectMeasurementJob(projectUuid: String, jobUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        deleteProjectMeasurementJobWithRequestBuilder(projectUuid: projectUuid, jobUuid: jobUuid).execute(apiResponseQueue) { result in
            switch result {
            case .success:
                completion((), nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Delete Project Measurement Job
     - DELETE /v1/projects/{project_uuid}/measurements/jobs/{job_uuid}
     - ジョブを削除します。
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter jobUuid: (path) ジョブのUUID 
     - returns: RequestBuilder<Void> 
     */
    open class func deleteProjectMeasurementJobWithRequestBuilder(projectUuid: String, jobUuid: String) -> RequestBuilder<Void> {
        var localVariablePath = "/v1/projects/{project_uuid}/measurements/jobs/{job_uuid}"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let jobUuidPreEscape = "\(APIHelper.mapValueToPathItem(jobUuid))"
        let jobUuidPostEscape = jobUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{job_uuid}", with: jobUuidPostEscape, options: .literal, range: nil)
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
     Get Measurement Job
     
     - parameter jobUuid: (path) ジョブのUUID 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getMeasurementJob(jobUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: MeasurementJob?, _ error: Error?) -> Void)) {
        getMeasurementJobWithRequestBuilder(jobUuid: jobUuid).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Measurement Job
     - GET /v1/measurements/jobs/{job_uuid}
     - ジョブを取得します。
     - parameter jobUuid: (path) ジョブのUUID 
     - returns: RequestBuilder<MeasurementJob> 
     */
    open class func getMeasurementJobWithRequestBuilder(jobUuid: String) -> RequestBuilder<MeasurementJob> {
        var localVariablePath = "/v1/measurements/jobs/{job_uuid}"
        let jobUuidPreEscape = "\(APIHelper.mapValueToPathItem(jobUuid))"
        let jobUuidPostEscape = jobUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{job_uuid}", with: jobUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<MeasurementJob>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Get Project Measurement Job
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter jobUuid: (path) ジョブのUUID 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getProjectMeasurementJob(projectUuid: String, jobUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: MeasurementJob?, _ error: Error?) -> Void)) {
        getProjectMeasurementJobWithRequestBuilder(projectUuid: projectUuid, jobUuid: jobUuid).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Project Measurement Job
     - GET /v1/projects/{project_uuid}/measurements/jobs/{job_uuid}
     - ジョブを取得します。
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter jobUuid: (path) ジョブのUUID 
     - returns: RequestBuilder<MeasurementJob> 
     */
    open class func getProjectMeasurementJobWithRequestBuilder(projectUuid: String, jobUuid: String) -> RequestBuilder<MeasurementJob> {
        var localVariablePath = "/v1/projects/{project_uuid}/measurements/jobs/{job_uuid}"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let jobUuidPreEscape = "\(APIHelper.mapValueToPathItem(jobUuid))"
        let jobUuidPostEscape = jobUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{job_uuid}", with: jobUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<MeasurementJob>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     * enum for parameter sort
     */
    public enum Sort_listMeasurementJobs: String, CaseIterable {
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    /**
     * enum for parameter status
     */
    public enum Status_listMeasurementJobs: String, CaseIterable {
        case ready = "ready"
        case processing = "processing"
        case succeeded = "succeeded"
        case failed = "failed"
        case cancelled = "cancelled"
    }

    /**
     * enum for parameter order
     */
    public enum Order_listMeasurementJobs: String, CaseIterable {
        case asc = "asc"
        case desc = "desc"
    }

    /**
     List Measurement Jobs
     
     - parameter limit: (query) 1回のリクエストで取得する件数 (optional)
     - parameter sort: (query) 並べ替えに使用するキー (optional, default to .createdAt)
     - parameter status: (query) ジョブのステータス (optional)
     - parameter page: (query) 取得するページの番号 (optional)
     - parameter order: (query) 並べ替えの順序 (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func listMeasurementJobs(limit: Int? = nil, sort: Sort_listMeasurementJobs? = nil, status: Status_listMeasurementJobs? = nil, page: Int? = nil, order: Order_listMeasurementJobs? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: MeasurementJobs?, _ error: Error?) -> Void)) {
        listMeasurementJobsWithRequestBuilder(limit: limit, sort: sort, status: status, page: page, order: order).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     List Measurement Jobs
     - GET /v1/measurements/jobs
     - ジョブ（CSVファイルを計測に変換するジョブなど）のリストを取得します。
     - parameter limit: (query) 1回のリクエストで取得する件数 (optional)
     - parameter sort: (query) 並べ替えに使用するキー (optional, default to .createdAt)
     - parameter status: (query) ジョブのステータス (optional)
     - parameter page: (query) 取得するページの番号 (optional)
     - parameter order: (query) 並べ替えの順序 (optional)
     - returns: RequestBuilder<MeasurementJobs> 
     */
    open class func listMeasurementJobsWithRequestBuilder(limit: Int? = nil, sort: Sort_listMeasurementJobs? = nil, status: Status_listMeasurementJobs? = nil, page: Int? = nil, order: Order_listMeasurementJobs? = nil) -> RequestBuilder<MeasurementJobs> {
        let localVariablePath = "/v1/measurements/jobs"
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "limit": limit?.encodeToJSON(),
            "sort": sort?.encodeToJSON(),
            "status": status?.encodeToJSON(),
            "page": page?.encodeToJSON(),
            "order": order?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<MeasurementJobs>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     * enum for parameter sort
     */
    public enum Sort_listProjectMeasurementJobs: String, CaseIterable {
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    /**
     * enum for parameter status
     */
    public enum Status_listProjectMeasurementJobs: String, CaseIterable {
        case ready = "ready"
        case processing = "processing"
        case succeeded = "succeeded"
        case failed = "failed"
        case cancelled = "cancelled"
    }

    /**
     * enum for parameter order
     */
    public enum Order_listProjectMeasurementJobs: String, CaseIterable {
        case asc = "asc"
        case desc = "desc"
    }

    /**
     List Project Measurement Jobs
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter limit: (query) 1回のリクエストで取得する件数 (optional)
     - parameter sort: (query) 並べ替えに使用するキー (optional, default to .createdAt)
     - parameter status: (query) ジョブのステータス (optional)
     - parameter page: (query) 取得するページの番号 (optional)
     - parameter order: (query) 並べ替えの順序 (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func listProjectMeasurementJobs(projectUuid: String, limit: Int? = nil, sort: Sort_listProjectMeasurementJobs? = nil, status: Status_listProjectMeasurementJobs? = nil, page: Int? = nil, order: Order_listProjectMeasurementJobs? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: MeasurementJobs?, _ error: Error?) -> Void)) {
        listProjectMeasurementJobsWithRequestBuilder(projectUuid: projectUuid, limit: limit, sort: sort, status: status, page: page, order: order).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     List Project Measurement Jobs
     - GET /v1/projects/{project_uuid}/measurements/jobs
     - ジョブ（CSVファイルを計測に変換するジョブなど）のリストを取得します。
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter limit: (query) 1回のリクエストで取得する件数 (optional)
     - parameter sort: (query) 並べ替えに使用するキー (optional, default to .createdAt)
     - parameter status: (query) ジョブのステータス (optional)
     - parameter page: (query) 取得するページの番号 (optional)
     - parameter order: (query) 並べ替えの順序 (optional)
     - returns: RequestBuilder<MeasurementJobs> 
     */
    open class func listProjectMeasurementJobsWithRequestBuilder(projectUuid: String, limit: Int? = nil, sort: Sort_listProjectMeasurementJobs? = nil, status: Status_listProjectMeasurementJobs? = nil, page: Int? = nil, order: Order_listProjectMeasurementJobs? = nil) -> RequestBuilder<MeasurementJobs> {
        var localVariablePath = "/v1/projects/{project_uuid}/measurements/jobs"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "limit": limit?.encodeToJSON(),
            "sort": sort?.encodeToJSON(),
            "status": status?.encodeToJSON(),
            "page": page?.encodeToJSON(),
            "order": order?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<MeasurementJobs>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}
