//
//  Vector3DPayload.swift
//  SensorGPSDownstreamApp
//
//  Created by uenomasamitsu on 2023/10/27.
//  Copyright © 2023 aptpod, Inc. All rights reserved.
//

import Foundation

public class Vector3DPayload : IPayload {
    
    public static let TYPE: String = "vector_3d"
    
    public var type: String { Vector3DPayload.TYPE }
    
    static let HEADER_LENGTH = MemoryLayout<Float64>.size * 3
    
    public var x: Float64
    public var y: Float64
    public var z: Float64
    
    public init(x: Float64, y: Float64, z: Float64) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    public func encode() -> Data {
        var data = Data()
        data.append(self.x.toData(false))
        data.append(self.y.toData(false))
        data.append(self.z.toData(false))
        return data
    }
    
    public static func decode(payload: Data) -> (Vector3DPayload?, Error?) {
        guard payload.count >= HEADER_LENGTH else {
            return (nil, PayloadError.invalidData("Not enough byte length."))
        }
        
        var offset = 0
        var x: Float64 = 0
        var y: Float64 = 0
        var z: Float64 = 0
        payload.withUnsafeBytes { ptr in
            x = Float64(bitPattern: UInt64(bigEndian: ptr.load(fromByteOffset: offset, as: UInt64.self))); offset += MemoryLayout<Float64>.size
            y = Float64(bitPattern: UInt64(bigEndian: ptr.load(fromByteOffset: offset, as: UInt64.self))); offset += MemoryLayout<Float64>.size
            z = Float64(bitPattern: UInt64(bigEndian: ptr.load(fromByteOffset: offset, as: UInt64.self))); offset += MemoryLayout<Float64>.size
        }
        return (Vector3DPayload(x: x, y: y, z: z), nil)
    }
    
}
