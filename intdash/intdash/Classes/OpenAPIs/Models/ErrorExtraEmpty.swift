//
// ErrorExtraEmpty.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ErrorExtraEmpty: Codable {

    public enum ModelError: String, Codable, CaseIterable {
        case convertedError = "converted_error"
        case unexpected = "unexpected"
    }
    /** エラーのタイプ。エラーのタイプが `unexpected` の場合は、直ちに処理が中断されます。 */
    public var error: ModelError?
    /** エラーの説明 */
    public var errorDescription: String?

    public init(error: ModelError? = nil, errorDescription: String? = nil) {
        self.error = error
        self.errorDescription = errorDescription
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case error
        case errorDescription = "error_description"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(error, forKey: .error)
        try container.encodeIfPresent(errorDescription, forKey: .errorDescription)
    }
}
