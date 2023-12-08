//
//  Float64Payload.swift
//  SensorGPSDownstreamApp
//
//  Created by uenomasamitsu on 2023/10/27.
//  Copyright © 2023 aptpod, Inc. All rights reserved.
//

import Foundation

public class Float64Payload : IPayload {
    
    public static let TYPE: String = "float64"
    
    public var type: String { Float64Payload.TYPE }
    
    static let HEADER_LENGTH = MemoryLayout<Float64>.size
    
    public var data: Float64
    
    public init(data: Float64) {
        self.data = data
    }
    
    public func encode() -> Data {
        var data = Data()
        data.append(self.data.toData(false))
        return data
    }
    
    public static func decode(payload: Data) -> (Float64Payload?, Error?) {
        guard payload.count >= HEADER_LENGTH else {
            return (nil, PayloadError.invalidData("Not enough byte length."))
        }
        
        let data: Float64 = payload.toFloat64(false)
        return (Float64Payload(data: data), nil)
    }
    
}
