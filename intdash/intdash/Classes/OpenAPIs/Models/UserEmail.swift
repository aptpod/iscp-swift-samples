//
// UserEmail.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct UserEmail: Codable {

    /** メールアドレスのID */
    public var id: Int64
    /** メールアドレス */
    public var address: String
    /** `true` の場合、確認メールによるメールアドレス確認が済んでいます。 */
    public var verified: Bool
    /** 作成日時 */
    public var createdAt: Date
    /** 最終更新日時 */
    public var updatedAt: Date

    public init(id: Int64, address: String, verified: Bool, createdAt: Date, updatedAt: Date) {
        self.id = id
        self.address = address
        self.verified = verified
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case address
        case verified
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(address, forKey: .address)
        try container.encode(verified, forKey: .verified)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
    }
}

