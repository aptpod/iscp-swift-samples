//
// AuthPage.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct AuthPage: Codable {

    /** 次のページがあるかどうか */
    public var next: Bool
    /** 前のページがあるかどうか */
    public var prev: Bool
    /** 取得対象の次のページ番号。`next` がtrueの場合のみ表示。 */
    public var nextPage: Int64?
    /** 取得対象の前のページ番号。`next` がtrueの場合のみ表示。 */
    public var prevPage: Int64?
    /** 取得対象の総ページ数 */
    public var totalPage: Int64
    /** 取得対象の総件数 */
    public var totalCount: Int64

    public init(next: Bool, prev: Bool, nextPage: Int64? = nil, prevPage: Int64? = nil, totalPage: Int64, totalCount: Int64) {
        self.next = next
        self.prev = prev
        self.nextPage = nextPage
        self.prevPage = prevPage
        self.totalPage = totalPage
        self.totalCount = totalCount
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case next
        case prev
        case nextPage = "next_page"
        case prevPage = "prev_page"
        case totalPage = "total_page"
        case totalCount = "total_count"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(next, forKey: .next)
        try container.encode(prev, forKey: .prev)
        try container.encodeIfPresent(nextPage, forKey: .nextPage)
        try container.encodeIfPresent(prevPage, forKey: .prevPage)
        try container.encode(totalPage, forKey: .totalPage)
        try container.encode(totalCount, forKey: .totalCount)
    }
}

