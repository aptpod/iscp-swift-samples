//
// Job.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Job: Codable {

    /** ジョブのUUID */
    public var uuid: String
    /** 計測のUUID */
    public var measUuid: String
    public var type: JobType
    public var status: JobStatus
    /** ステータスの説明 */
    public var message: String
    /** ジョブが作成された日時 */
    public var createdAt: Date
    /** ジョブの最終更新日時 */
    public var updatedAt: Date

    public init(uuid: String, measUuid: String, type: JobType, status: JobStatus, message: String, createdAt: Date, updatedAt: Date) {
        self.uuid = uuid
        self.measUuid = measUuid
        self.type = type
        self.status = status
        self.message = message
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case uuid
        case measUuid = "meas_uuid"
        case type
        case status
        case message
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(uuid, forKey: .uuid)
        try container.encode(measUuid, forKey: .measUuid)
        try container.encode(type, forKey: .type)
        try container.encode(status, forKey: .status)
        try container.encode(message, forKey: .message)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
    }
}

