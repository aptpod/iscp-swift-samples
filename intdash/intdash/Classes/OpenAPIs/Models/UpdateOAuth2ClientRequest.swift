//
// UpdateOAuth2ClientRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct UpdateOAuth2ClientRequest: Codable {

    /** 名前 */
    public var name: String?
    /** 認可後のリダイレクト先URI */
    public var redirectUris: [String]?

    public init(name: String? = nil, redirectUris: [String]? = nil) {
        self.name = name
        self.redirectUris = redirectUris
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case redirectUris = "redirect_uris"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(redirectUris, forKey: .redirectUris)
    }
}

