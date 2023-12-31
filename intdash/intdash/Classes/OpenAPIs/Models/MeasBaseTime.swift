//
// MeasBaseTime.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct MeasBaseTime: Codable {

    public var type: MeasurementBaseTimeType
    /** 基準時刻（計測が開始された時刻）（RFC3339形式） */
    public var basetime: String
    /** 基準時刻の作成日時 */
    public var createdAt: String
    /** 基準時刻の最終更新日時 */
    public var updatedAt: String

    public init(type: MeasurementBaseTimeType, basetime: String, createdAt: String, updatedAt: String) {
        self.type = type
        self.basetime = basetime
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case basetime
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(basetime, forKey: .basetime)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
    }
}

