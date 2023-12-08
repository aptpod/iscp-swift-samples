//
// OAuth2Client.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct OAuth2Client: Codable {

    public enum GrantTypes: String, Codable, CaseIterable {
        case authorizationCode = "authorization_code"
        case clientCredentials = "client_credentials"
        case refreshToken = "refresh_token"
    }
    public enum TokenEndpointAuthMethod: String, Codable, CaseIterable {
        case _none = "none"
        case clientSecretPost = "client_secret_post"
        case clientSecretBasic = "client_secret_basic"
        case tlsClientAuth = "tls_client_auth"
    }
    public enum ResponseTypes: String, Codable, CaseIterable {
        case code = "code"
    }
    /** OAuth2クライアントID */
    public var clientId: String
    /** 名前 */
    public var name: String
    /** グラントタイプ */
    public var grantTypes: [GrantTypes]
    /** トークンエンドポイントの認証方式 */
    public var tokenEndpointAuthMethod: TokenEndpointAuthMethod
    /** 認可後のリダイレクト先URI */
    public var redirectUris: [String]
    /** レスポンスタイプ */
    public var responseTypes: [ResponseTypes]
    /** スコープ */
    public var scopes: [String]
    /** オーディエンス */
    public var audiences: [String]
    /** TLSクライアント認証のサブジェクトDN */
    public var tlsClientAuthSubjectDn: String

    public init(clientId: String, name: String, grantTypes: [GrantTypes], tokenEndpointAuthMethod: TokenEndpointAuthMethod, redirectUris: [String], responseTypes: [ResponseTypes], scopes: [String], audiences: [String], tlsClientAuthSubjectDn: String) {
        self.clientId = clientId
        self.name = name
        self.grantTypes = grantTypes
        self.tokenEndpointAuthMethod = tokenEndpointAuthMethod
        self.redirectUris = redirectUris
        self.responseTypes = responseTypes
        self.scopes = scopes
        self.audiences = audiences
        self.tlsClientAuthSubjectDn = tlsClientAuthSubjectDn
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case clientId = "client_id"
        case name
        case grantTypes = "grant_types"
        case tokenEndpointAuthMethod = "token_endpoint_auth_method"
        case redirectUris = "redirect_uris"
        case responseTypes = "response_types"
        case scopes
        case audiences
        case tlsClientAuthSubjectDn = "tls_client_auth_subject_dn"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(clientId, forKey: .clientId)
        try container.encode(name, forKey: .name)
        try container.encode(grantTypes, forKey: .grantTypes)
        try container.encode(tokenEndpointAuthMethod, forKey: .tokenEndpointAuthMethod)
        try container.encode(redirectUris, forKey: .redirectUris)
        try container.encode(responseTypes, forKey: .responseTypes)
        try container.encode(scopes, forKey: .scopes)
        try container.encode(audiences, forKey: .audiences)
        try container.encode(tlsClientAuthSubjectDn, forKey: .tlsClientAuthSubjectDn)
    }
}

