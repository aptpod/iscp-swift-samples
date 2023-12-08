//
// MeasReplace.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct MeasReplace: Codable {

    /** 計測の名前 */
    public var name: String?
    /** 計測の説明 */
    public var description: String?
    /** 計測の基準時刻 */
    public var basetime: Date?
    public var basetimeType: MeasurementBaseTimeType?

    public init(name: String? = nil, description: String? = nil, basetime: Date? = nil, basetimeType: MeasurementBaseTimeType? = nil) {
        self.name = name
        self.description = description
        self.basetime = basetime
        self.basetimeType = basetimeType
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case description
        case basetime
        case basetimeType = "basetime_type"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(basetime, forKey: .basetime)
        try container.encodeIfPresent(basetimeType, forKey: .basetimeType)
    }
}

