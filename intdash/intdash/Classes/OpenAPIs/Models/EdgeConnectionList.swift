//
// EdgeConnectionList.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct EdgeConnectionList: Codable {

    public var items: [EdgeConnectionItem]
    public var page: EdgeConnectionListPage

    public init(items: [EdgeConnectionItem], page: EdgeConnectionListPage) {
        self.items = items
        self.page = page
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case items
        case page
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(items, forKey: .items)
        try container.encode(page, forKey: .page)
    }
}

