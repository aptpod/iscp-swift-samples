//
//  JPEGPayload.swift
//  SensorGPSDownstreamApp
//
//  Created by uenomasamitsu on 2023/10/27.
//  Copyright © 2023 aptpod, Inc. All rights reserved.
//

import Foundation

public class JPEGPayload : IPayload {
    
    public static let TYPE: String = "jpeg"
    
    public var type: String { JPEGPayload.TYPE }
    
    public var data: Data
    
    public init(data: Data) {
        self.data = data
    }
    
    public func encode() -> Data {
        return self.data
    }
    
    public static func decode(payload: Data) -> (JPEGPayload?, Error?) {
        return (JPEGPayload(data: payload), nil)
    }
}
