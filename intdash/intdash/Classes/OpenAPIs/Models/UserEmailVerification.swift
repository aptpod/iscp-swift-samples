//
// UserEmailVerification.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct UserEmailVerification: Codable {

    /** メールアドレスのID */
    public var emailId: Int64
    /** 有効期限 */
    public var expiredAt: Date
    /** 作成日時 */
    public var createdAt: Date
    /** 最終更新日時 */
    public var updatedAt: Date

    public init(emailId: Int64, expiredAt: Date, createdAt: Date, updatedAt: Date) {
        self.emailId = emailId
        self.expiredAt = expiredAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case emailId = "email_id"
        case expiredAt = "expired_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(emailId, forKey: .emailId)
        try container.encode(expiredAt, forKey: .expiredAt)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
    }
}

