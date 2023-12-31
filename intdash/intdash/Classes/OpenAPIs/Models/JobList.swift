//
// JobList.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct JobList: Codable {

    public var items: [Job]
    /** 取得対象の総件数 */
    public var totalCount: Double

    public init(items: [Job], totalCount: Double) {
        self.items = items
        self.totalCount = totalCount
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case items
        case totalCount = "total_count"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(items, forKey: .items)
        try container.encode(totalCount, forKey: .totalCount)
    }
}

