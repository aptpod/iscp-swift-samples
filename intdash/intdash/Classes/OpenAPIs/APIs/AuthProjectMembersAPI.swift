//
// AuthProjectMembersAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class AuthProjectMembersAPI {

    /**
     Add Project Member
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter addProjectMemberRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func addProjectMember(projectUuid: String, addProjectMemberRequest: AddProjectMemberRequest? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Member?, _ error: Error?) -> Void)) {
        addProjectMemberWithRequestBuilder(projectUuid: projectUuid, addProjectMemberRequest: addProjectMemberRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Add Project Member
     - POST /auth/projects/{project_uuid}/members
     - プロジェクトメンバーを追加します。
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter addProjectMemberRequest: (body)  (optional)
     - returns: RequestBuilder<Member> 
     */
    open class func addProjectMemberWithRequestBuilder(projectUuid: String, addProjectMemberRequest: AddProjectMemberRequest? = nil) -> RequestBuilder<Member> {
        var localVariablePath = "/auth/projects/{project_uuid}/members"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: addProjectMemberRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Member>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Add Project Owner Attribute
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter userUuid: (path)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func addProjectOwnerAttribute(projectUuid: String, userUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Member?, _ error: Error?) -> Void)) {
        addProjectOwnerAttributeWithRequestBuilder(projectUuid: projectUuid, userUuid: userUuid).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Add Project Owner Attribute
     - PUT /auth/projects/{project_uuid}/members/{user_uuid}/owner
     - オーナー属性を追加します。オーナー属性を追加したメンバーは自動的にそのプロジェクトにおける全ての権限が付与されます。
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter userUuid: (path)  
     - returns: RequestBuilder<Member> 
     */
    open class func addProjectOwnerAttributeWithRequestBuilder(projectUuid: String, userUuid: String) -> RequestBuilder<Member> {
        var localVariablePath = "/auth/projects/{project_uuid}/members/{user_uuid}/owner"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let userUuidPreEscape = "\(APIHelper.mapValueToPathItem(userUuid))"
        let userUuidPostEscape = userUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{user_uuid}", with: userUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Member>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "PUT", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Get Project Member
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter userUuid: (path)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getProjectMember(projectUuid: String, userUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Member?, _ error: Error?) -> Void)) {
        getProjectMemberWithRequestBuilder(projectUuid: projectUuid, userUuid: userUuid).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Project Member
     - GET /auth/projects/{project_uuid}/members/{user_uuid}
     - プロジェクトメンバーを取得します。
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter userUuid: (path)  
     - returns: RequestBuilder<Member> 
     */
    open class func getProjectMemberWithRequestBuilder(projectUuid: String, userUuid: String) -> RequestBuilder<Member> {
        var localVariablePath = "/auth/projects/{project_uuid}/members/{user_uuid}"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let userUuidPreEscape = "\(APIHelper.mapValueToPathItem(userUuid))"
        let userUuidPostEscape = userUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{user_uuid}", with: userUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Member>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     List Project Members
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter userUuid: (query) ユーザーのUUID (optional)
     - parameter page: (query) 取得するページの番号 (optional, default to 1)
     - parameter perPage: (query) 1回のリクエストで取得する件数 (optional, default to 30)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func listProjectMembers(projectUuid: String, userUuid: [String]? = nil, page: Int? = nil, perPage: Int? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Members?, _ error: Error?) -> Void)) {
        listProjectMembersWithRequestBuilder(projectUuid: projectUuid, userUuid: userUuid, page: page, perPage: perPage).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     List Project Members
     - GET /auth/projects/{project_uuid}/members
     - プロジェクトメンバーリストを取得します。
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter userUuid: (query) ユーザーのUUID (optional)
     - parameter page: (query) 取得するページの番号 (optional, default to 1)
     - parameter perPage: (query) 1回のリクエストで取得する件数 (optional, default to 30)
     - returns: RequestBuilder<Members> 
     */
    open class func listProjectMembersWithRequestBuilder(projectUuid: String, userUuid: [String]? = nil, page: Int? = nil, perPage: Int? = nil) -> RequestBuilder<Members> {
        var localVariablePath = "/auth/projects/{project_uuid}/members"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "user_uuid": userUuid?.encodeToJSON(),
            "page": page?.encodeToJSON(),
            "per_page": perPage?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Members>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Remove Project Member
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter userUuid: (path)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func removeProjectMember(projectUuid: String, userUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        removeProjectMemberWithRequestBuilder(projectUuid: projectUuid, userUuid: userUuid).execute(apiResponseQueue) { result in
            switch result {
            case .success:
                completion((), nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Remove Project Member
     - DELETE /auth/projects/{project_uuid}/members/{user_uuid}
     - プロジェクトからメンバーを外します。
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter userUuid: (path)  
     - returns: RequestBuilder<Void> 
     */
    open class func removeProjectMemberWithRequestBuilder(projectUuid: String, userUuid: String) -> RequestBuilder<Void> {
        var localVariablePath = "/auth/projects/{project_uuid}/members/{user_uuid}"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let userUuidPreEscape = "\(APIHelper.mapValueToPathItem(userUuid))"
        let userUuidPostEscape = userUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{user_uuid}", with: userUuidPostEscape, options: .literal, range: nil)
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
     Remove Project Owner Attribute
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter userUuid: (path)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func removeProjectOwnerAttribute(projectUuid: String, userUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        removeProjectOwnerAttributeWithRequestBuilder(projectUuid: projectUuid, userUuid: userUuid).execute(apiResponseQueue) { result in
            switch result {
            case .success:
                completion((), nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Remove Project Owner Attribute
     - DELETE /auth/projects/{project_uuid}/members/{user_uuid}/owner
     - オーナー属性を取り除きます。
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter userUuid: (path)  
     - returns: RequestBuilder<Void> 
     */
    open class func removeProjectOwnerAttributeWithRequestBuilder(projectUuid: String, userUuid: String) -> RequestBuilder<Void> {
        var localVariablePath = "/auth/projects/{project_uuid}/members/{user_uuid}/owner"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let userUuidPreEscape = "\(APIHelper.mapValueToPathItem(userUuid))"
        let userUuidPostEscape = userUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{user_uuid}", with: userUuidPostEscape, options: .literal, range: nil)
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
     Update Project Member
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter userUuid: (path)  
     - parameter updateProjectMemberRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func updateProjectMember(projectUuid: String, userUuid: String, updateProjectMemberRequest: UpdateProjectMemberRequest? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Member?, _ error: Error?) -> Void)) {
        updateProjectMemberWithRequestBuilder(projectUuid: projectUuid, userUuid: userUuid, updateProjectMemberRequest: updateProjectMemberRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Update Project Member
     - PATCH /auth/projects/{project_uuid}/members/{user_uuid}
     - プロジェクトメンバーを更新します。
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter userUuid: (path)  
     - parameter updateProjectMemberRequest: (body)  (optional)
     - returns: RequestBuilder<Member> 
     */
    open class func updateProjectMemberWithRequestBuilder(projectUuid: String, userUuid: String, updateProjectMemberRequest: UpdateProjectMemberRequest? = nil) -> RequestBuilder<Member> {
        var localVariablePath = "/auth/projects/{project_uuid}/members/{user_uuid}"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let userUuidPreEscape = "\(APIHelper.mapValueToPathItem(userUuid))"
        let userUuidPostEscape = userUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{user_uuid}", with: userUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: updateProjectMemberRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Member>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "PATCH", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}
