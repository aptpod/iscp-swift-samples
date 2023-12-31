//
// AddProjectEdgeRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct AddProjectEdgeRequest: Codable {

    /** 追加したいエッジの名前 */
    public var edgeName: String
    /** プロジェクトにおけるエッジのニックネーム */
    public var nickname: String

    public init(edgeName: String, nickname: String) {
        self.edgeName = edgeName
        self.nickname = nickname
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case edgeName = "edge_name"
        case nickname
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(edgeName, forKey: .edgeName)
        try container.encode(nickname, forKey: .nickname)
    }
}

