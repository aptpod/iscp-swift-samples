//
// CheckPasswordRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct CheckPasswordRequest: Codable {

    /** チェックしたいパスワード */
    public var password: String

    public init(password: String) {
        self.password = password
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case password
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(password, forKey: .password)
    }
}

