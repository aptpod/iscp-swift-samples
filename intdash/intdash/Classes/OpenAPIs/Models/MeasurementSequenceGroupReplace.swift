//
// MeasurementSequenceGroupReplace.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct MeasurementSequenceGroupReplace: Codable {

    /** この計測シーケンスでサーバーが受信することが想定されるデータポイントの総数 （既に受信済みのデータポイントを含む） */
    public var expectedDataPoints: Int?
    /** 最後の計測シーケンスの番号 */
    public var finalSequenceNumber: Int?

    public init(expectedDataPoints: Int? = nil, finalSequenceNumber: Int? = nil) {
        self.expectedDataPoints = expectedDataPoints
        self.finalSequenceNumber = finalSequenceNumber
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case expectedDataPoints = "expected_data_points"
        case finalSequenceNumber = "final_sequence_number"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(expectedDataPoints, forKey: .expectedDataPoints)
        try container.encodeIfPresent(finalSequenceNumber, forKey: .finalSequenceNumber)
    }
}

