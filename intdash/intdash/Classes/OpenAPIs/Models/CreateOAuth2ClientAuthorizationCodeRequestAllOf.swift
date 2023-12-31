//
// CreateOAuth2ClientAuthorizationCodeRequestAllOf.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct CreateOAuth2ClientAuthorizationCodeRequestAllOf: Codable {

    public enum TokenEndpointAuthMethod: String, Codable, CaseIterable {
        case clientSecretBasic = "client_secret_basic"
        case _none = "none"
    }
    /** 名前 */
    public var name: String?
    /** グラントタイプ */
    public var grantType: String?
    public var redirectUris: [String]
    /** トークンエンドポイントの認証方式 */
    public var tokenEndpointAuthMethod: TokenEndpointAuthMethod? = .clientSecretBasic
    /** TLSクライアント認証のサブジェクトDN */
    public var tlsClientAuthSubjectDn: String?

    public init(name: String? = nil, grantType: String? = nil, redirectUris: [String], tokenEndpointAuthMethod: TokenEndpointAuthMethod? = .clientSecretBasic, tlsClientAuthSubjectDn: String? = nil) {
        self.name = name
        self.grantType = grantType
        self.redirectUris = redirectUris
        self.tokenEndpointAuthMethod = tokenEndpointAuthMethod
        self.tlsClientAuthSubjectDn = tlsClientAuthSubjectDn
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case grantType = "grant_type"
        case redirectUris = "redirect_uris"
        case tokenEndpointAuthMethod = "token_endpoint_auth_method"
        case tlsClientAuthSubjectDn = "tls_client_auth_subject_dn"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(grantType, forKey: .grantType)
        try container.encode(redirectUris, forKey: .redirectUris)
        try container.encodeIfPresent(tokenEndpointAuthMethod, forKey: .tokenEndpointAuthMethod)
        try container.encodeIfPresent(tlsClientAuthSubjectDn, forKey: .tlsClientAuthSubjectDn)
    }
}

