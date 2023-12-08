//
// MP4.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct MP4: Codable {

    /** MP4のUUID */
    public var uuid: UUID
    /** 動画の開始時刻からのオフセット（マイクロ秒） */
    public var startOffset: Int
    /** 長さ（マイクロ秒） */
    public var duration: Int
    /** 指定された時間範囲のみを抽出したものである場合は `true` 。 */
    public var trimmed: Bool
    /** メディアファイルのパス */
    public var filePath: String?
    public var status: MP4Status
    /** 作成された日時 */
    public var createdAt: Date
    /** 最終更新日時 */
    public var updatedAt: Date

    public init(uuid: UUID, startOffset: Int, duration: Int, trimmed: Bool, filePath: String? = nil, status: MP4Status, createdAt: Date, updatedAt: Date) {
        self.uuid = uuid
        self.startOffset = startOffset
        self.duration = duration
        self.trimmed = trimmed
        self.filePath = filePath
        self.status = status
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case uuid
        case startOffset = "start_offset"
        case duration
        case trimmed
        case filePath = "file_path"
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(uuid, forKey: .uuid)
        try container.encode(startOffset, forKey: .startOffset)
        try container.encode(duration, forKey: .duration)
        try container.encode(trimmed, forKey: .trimmed)
        try container.encodeIfPresent(filePath, forKey: .filePath)
        try container.encode(status, forKey: .status)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
    }
}

