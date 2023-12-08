//
// ISCPMessageType.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** iSCPメッセージタイプ */
public enum ISCPMessageType: String, Codable, CaseIterable {
    case upstreamSpecRequest = "upstream_spec_request"
    case downstreamSpecRequest = "downstream_spec_request"
    case unit = "unit"
    case eos = "eos"
    case sos = "sos"
    case ping = "ping"
}