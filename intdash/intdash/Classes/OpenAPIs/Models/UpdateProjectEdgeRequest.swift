//
// UpdateProjectEdgeRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct UpdateProjectEdgeRequest: Codable {

    /** プロジェクトにおけるエッジのニックネーム */
    public var nickname: String?

    public init(nickname: String? = nil) {
        self.nickname = nickname
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case nickname
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(nickname, forKey: .nickname)
    }
}
