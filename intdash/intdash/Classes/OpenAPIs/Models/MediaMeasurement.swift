//
// MediaMeasurement.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct MediaMeasurement: Codable {

    public enum Status: String, Codable, CaseIterable {
        case measuring = "measuring"
        case resending = "resending"
        case finished = "finished"
    }
    /** 計測のUUID */
    public var uuid: String
    /** 計測の名前 */
    public var name: String
    /** 計測の説明 */
    public var description: String
    /** 計測の基準時刻（RFC3339形式） */
    public var basetime: String
    public var basetimeType: MediaMeasurementBaseTimeType
    /** エッジのUUID */
    public var edgeUuid: String
    /** 計測時間（ `max_elapsed_time` を使用してください） */
    @available(*, deprecated, message: "This property is deprecated.")
    public var duration: Int64
    /** 計測時間（マイクロ秒） */
    public var maxElapsedTime: Int64?
    /** `true` の場合、計測は保護されています。保護されている計測は削除できません。 保護されている計測を削除したい場合は、まず保護を解除してください。 */
    public var protected: Bool
    /** 計測の作成日時 */
    public var createdAt: Date
    /** 計測の最終更新日時 */
    public var updatedAt: Date
    /** 代わりに `sequences.received_sequence_numbers_ratio` を使用してください。処理済み率を表します。 */
    @available(*, deprecated, message: "This property is deprecated.")
    public var processedRatio: Double
    /** 代わりに `sequences.status` を使用してください。エッジにおいてデータの取得が終了しているかどうかを示します。 */
    @available(*, deprecated, message: "This property is deprecated.")
    public var ended: Bool
    /** 代わりに `sequences.status` を使用してください。 計測のステータスを表します:   - measuring     - 計測中   - resending     - 再送中。計測（エッジにおけるデータの取得）は終了しましたが、エッジにデータが残っており、サーバーに再送中です。   - finished     - 完了。サーバーへのデータの回収が完了しています。 */
    @available(*, deprecated, message: "This property is deprecated.")
    public var status: Status

    public init(uuid: String, name: String, description: String, basetime: String, basetimeType: MediaMeasurementBaseTimeType, edgeUuid: String, duration: Int64, maxElapsedTime: Int64? = nil, protected: Bool, createdAt: Date, updatedAt: Date, processedRatio: Double, ended: Bool, status: Status) {
        self.uuid = uuid
        self.name = name
        self.description = description
        self.basetime = basetime
        self.basetimeType = basetimeType
        self.edgeUuid = edgeUuid
        self.duration = duration
        self.maxElapsedTime = maxElapsedTime
        self.protected = protected
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.processedRatio = processedRatio
        self.ended = ended
        self.status = status
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case uuid
        case name
        case description
        case basetime
        case basetimeType = "basetime_type"
        case edgeUuid = "edge_uuid"
        case duration
        case maxElapsedTime = "max_elapsed_time"
        case protected
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case processedRatio = "processed_ratio"
        case ended
        case status
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(uuid, forKey: .uuid)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(basetime, forKey: .basetime)
        try container.encode(basetimeType, forKey: .basetimeType)
        try container.encode(edgeUuid, forKey: .edgeUuid)
        try container.encode(duration, forKey: .duration)
        try container.encodeIfPresent(maxElapsedTime, forKey: .maxElapsedTime)
        try container.encode(protected, forKey: .protected)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(processedRatio, forKey: .processedRatio)
        try container.encode(ended, forKey: .ended)
        try container.encode(status, forKey: .status)
    }
}

