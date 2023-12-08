//
// AssignOwnerRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct AssignOwnerRequest: Codable {

    /** 所有者とするユーザーのUUID */
    public var userUuid: String

    public init(userUuid: String) {
        self.userUuid = userUuid
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case userUuid = "user_uuid"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userUuid, forKey: .userUuid)
    }
}

