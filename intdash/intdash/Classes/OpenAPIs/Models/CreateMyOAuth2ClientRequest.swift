//
// CreateMyOAuth2ClientRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public enum CreateMyOAuth2ClientRequest: Codable {
    case typeCreateOAuth2ClientAuthorizationCodeRequest(CreateOAuth2ClientAuthorizationCodeRequest)
    case typeCreateOAuth2ClientClientCredentialsRequest(CreateOAuth2ClientClientCredentialsRequest)

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .typeCreateOAuth2ClientAuthorizationCodeRequest(let value):
            try container.encode(value)
        case .typeCreateOAuth2ClientClientCredentialsRequest(let value):
            try container.encode(value)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(CreateOAuth2ClientAuthorizationCodeRequest.self) {
            self = .typeCreateOAuth2ClientAuthorizationCodeRequest(value)
        } else if let value = try? container.decode(CreateOAuth2ClientClientCredentialsRequest.self) {
            self = .typeCreateOAuth2ClientClientCredentialsRequest(value)
        } else {
            throw DecodingError.typeMismatch(Self.Type.self, .init(codingPath: decoder.codingPath, debugDescription: "Unable to decode instance of CreateMyOAuth2ClientRequest"))
        }
    }
}

