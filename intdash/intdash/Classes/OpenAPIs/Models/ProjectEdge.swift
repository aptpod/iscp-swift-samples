//
// ProjectEdge.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ProjectEdge: Codable {

    /** エッジのUUID */
    public var edgeUuid: String
    /** エッジの名前 */
    public var name: String
    /** プロジェクトにおけるエッジのニックネーム */
    public var nickname: String
    /** 作成日時 */
    public var createdAt: Date
    /** 最終更新日時 */
    public var updatedAt: Date

    public init(edgeUuid: String, name: String, nickname: String, createdAt: Date, updatedAt: Date) {
        self.edgeUuid = edgeUuid
        self.name = name
        self.nickname = nickname
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case edgeUuid = "edge_uuid"
        case name
        case nickname
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(edgeUuid, forKey: .edgeUuid)
        try container.encode(name, forKey: .name)
        try container.encode(nickname, forKey: .nickname)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
    }
}

