//
// AddProjectMemberRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct AddProjectMemberRequest: Codable {

    /** ユーザーのメールアドレス。`user_uuid` といずれか必須です。`user_uuid` を優先します。 */
    public var userEmailAddress: String
    /** ユーザーのUUID。`user_email_address` といずれか必須です。`user_uuid` を優先します。 */
    public var userUuid: String
    /** ユーザーに割り当てるロールのUUID */
    public var roleUuids: [String]

    public init(userEmailAddress: String, userUuid: String, roleUuids: [String]) {
        self.userEmailAddress = userEmailAddress
        self.userUuid = userUuid
        self.roleUuids = roleUuids
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case userEmailAddress = "user_email_address"
        case userUuid = "user_uuid"
        case roleUuids = "role_uuids"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userEmailAddress, forKey: .userEmailAddress)
        try container.encode(userUuid, forKey: .userUuid)
        try container.encode(roleUuids, forKey: .roleUuids)
    }
}

