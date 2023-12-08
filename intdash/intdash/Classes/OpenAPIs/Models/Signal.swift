//
// Signal.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Signal: Codable {

    /** 信号定義のUUID */
    public var uuid: String
    /** 信号定義のラベル */
    public var label: String
    /** 信号定義の説明 */
    public var description: String
    /** データタイプ */
    public var dataType: Int
    /** データID */
    public var dataId: String
    /** チャンネル */
    public var channel: Int
    public var conversion: SignalConversion
    public var display: SignalDisplay
    /** 信号定義のハッシュ値 */
    public var hash: String
    /** 信号定義の作成日時 */
    public var createdAt: String
    /** 信号定義の最終更新日時 */
    public var updatedAt: String

    public init(uuid: String, label: String, description: String, dataType: Int, dataId: String, channel: Int, conversion: SignalConversion, display: SignalDisplay, hash: String, createdAt: String, updatedAt: String) {
        self.uuid = uuid
        self.label = label
        self.description = description
        self.dataType = dataType
        self.dataId = dataId
        self.channel = channel
        self.conversion = conversion
        self.display = display
        self.hash = hash
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case uuid
        case label
        case description
        case dataType = "data_type"
        case dataId = "data_id"
        case channel
        case conversion
        case display
        case hash
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(uuid, forKey: .uuid)
        try container.encode(label, forKey: .label)
        try container.encode(description, forKey: .description)
        try container.encode(dataType, forKey: .dataType)
        try container.encode(dataId, forKey: .dataId)
        try container.encode(channel, forKey: .channel)
        try container.encode(conversion, forKey: .conversion)
        try container.encode(display, forKey: .display)
        try container.encode(hash, forKey: .hash)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
    }
}
