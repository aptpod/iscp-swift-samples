//
// MeasurementMarkersWithoutPage.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct MeasurementMarkersWithoutPage: Codable {

    public var items: [MeasurementMarker]

    public init(items: [MeasurementMarker]) {
        self.items = items
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case items
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(items, forKey: .items)
    }
}
