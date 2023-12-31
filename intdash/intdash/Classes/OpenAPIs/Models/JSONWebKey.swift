//
// JSONWebKey.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** See [JSON Web Key (JWK)](https://datatracker.ietf.org/doc/html/rfc7517) */
public struct JSONWebKey: Codable {

    public var use: String?
    public var kty: String?
    public var kid: String?
    public var crv: String?
    public var alg: String?
    public var k: Data?
    public var x: Data?
    public var y: Data?
    public var n: Data?
    public var e: Data?
    public var d: Data?
    public var p: Data?
    public var q: Data?
    public var dp: Data?
    public var dq: Data?
    public var qi: Data?
    public var x5c: [String]?
    public var x5u: String?
    public var x5t: String?
    public var x5tS256: String?

    public init(use: String? = nil, kty: String? = nil, kid: String? = nil, crv: String? = nil, alg: String? = nil, k: Data? = nil, x: Data? = nil, y: Data? = nil, n: Data? = nil, e: Data? = nil, d: Data? = nil, p: Data? = nil, q: Data? = nil, dp: Data? = nil, dq: Data? = nil, qi: Data? = nil, x5c: [String]? = nil, x5u: String? = nil, x5t: String? = nil, x5tS256: String? = nil) {
        self.use = use
        self.kty = kty
        self.kid = kid
        self.crv = crv
        self.alg = alg
        self.k = k
        self.x = x
        self.y = y
        self.n = n
        self.e = e
        self.d = d
        self.p = p
        self.q = q
        self.dp = dp
        self.dq = dq
        self.qi = qi
        self.x5c = x5c
        self.x5u = x5u
        self.x5t = x5t
        self.x5tS256 = x5tS256
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case use
        case kty
        case kid
        case crv
        case alg
        case k
        case x
        case y
        case n
        case e
        case d
        case p
        case q
        case dp
        case dq
        case qi
        case x5c
        case x5u
        case x5t
        case x5tS256 = "x5t#S256"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(use, forKey: .use)
        try container.encodeIfPresent(kty, forKey: .kty)
        try container.encodeIfPresent(kid, forKey: .kid)
        try container.encodeIfPresent(crv, forKey: .crv)
        try container.encodeIfPresent(alg, forKey: .alg)
        try container.encodeIfPresent(k, forKey: .k)
        try container.encodeIfPresent(x, forKey: .x)
        try container.encodeIfPresent(y, forKey: .y)
        try container.encodeIfPresent(n, forKey: .n)
        try container.encodeIfPresent(e, forKey: .e)
        try container.encodeIfPresent(d, forKey: .d)
        try container.encodeIfPresent(p, forKey: .p)
        try container.encodeIfPresent(q, forKey: .q)
        try container.encodeIfPresent(dp, forKey: .dp)
        try container.encodeIfPresent(dq, forKey: .dq)
        try container.encodeIfPresent(qi, forKey: .qi)
        try container.encodeIfPresent(x5c, forKey: .x5c)
        try container.encodeIfPresent(x5u, forKey: .x5u)
        try container.encodeIfPresent(x5t, forKey: .x5t)
        try container.encodeIfPresent(x5tS256, forKey: .x5tS256)
    }
}

