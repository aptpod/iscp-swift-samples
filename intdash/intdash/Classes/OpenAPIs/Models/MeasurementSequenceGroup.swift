//
// MeasurementSequenceGroup.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct MeasurementSequenceGroup: Codable {

    /** 計測シーケンスのUUID */
    public var uuid: String
    /** この計測シーケンスでサーバーが受信することが想定されるデータポイントの総数 （既に受信済みのデータポイントを含む） */
    public var expectedDataPoints: Int?
    /** 最後の計測シーケンスの番号 */
    public var finalSequenceNumber: Int?
    /** 作成日時 */
    public var createdAt: Date
    /** 最終更新日時 */
    public var updatedAt: Date

    public init(uuid: String, expectedDataPoints: Int? = nil, finalSequenceNumber: Int? = nil, createdAt: Date, updatedAt: Date) {
        self.uuid = uuid
        self.expectedDataPoints = expectedDataPoints
        self.finalSequenceNumber = finalSequenceNumber
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case uuid
        case expectedDataPoints = "expected_data_points"
        case finalSequenceNumber = "final_sequence_number"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(uuid, forKey: .uuid)
        try container.encodeIfPresent(expectedDataPoints, forKey: .expectedDataPoints)
        try container.encodeIfPresent(finalSequenceNumber, forKey: .finalSequenceNumber)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
    }
}
