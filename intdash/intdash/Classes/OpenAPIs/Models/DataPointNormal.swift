//
// DataPointNormal.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** 改行で区切られたJSON文字列です。 */
public struct DataPointNormal: Codable {

    public var time: DataPointTime
    /** このデータポイントが含まれる計測のUUID */
    public var measurementUuid: String
    /** このデータポイントが作成された日時 */
    public var createdAt: String
    /** データタイプ */
    public var dataType: String
    /** データID */
    public var dataId: String
    /** データのペイロード。ペイロードのJSON表現はデータタイプによって異なります。 [詳説iSCP 1.0](https://docs.intdash.jp/manual/iscp1-essentials/latest/ja/iscp1-essentials-ja.pdf) の「付録: データタイプとペイロードの定義」を参照してください。 */
    public var data: AnyCodable

    public init(time: DataPointTime, measurementUuid: String, createdAt: String, dataType: String, dataId: String, data: AnyCodable) {
        self.time = time
        self.measurementUuid = measurementUuid
        self.createdAt = createdAt
        self.dataType = dataType
        self.dataId = dataId
        self.data = data
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case time
        case measurementUuid = "measurement_uuid"
        case createdAt = "created_at"
        case dataType = "data_type"
        case dataId = "data_id"
        case data
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(time, forKey: .time)
        try container.encode(measurementUuid, forKey: .measurementUuid)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(dataType, forKey: .dataType)
        try container.encode(dataId, forKey: .dataId)
        try container.encode(data, forKey: .data)
    }
}

