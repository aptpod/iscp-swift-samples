//
// CheckMeHTTPAuthorizationRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** 認証ユーザー自身がアクセス可能かどうかを判定します。 */
public struct CheckMeHTTPAuthorizationRequest: Codable {

    public enum Method: String, Codable, CaseIterable {
        case _get = "GET"
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    public var path: String
    public var method: Method

    public init(path: String, method: Method) {
        self.path = path
        self.method = method
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case path
        case method
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(path, forKey: .path)
        try container.encode(method, forKey: .method)
    }
}
