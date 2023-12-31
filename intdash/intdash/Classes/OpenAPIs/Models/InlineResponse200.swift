//
// InlineResponse200.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct InlineResponse200: Codable {

    /** アクセストークン */
    public var accessToken: String?
    /** アクセストークンの有効期限（期限切れまでの秒数） */
    public var expiresIn: Int64?
    /** リフレッシュトークン */
    public var refreshToken: String?
    /** リフレッシュトークンの有効期限（期限切れまでの秒数） */
    public var refreshTokenExpiresIn: Int64?
    /** スコープのリスト（スペース区切り）。 - temporary     - 一時的なユーザーを表します。 */
    public var scope: String?
    /** トークンタイプ。 `Bearer` に固定。 */
    public var tokenType: String?

    public init(accessToken: String? = nil, expiresIn: Int64? = nil, refreshToken: String? = nil, refreshTokenExpiresIn: Int64? = nil, scope: String? = nil, tokenType: String? = nil) {
        self.accessToken = accessToken
        self.expiresIn = expiresIn
        self.refreshToken = refreshToken
        self.refreshTokenExpiresIn = refreshTokenExpiresIn
        self.scope = scope
        self.tokenType = tokenType
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case accessToken = "access_token"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
        case refreshTokenExpiresIn = "refresh_token_expires_in"
        case scope
        case tokenType = "token_type"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(accessToken, forKey: .accessToken)
        try container.encodeIfPresent(expiresIn, forKey: .expiresIn)
        try container.encodeIfPresent(refreshToken, forKey: .refreshToken)
        try container.encodeIfPresent(refreshTokenExpiresIn, forKey: .refreshTokenExpiresIn)
        try container.encodeIfPresent(scope, forKey: .scope)
        try container.encodeIfPresent(tokenType, forKey: .tokenType)
    }
}

