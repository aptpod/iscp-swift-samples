//
// DataPoint.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public enum DataPoint: Codable {
    case typeDataPointError(DataPointError)
    case typeDataPointNormal(DataPointNormal)

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .typeDataPointError(let value):
            try container.encode(value)
        case .typeDataPointNormal(let value):
            try container.encode(value)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(DataPointError.self) {
            self = .typeDataPointError(value)
        } else if let value = try? container.decode(DataPointNormal.self) {
            self = .typeDataPointNormal(value)
        } else {
            throw DecodingError.typeMismatch(Self.Type.self, .init(codingPath: decoder.codingPath, debugDescription: "Unable to decode instance of DataPoint"))
        }
    }
}

