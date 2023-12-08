//
//  Payload.swift
//  SensorGPSDownstreamApp
//
//  Created by uenomasamitsu on 2023/10/27.
//  Copyright © 2023 aptpod, Inc. All rights reserved.
//

import Foundation

public protocol IPayload {
    
    var type: String { get }
    func encode() -> Data
    
}

public enum PayloadError : Error, LocalizedError {
    /// 無効なデータです。
    case invalidData(_ reason: String)
    /// 未サポートのデータです。
    case unsupported
    
    public var errorDescription: String? {
        switch self {
        case .invalidData(let reason): return "invalid data. \(reason)"
        case .unsupported: return "unsupported"
        }
    }
}
