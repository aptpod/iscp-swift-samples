//
// APITokenIntrospectionResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct APITokenIntrospectionResponse: Codable {

    /** `true` の場合、このAPIトークンは有効です。 */
    public var active: Bool
    /** テナントID。デフォルトテナント以外を対象とする場合にのみ返されます。 */
    public var tenantId: Int64?
    /** ユーザーのUUID */
    public var userUuid: String?
    /** APIトークンが認可されているスコープ */
    public var scopes: [Scope]?
    /** APIトークンの有効期限 */
    public var expiredAt: Date?
    /** APIトークンの作成日時 */
    public var createdAt: Date?

    public init(active: Bool, tenantId: Int64? = nil, userUuid: String? = nil, scopes: [Scope]? = nil, expiredAt: Date? = nil, createdAt: Date? = nil) {
        self.active = active
        self.tenantId = tenantId
        self.userUuid = userUuid
        self.scopes = scopes
        self.expiredAt = expiredAt
        self.createdAt = createdAt
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case active
        case tenantId = "tenant_id"
        case userUuid = "user_uuid"
        case scopes
        case expiredAt = "expired_at"
        case createdAt = "created_at"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(active, forKey: .active)
        try container.encodeIfPresent(tenantId, forKey: .tenantId)
        try container.encodeIfPresent(userUuid, forKey: .userUuid)
        try container.encodeIfPresent(scopes, forKey: .scopes)
        try container.encodeIfPresent(expiredAt, forKey: .expiredAt)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
    }
}

