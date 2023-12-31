//
// DataPointErrorAllOf.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct DataPointErrorAllOf: Codable {

    /** エラーが発生した場合、 `<channel>/intdash/measurement/get/data/error` */
    public var dataId: String?
    public var data: DataPointDataError?

    public init(dataId: String? = nil, data: DataPointDataError? = nil) {
        self.dataId = dataId
        self.data = data
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case dataId = "data_id"
        case data
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(dataId, forKey: .dataId)
        try container.encodeIfPresent(data, forKey: .data)
    }
}

