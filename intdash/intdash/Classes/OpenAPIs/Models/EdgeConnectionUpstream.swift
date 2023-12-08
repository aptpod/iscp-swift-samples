//
// EdgeConnectionUpstream.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct EdgeConnectionUpstream: Codable {

    /** アップストリームのストリームID */
    public var streamId: Int
    /** アップストリームの計測UUID */
    public var measurementUuid: String
    /** アップストリームの送信元エッジUUID */
    public var srcEdgeUuid: String
    /** * `true` : このアップストリームは再送です。 * `false` : このアップストリームは再送ではありません。 */
    public var resend: Bool
    /** * `true` : このアップストリームで送信されたデータポイントはサーバーに保存されます。 * `false` : このアップストリームで送信されたデータポイントはサーバーに保存されません。 */
    public var store: Bool
    /** アップストリームで最後にデータポイントが送信された日時。 実際の最後のデータポイント送信よりも最大で10秒後の値となる場合があります。 */
    public var lastReceivedAt: String
    /** * `true` : このアップストリームについてのclose requestを受信済みです。 * `false` : このアップストリームについてのclose requestは受信していません。 */
    public var receivedCloseRequest: Bool
    /** アップストリームが作成された日時 */
    public var createdAt: String
    /** アップストリームの最終更新日時 */
    public var updatedAt: String

    public init(streamId: Int, measurementUuid: String, srcEdgeUuid: String, resend: Bool, store: Bool, lastReceivedAt: String, receivedCloseRequest: Bool, createdAt: String, updatedAt: String) {
        self.streamId = streamId
        self.measurementUuid = measurementUuid
        self.srcEdgeUuid = srcEdgeUuid
        self.resend = resend
        self.store = store
        self.lastReceivedAt = lastReceivedAt
        self.receivedCloseRequest = receivedCloseRequest
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case streamId = "stream_id"
        case measurementUuid = "measurement_uuid"
        case srcEdgeUuid = "src_edge_uuid"
        case resend
        case store
        case lastReceivedAt = "last_received_at"
        case receivedCloseRequest = "received_close_request"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(streamId, forKey: .streamId)
        try container.encode(measurementUuid, forKey: .measurementUuid)
        try container.encode(srcEdgeUuid, forKey: .srcEdgeUuid)
        try container.encode(resend, forKey: .resend)
        try container.encode(store, forKey: .store)
        try container.encode(lastReceivedAt, forKey: .lastReceivedAt)
        try container.encode(receivedCloseRequest, forKey: .receivedCloseRequest)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
    }
}

