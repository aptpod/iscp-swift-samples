//
// MeasurementMarkerPutRequestBase.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct MeasurementMarkerPutRequestBase: Codable {

    public enum ModelType: String, Codable, CaseIterable {
        case point = "point"
        case range = "range"
    }
    /** 計測マーカーの名前 */
    public var name: String?
    /** 計測マーカーの説明 */
    public var description: String?
    /** 計測マーカーのタイプ - `point` : ポイントマーカー - `range` : 範囲マーカー */
    public var type: ModelType?
    /** この計測マーカーに付与するタグ。タグはキーと値からなるペア（いずれもstring）で設定します。 複数のタグを一度に設定することができます。 値の中にオブジェクトを入れる（ネストする）ことはできません。 ``` // Not good {   \"tagkey\" : {     \"nestKey\": \"not allowed\"   } } ```  ``` // OK {   \"tagkey1\" : \"ok1\",   \"tagkey2\" : \"ok2\" } ``` */
    public var tag: AnyCodable?

    public init(name: String? = nil, description: String? = nil, type: ModelType? = nil, tag: AnyCodable? = nil) {
        self.name = name
        self.description = description
        self.type = type
        self.tag = tag
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case description
        case type
        case tag
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(tag, forKey: .tag)
    }
}

