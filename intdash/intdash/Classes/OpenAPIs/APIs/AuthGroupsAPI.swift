//
// AuthGroupsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class AuthGroupsAPI {

    /**
     Create Group
     
     - parameter createGroupRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createGroup(createGroupRequest: CreateGroupRequest? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Group?, _ error: Error?) -> Void)) {
        createGroupWithRequestBuilder(createGroupRequest: createGroupRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Create Group
     - POST /auth/groups
     - グループを作成します。
     - parameter createGroupRequest: (body)  (optional)
     - returns: RequestBuilder<Group> 
     */
    open class func createGroupWithRequestBuilder(createGroupRequest: CreateGroupRequest? = nil) -> RequestBuilder<Group> {
        let localVariablePath = "/auth/groups"
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: createGroupRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Group>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Create Sub Group
     
     - parameter groupUuid: (path) グループのUUID 
     - parameter createGroupRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createSubGroup(groupUuid: String, createGroupRequest: CreateGroupRequest? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Group?, _ error: Error?) -> Void)) {
        createSubGroupWithRequestBuilder(groupUuid: groupUuid, createGroupRequest: createGroupRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Create Sub Group
     - POST /auth/groups/{group_uuid}/groups
     - サブグループを作成します。
     - parameter groupUuid: (path) グループのUUID 
     - parameter createGroupRequest: (body)  (optional)
     - returns: RequestBuilder<Group> 
     */
    open class func createSubGroupWithRequestBuilder(groupUuid: String, createGroupRequest: CreateGroupRequest? = nil) -> RequestBuilder<Group> {
        var localVariablePath = "/auth/groups/{group_uuid}/groups"
        let groupUuidPreEscape = "\(APIHelper.mapValueToPathItem(groupUuid))"
        let groupUuidPostEscape = groupUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{group_uuid}", with: groupUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: createGroupRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Group>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Delete Group
     
     - parameter groupUuid: (path) グループのUUID 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteGroup(groupUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        deleteGroupWithRequestBuilder(groupUuid: groupUuid).execute(apiResponseQueue) { result in
            switch result {
            case .success:
                completion((), nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Delete Group
     - DELETE /auth/groups/{group_uuid}
     - グループを削除します。
     - parameter groupUuid: (path) グループのUUID 
     - returns: RequestBuilder<Void> 
     */
    open class func deleteGroupWithRequestBuilder(groupUuid: String) -> RequestBuilder<Void> {
        var localVariablePath = "/auth/groups/{group_uuid}"
        let groupUuidPreEscape = "\(APIHelper.mapValueToPathItem(groupUuid))"
        let groupUuidPostEscape = groupUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{group_uuid}", with: groupUuidPostEscape, options: .literal, range: nil)
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
     Get Group
     
     - parameter groupUuid: (path) グループのUUID 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getGroup(groupUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Group?, _ error: Error?) -> Void)) {
        getGroupWithRequestBuilder(groupUuid: groupUuid).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Group
     - GET /auth/groups/{group_uuid}
     - グループを取得します。
     - parameter groupUuid: (path) グループのUUID 
     - returns: RequestBuilder<Group> 
     */
    open class func getGroupWithRequestBuilder(groupUuid: String) -> RequestBuilder<Group> {
        var localVariablePath = "/auth/groups/{group_uuid}"
        let groupUuidPreEscape = "\(APIHelper.mapValueToPathItem(groupUuid))"
        let groupUuidPostEscape = groupUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{group_uuid}", with: groupUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Group>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     * enum for parameter sort
     */
    public enum Sort_listGroups: String, CaseIterable {
        case CreatedAt = "created_at"
        case CreatedAtAsc = "created_at+"
        case CreatedAtDesc = "created_at-"
        case UpdatedAt = "updated_at"
        case UpdatedAtAsc = "updated_at+"
        case UpdatedAtDesc = "updated_at-"
        case NameAt = "name_at"
        case NameAtAsc = "name_at+"
        case NameAtDesc = "name_at-"
    }

    /**
     List Groups
     
     - parameter page: (query) 取得するページの番号 (optional, default to 1)
     - parameter perPage: (query) 1回のリクエストで取得する件数 (optional, default to 30)
     - parameter sort: (query) 並べ替えに使用するキー。接尾辞 &#x60;+&#x60; を付けた場合は昇順、 &#x60;-&#x60; を付けた場合は降順で出力されます。 接尾辞を省略した場合は昇順となります。 例えば、 &#x60;name-&#x60; を指定すると、nameによる降順で出力されます。 (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func listGroups(page: Int? = nil, perPage: Int? = nil, sort: Sort_listGroups? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Groups?, _ error: Error?) -> Void)) {
        listGroupsWithRequestBuilder(page: page, perPage: perPage, sort: sort).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     List Groups
     - GET /auth/groups
     - グループのリストを取得します。
     - parameter page: (query) 取得するページの番号 (optional, default to 1)
     - parameter perPage: (query) 1回のリクエストで取得する件数 (optional, default to 30)
     - parameter sort: (query) 並べ替えに使用するキー。接尾辞 &#x60;+&#x60; を付けた場合は昇順、 &#x60;-&#x60; を付けた場合は降順で出力されます。 接尾辞を省略した場合は昇順となります。 例えば、 &#x60;name-&#x60; を指定すると、nameによる降順で出力されます。 (optional)
     - returns: RequestBuilder<Groups> 
     */
    open class func listGroupsWithRequestBuilder(page: Int? = nil, perPage: Int? = nil, sort: Sort_listGroups? = nil) -> RequestBuilder<Groups> {
        let localVariablePath = "/auth/groups"
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "page": page?.encodeToJSON(),
            "per_page": perPage?.encodeToJSON(),
            "sort": sort?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Groups>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     List My Groups
     
     - parameter page: (query) 取得するページの番号 (optional, default to 1)
     - parameter perPage: (query) 1回のリクエストで取得する件数 (optional, default to 30)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func listMyGroups(page: Int? = nil, perPage: Int? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Groups?, _ error: Error?) -> Void)) {
        listMyGroupsWithRequestBuilder(page: page, perPage: perPage).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     List My Groups
     - GET /auth/users/me/groups
     - 自分（ユーザー）が所属するグループのリストを取得します。
     - parameter page: (query) 取得するページの番号 (optional, default to 1)
     - parameter perPage: (query) 1回のリクエストで取得する件数 (optional, default to 30)
     - returns: RequestBuilder<Groups> 
     */
    open class func listMyGroupsWithRequestBuilder(page: Int? = nil, perPage: Int? = nil) -> RequestBuilder<Groups> {
        let localVariablePath = "/auth/users/me/groups"
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "page": page?.encodeToJSON(),
            "per_page": perPage?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Groups>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     * enum for parameter sort
     */
    public enum Sort_listSubGroup: String, CaseIterable {
        case CreatedAt = "created_at"
        case CreatedAtAsc = "created_at+"
        case CreatedAtDesc = "created_at-"
        case UpdatedAt = "updated_at"
        case UpdatedAtAsc = "updated_at+"
        case UpdatedAtDesc = "updated_at-"
        case NameAt = "name_at"
        case NameAtAsc = "name_at+"
        case NameAtDesc = "name_at-"
    }

    /**
     List Sub Groups
     
     - parameter groupUuid: (path) グループのUUID 
     - parameter page: (query) 取得するページの番号 (optional, default to 1)
     - parameter perPage: (query) 1回のリクエストで取得する件数 (optional, default to 30)
     - parameter sort: (query) 並べ替えに使用するキー。接尾辞 &#x60;+&#x60; を付けた場合は昇順、 &#x60;-&#x60; を付けた場合は降順で出力されます。 接尾辞を省略した場合は昇順となります。 例えば、 &#x60;name-&#x60; を指定すると、nameによる降順で出力されます。 (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func listSubGroup(groupUuid: String, page: Int? = nil, perPage: Int? = nil, sort: Sort_listSubGroup? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Groups?, _ error: Error?) -> Void)) {
        listSubGroupWithRequestBuilder(groupUuid: groupUuid, page: page, perPage: perPage, sort: sort).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     List Sub Groups
     - GET /auth/groups/{group_uuid}/groups
     - サブグループを取得します。
     - parameter groupUuid: (path) グループのUUID 
     - parameter page: (query) 取得するページの番号 (optional, default to 1)
     - parameter perPage: (query) 1回のリクエストで取得する件数 (optional, default to 30)
     - parameter sort: (query) 並べ替えに使用するキー。接尾辞 &#x60;+&#x60; を付けた場合は昇順、 &#x60;-&#x60; を付けた場合は降順で出力されます。 接尾辞を省略した場合は昇順となります。 例えば、 &#x60;name-&#x60; を指定すると、nameによる降順で出力されます。 (optional)
     - returns: RequestBuilder<Groups> 
     */
    open class func listSubGroupWithRequestBuilder(groupUuid: String, page: Int? = nil, perPage: Int? = nil, sort: Sort_listSubGroup? = nil) -> RequestBuilder<Groups> {
        var localVariablePath = "/auth/groups/{group_uuid}/groups"
        let groupUuidPreEscape = "\(APIHelper.mapValueToPathItem(groupUuid))"
        let groupUuidPostEscape = groupUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{group_uuid}", with: groupUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "page": page?.encodeToJSON(),
            "per_page": perPage?.encodeToJSON(),
            "sort": sort?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Groups>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Update Group
     
     - parameter groupUuid: (path) グループのUUID 
     - parameter updateGroupRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func updateGroup(groupUuid: String, updateGroupRequest: UpdateGroupRequest? = nil, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Group?, _ error: Error?) -> Void)) {
        updateGroupWithRequestBuilder(groupUuid: groupUuid, updateGroupRequest: updateGroupRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Update Group
     - PATCH /auth/groups/{group_uuid}
     - グループを更新します。
     - parameter groupUuid: (path) グループのUUID 
     - parameter updateGroupRequest: (body)  (optional)
     - returns: RequestBuilder<Group> 
     */
    open class func updateGroupWithRequestBuilder(groupUuid: String, updateGroupRequest: UpdateGroupRequest? = nil) -> RequestBuilder<Group> {
        var localVariablePath = "/auth/groups/{group_uuid}"
        let groupUuidPreEscape = "\(APIHelper.mapValueToPathItem(groupUuid))"
        let groupUuidPostEscape = groupUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{group_uuid}", with: groupUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: updateGroupRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Group>.Type = intdashAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "PATCH", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}
