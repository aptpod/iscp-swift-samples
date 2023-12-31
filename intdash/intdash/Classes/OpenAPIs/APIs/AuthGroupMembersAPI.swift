//
// AuthGroupMembersAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class AuthGroupMembersAPI {

    /**
     Add Group Member
     
     - parameter groupUuid: (path) グループのUUID 
     - parameter addGroupMemberRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func addGroupMember(groupUuid: String, addGroupMemberRequest: AddGroupMemberRequest? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Member?, _ error: Error?) -> Void)) {
        addGroupMemberWithRequestBuilder(groupUuid: groupUuid, addGroupMemberRequest: addGroupMemberRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Add Group Member
     - POST /auth/groups/{group_uuid}/members
     - グループメンバーを追加します。
     - parameter groupUuid: (path) グループのUUID 
     - parameter addGroupMemberRequest: (body)  (optional)
     - returns: RequestBuilder<Member> 
     */
    open class func addGroupMemberWithRequestBuilder(groupUuid: String, addGroupMemberRequest: AddGroupMemberRequest? = nil) -> RequestBuilder<Member> {
        var localVariablePath = "/auth/groups/{group_uuid}/members"
        let groupUuidPreEscape = "\(APIHelper.mapValueToPathItem(groupUuid))"
        let groupUuidPostEscape = groupUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{group_uuid}", with: groupUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: addGroupMemberRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Member>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Add Group Owner Attribute
     
     - parameter groupUuid: (path) グループのUUID 
     - parameter userUuid: (path)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func addGroupOwnerAttribute(groupUuid: String, userUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Member?, _ error: Error?) -> Void)) {
        addGroupOwnerAttributeWithRequestBuilder(groupUuid: groupUuid, userUuid: userUuid).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Add Group Owner Attribute
     - PUT /auth/groups/{group_uuid}/members/{user_uuid}/owner
     - オーナー属性を追加します。オーナー属性を追加したメンバーは自動的にそのグループにおける全ての権限が付与されます。
     - parameter groupUuid: (path) グループのUUID 
     - parameter userUuid: (path)  
     - returns: RequestBuilder<Member> 
     */
    open class func addGroupOwnerAttributeWithRequestBuilder(groupUuid: String, userUuid: String) -> RequestBuilder<Member> {
        var localVariablePath = "/auth/groups/{group_uuid}/members/{user_uuid}/owner"
        let groupUuidPreEscape = "\(APIHelper.mapValueToPathItem(groupUuid))"
        let groupUuidPostEscape = groupUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{group_uuid}", with: groupUuidPostEscape, options: .literal, range: nil)
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
     Get Group Member
     
     - parameter groupUuid: (path) グループのUUID 
     - parameter userUuid: (path)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getGroupMember(groupUuid: String, userUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Member?, _ error: Error?) -> Void)) {
        getGroupMemberWithRequestBuilder(groupUuid: groupUuid, userUuid: userUuid).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Group Member
     - GET /auth/groups/{group_uuid}/members/{user_uuid}
     - グループメンバーを取得します。
     - parameter groupUuid: (path) グループのUUID 
     - parameter userUuid: (path)  
     - returns: RequestBuilder<Member> 
     */
    open class func getGroupMemberWithRequestBuilder(groupUuid: String, userUuid: String) -> RequestBuilder<Member> {
        var localVariablePath = "/auth/groups/{group_uuid}/members/{user_uuid}"
        let groupUuidPreEscape = "\(APIHelper.mapValueToPathItem(groupUuid))"
        let groupUuidPostEscape = groupUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{group_uuid}", with: groupUuidPostEscape, options: .literal, range: nil)
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
     List Group Members
     
     - parameter groupUuid: (path) グループのUUID 
     - parameter userUuid: (query) ユーザーのUUID (optional)
     - parameter page: (query) 取得するページの番号 (optional, default to 1)
     - parameter perPage: (query) 1回のリクエストで取得する件数 (optional, default to 30)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func listGroupMembers(groupUuid: String, userUuid: [String]? = nil, page: Int? = nil, perPage: Int? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Members?, _ error: Error?) -> Void)) {
        listGroupMembersWithRequestBuilder(groupUuid: groupUuid, userUuid: userUuid, page: page, perPage: perPage).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     List Group Members
     - GET /auth/groups/{group_uuid}/members
     - グループメンバーリストを取得します。
     - parameter groupUuid: (path) グループのUUID 
     - parameter userUuid: (query) ユーザーのUUID (optional)
     - parameter page: (query) 取得するページの番号 (optional, default to 1)
     - parameter perPage: (query) 1回のリクエストで取得する件数 (optional, default to 30)
     - returns: RequestBuilder<Members> 
     */
    open class func listGroupMembersWithRequestBuilder(groupUuid: String, userUuid: [String]? = nil, page: Int? = nil, perPage: Int? = nil) -> RequestBuilder<Members> {
        var localVariablePath = "/auth/groups/{group_uuid}/members"
        let groupUuidPreEscape = "\(APIHelper.mapValueToPathItem(groupUuid))"
        let groupUuidPostEscape = groupUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{group_uuid}", with: groupUuidPostEscape, options: .literal, range: nil)
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
     Remove Group Member
     
     - parameter groupUuid: (path) グループのUUID 
     - parameter userUuid: (path)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func removeGroupMember(groupUuid: String, userUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        removeGroupMemberWithRequestBuilder(groupUuid: groupUuid, userUuid: userUuid).execute(apiResponseQueue) { result in
            switch result {
            case .success:
                completion((), nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Remove Group Member
     - DELETE /auth/groups/{group_uuid}/members/{user_uuid}
     - グループメンバーを除名します。
     - parameter groupUuid: (path) グループのUUID 
     - parameter userUuid: (path)  
     - returns: RequestBuilder<Void> 
     */
    open class func removeGroupMemberWithRequestBuilder(groupUuid: String, userUuid: String) -> RequestBuilder<Void> {
        var localVariablePath = "/auth/groups/{group_uuid}/members/{user_uuid}"
        let groupUuidPreEscape = "\(APIHelper.mapValueToPathItem(groupUuid))"
        let groupUuidPostEscape = groupUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{group_uuid}", with: groupUuidPostEscape, options: .literal, range: nil)
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
     Remove Group Owner Attribute
     
     - parameter groupUuid: (path) グループのUUID 
     - parameter userUuid: (path)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func removeGroupOwnerAttribute(groupUuid: String, userUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        removeGroupOwnerAttributeWithRequestBuilder(groupUuid: groupUuid, userUuid: userUuid).execute(apiResponseQueue) { result in
            switch result {
            case .success:
                completion((), nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Remove Group Owner Attribute
     - DELETE /auth/groups/{group_uuid}/members/{user_uuid}/owner
     - オーナー属性を取り除きます。
     - parameter groupUuid: (path) グループのUUID 
     - parameter userUuid: (path)  
     - returns: RequestBuilder<Void> 
     */
    open class func removeGroupOwnerAttributeWithRequestBuilder(groupUuid: String, userUuid: String) -> RequestBuilder<Void> {
        var localVariablePath = "/auth/groups/{group_uuid}/members/{user_uuid}/owner"
        let groupUuidPreEscape = "\(APIHelper.mapValueToPathItem(groupUuid))"
        let groupUuidPostEscape = groupUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{group_uuid}", with: groupUuidPostEscape, options: .literal, range: nil)
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
     Update Group Member
     
     - parameter groupUuid: (path) グループのUUID 
     - parameter userUuid: (path)  
     - parameter updateGroupMemberRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func updateGroupMember(groupUuid: String, userUuid: String, updateGroupMemberRequest: UpdateGroupMemberRequest? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Member?, _ error: Error?) -> Void)) {
        updateGroupMemberWithRequestBuilder(groupUuid: groupUuid, userUuid: userUuid, updateGroupMemberRequest: updateGroupMemberRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Update Group Member
     - PATCH /auth/groups/{group_uuid}/members/{user_uuid}
     - グループメンバーを更新します。
     - parameter groupUuid: (path) グループのUUID 
     - parameter userUuid: (path)  
     - parameter updateGroupMemberRequest: (body)  (optional)
     - returns: RequestBuilder<Member> 
     */
    open class func updateGroupMemberWithRequestBuilder(groupUuid: String, userUuid: String, updateGroupMemberRequest: UpdateGroupMemberRequest? = nil) -> RequestBuilder<Member> {
        var localVariablePath = "/auth/groups/{group_uuid}/members/{user_uuid}"
        let groupUuidPreEscape = "\(APIHelper.mapValueToPathItem(groupUuid))"
        let groupUuidPostEscape = groupUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{group_uuid}", with: groupUuidPostEscape, options: .literal, range: nil)
        let userUuidPreEscape = "\(APIHelper.mapValueToPathItem(userUuid))"
        let userUuidPostEscape = userUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{user_uuid}", with: userUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: updateGroupMemberRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Member>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "PATCH", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}
