//
// SignalConversionOptionSubString.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SignalConversionOptionSubString: Codable {

    /** 開始バイト位置 */
    public var startbyte: Int64
    /** バイトサイズ */
    public var bytesize: Int64

    public init(startbyte: Int64, bytesize: Int64) {
        self.startbyte = startbyte
        self.bytesize = bytesize
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case startbyte
        case bytesize
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(startbyte, forKey: .startbyte)
        try container.encode(bytesize, forKey: .bytesize)
    }
}

