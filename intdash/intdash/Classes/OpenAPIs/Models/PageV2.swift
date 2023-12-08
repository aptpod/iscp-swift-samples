//
// PageV2.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct PageV2: Codable {

    /** 取得対象の総件数 */
    public var totalCount: Int64

    public init(totalCount: Int64) {
        self.totalCount = totalCount
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case totalCount = "total_count"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(totalCount, forKey: .totalCount)
    }
}

