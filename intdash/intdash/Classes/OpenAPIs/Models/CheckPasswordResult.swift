//
// CheckPasswordResult.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct CheckPasswordResult: Codable {

    /** `true` の場合、ポリシーに適合しています。 */
    public var valid: Bool
    /** ポリシー不適合の場合、その詳細 */
    public var errors: [CheckPasswordResultErrors]?

    public init(valid: Bool, errors: [CheckPasswordResultErrors]? = nil) {
        self.valid = valid
        self.errors = errors
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case valid
        case errors
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(valid, forKey: .valid)
        try container.encodeIfPresent(errors, forKey: .errors)
    }
}

