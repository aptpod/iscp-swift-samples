//
// MeasurementSequencesSummary.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct MeasurementSequencesSummary: Codable {

    public enum Status: String, Codable, CaseIterable {
        case ready = "ready"
        case measuring = "measuring"
        case resending = "resending"
        case finished = "finished"
        case completed = "completed"
    }
    /** 計測シーケンス回収率。計測内に含まれる計測シーケンスのうち、 サーバーへの保存が完了した計測シーケンスの割合です。 */
    public var receivedChunksRatio: Double?
    /** サーバーが受信したデータポイントの数 */
    public var receivedDataPoints: Int?
    /** サーバーが受信することが想定されるデータポイントの総数（既に受信済みのデータポイントを含む） */
    public var expectedDataPoints: Int?
    /** 計測のステータス:   - ready     - 計測準備中   - measuring     - 計測中   - resending     - 再送中。計測（エッジにおけるデータの取得）は終了しましたが、エッジにデータが残っており、サーバーに再送中です。   - finished（非推奨。段階的にcompletedへ移行）     - 完了。サーバーへのデータの回収が完了しています。   - completed     - 完了。サーバーへのデータの回収が完了しています。 */
    public var status: Status?

    public init(receivedChunksRatio: Double? = nil, receivedDataPoints: Int? = nil, expectedDataPoints: Int? = nil, status: Status? = nil) {
        self.receivedChunksRatio = receivedChunksRatio
        self.receivedDataPoints = receivedDataPoints
        self.expectedDataPoints = expectedDataPoints
        self.status = status
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case receivedChunksRatio = "received_chunks_ratio"
        case receivedDataPoints = "received_data_points"
        case expectedDataPoints = "expected_data_points"
        case status
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(receivedChunksRatio, forKey: .receivedChunksRatio)
        try container.encodeIfPresent(receivedDataPoints, forKey: .receivedDataPoints)
        try container.encodeIfPresent(expectedDataPoints, forKey: .expectedDataPoints)
        try container.encodeIfPresent(status, forKey: .status)
    }
}

