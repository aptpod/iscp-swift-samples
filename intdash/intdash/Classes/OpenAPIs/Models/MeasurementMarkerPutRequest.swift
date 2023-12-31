//
// MeasurementMarkerPutRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public enum MeasurementMarkerPutRequest: Codable {
    case typeMeasurementMarkerPutRequestPoint(MeasurementMarkerPutRequestPoint)
    case typeMeasurementMarkerPutRequestRange(MeasurementMarkerPutRequestRange)

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .typeMeasurementMarkerPutRequestPoint(let value):
            try container.encode(value)
        case .typeMeasurementMarkerPutRequestRange(let value):
            try container.encode(value)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(MeasurementMarkerPutRequestPoint.self) {
            self = .typeMeasurementMarkerPutRequestPoint(value)
        } else if let value = try? container.decode(MeasurementMarkerPutRequestRange.self) {
            self = .typeMeasurementMarkerPutRequestRange(value)
        } else {
            throw DecodingError.typeMismatch(Self.Type.self, .init(codingPath: decoder.codingPath, debugDescription: "Unable to decode instance of MeasurementMarkerPutRequest"))
        }
    }
}

