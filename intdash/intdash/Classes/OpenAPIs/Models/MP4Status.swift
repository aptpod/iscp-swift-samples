//
// MP4Status.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** ステータス */
public enum MP4Status: String, Codable, CaseIterable {
    case unprocessed = "unprocessed"
    case processing = "processing"
    case succeeded = "succeeded"
    case failed = "failed"
    case canceled = "canceled"
}