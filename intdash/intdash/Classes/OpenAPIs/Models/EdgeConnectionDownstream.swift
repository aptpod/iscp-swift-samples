//
// EdgeConnectionDownstream.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct EdgeConnectionDownstream: Codable {

    /** ダウンストリームのストリームID */
    public var streamId: Int
    /** ダウンストリームの送信元エッジUUID */
    public var srcEdgeUuid: String
    /** ダウンストリームの宛先エッジUUID */
    public var dstEdgeUuid: String
    /** ダウンストリームで最後にデータポイントが受信された日時。 実際の最後のデータポイントの受信よりも最大で10秒後の値となる場合があります。 */
    public var lastReceivedAt: String
    /** * `true` : このダウンストリームについてのclose requestを受信済みです。 * `false` : このダウンストリームについてのclose requestを受信していません。 */
    public var receivedCloseRequest: Bool
    /** ダウンストリームが作成された日時 */
    public var createdAt: String
    /** ダウンストリームの最終更新日時 */
    public var updatedAt: String

    public init(streamId: Int, srcEdgeUuid: String, dstEdgeUuid: String, lastReceivedAt: String, receivedCloseRequest: Bool, createdAt: String, updatedAt: String) {
        self.streamId = streamId
        self.srcEdgeUuid = srcEdgeUuid
        self.dstEdgeUuid = dstEdgeUuid
        self.lastReceivedAt = lastReceivedAt
        self.receivedCloseRequest = receivedCloseRequest
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case streamId = "stream_id"
        case srcEdgeUuid = "src_edge_uuid"
        case dstEdgeUuid = "dst_edge_uuid"
        case lastReceivedAt = "last_received_at"
        case receivedCloseRequest = "received_close_request"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(streamId, forKey: .streamId)
        try container.encode(srcEdgeUuid, forKey: .srcEdgeUuid)
        try container.encode(dstEdgeUuid, forKey: .dstEdgeUuid)
        try container.encode(lastReceivedAt, forKey: .lastReceivedAt)
        try container.encode(receivedCloseRequest, forKey: .receivedCloseRequest)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
    }
}
