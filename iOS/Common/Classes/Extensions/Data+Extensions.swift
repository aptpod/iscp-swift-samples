//
//  Data+Extensions.swift
//  SensorGPSUpstreamApp
//
//  Created by uenomasamitsu on 2023/10/26.
//  Copyright © 2023 aptpod, Inc. All rights reserved.
//

import Foundation
import CommonCrypto

extension Data {
    
    func toInt8(_ isLittleEndian: Bool = true) -> Int8 {
        if isLittleEndian {
            return Int8(bitPattern: UInt8(littleEndian: self.withUnsafeBytes { $0.load(as: UInt8.self) } ))
        } else {
            return Int8(bitPattern: UInt8(bigEndian: self.withUnsafeBytes { $0.load(as: UInt8.self) } ))
        }
    }
    
    func toUInt8(_ isLittleEndian: Bool = true) -> UInt8 {
        if isLittleEndian {
            return UInt8(littleEndian: self.withUnsafeBytes { $0.load(as: UInt8.self) } )
        } else {
            return UInt8(bigEndian: self.withUnsafeBytes { $0.load(as: UInt8.self) } )
        }
    }
    
    func toInt16(_ isLittleEndian: Bool = true) -> Int16 {
        if isLittleEndian {
            return Int16(bitPattern: UInt16(littleEndian: self.withUnsafeBytes { $0.load(as: UInt16.self) } ))
        } else {
            return Int16(bitPattern: UInt16(bigEndian: self.withUnsafeBytes { $0.load(as: UInt16.self) } ))
        }
    }
    
    func toUInt16(_ isLittleEndian: Bool = true) -> UInt16 {
        if isLittleEndian {
            return UInt16(littleEndian: self.withUnsafeBytes { $0.load(as: UInt16.self) } )
        } else {
            return UInt16(bigEndian: self.withUnsafeBytes { $0.load(as: UInt16.self) } )
        }
    }
    
    func toInt32(_ isLittleEndian: Bool = true) -> Int32 {
        if isLittleEndian {
            return Int32(bitPattern: UInt32(littleEndian: self.withUnsafeBytes { $0.load(as: UInt32.self) } ))
        } else {
            return Int32(bitPattern: UInt32(bigEndian: self.withUnsafeBytes { $0.load(as: UInt32.self) } ))
        }
    }
    
    func toUInt32(_ isLittleEndian: Bool = true) -> UInt32 {
        if isLittleEndian {
            return UInt32(littleEndian: self.withUnsafeBytes { $0.load(as: UInt32.self) } )
        } else {
            return UInt32(bigEndian: self.withUnsafeBytes { $0.load(as: UInt32.self) } )
        }
    }
    
    func toInt64(_ isLittleEndian: Bool = true) -> Int64 {
        if isLittleEndian {
            return Int64(bitPattern: UInt64(littleEndian: self.withUnsafeBytes { $0.load(as: UInt64.self) } ))
        } else {
            return Int64(bitPattern: UInt64(bigEndian: self.withUnsafeBytes { $0.load(as: UInt64.self) } ))
        }
    }
    
    func toUInt64(_ isLittleEndian: Bool = true) -> UInt64 {
        if isLittleEndian {
            return UInt64(littleEndian: self.withUnsafeBytes { $0.load(as: UInt64.self) } )
        } else {
            return UInt64(bigEndian: self.withUnsafeBytes { $0.load(as: UInt64.self) } )
        }
    }
    
    func toFloat(_ isLittleEndian: Bool = true) -> Float {
        if isLittleEndian {
            return Float(bitPattern: UInt32(littleEndian: self.withUnsafeBytes { $0.load(as: UInt32.self) } ))
        } else {
            return Float(bitPattern: UInt32(bigEndian: self.withUnsafeBytes { $0.load(as: UInt32.self) } ))
        }
    }
    
    func toFloat64(_ isLittleEndian: Bool = true) -> Float64 {
        if isLittleEndian {
            return Float64(bitPattern: UInt64(littleEndian: self.withUnsafeBytes { $0.load(as: UInt64.self) } ))
        } else {
            return Float64(bitPattern: UInt64(bigEndian: self.withUnsafeBytes { $0.load(as: UInt64.self) } ))
        }
    }
    
    func toDouble(_ isLittleEndian: Bool = true) -> Double {
        if isLittleEndian {
            return Double(bitPattern: UInt64(littleEndian: self.withUnsafeBytes { $0.load(as: UInt64.self) } ))
        } else {
            return Double(bitPattern: UInt64(bigEndian: self.withUnsafeBytes { $0.load(as: UInt64.self) } ))
        }
    }
    
}

fileprivate func convertData<T>(_ value: T) -> Data {
    var value = value
    return Data(withUnsafePointer(to: &value) {
        $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout<T>.size) {
            Array(UnsafeBufferPointer(start: $0, count: MemoryLayout<T>.size))
        }
    })
}

extension UInt8 {
    func toData(_ isLittleEndian: Bool = true) -> Data {
        let value = isLittleEndian ? self.littleEndian : self.bigEndian
        return convertData(value)
    }
}

extension Int8 {
    func toData(_ isLittleEndian: Bool = true) -> Data {
        let value = isLittleEndian ? self.littleEndian : self.bigEndian
        return convertData(value)
    }
}

extension UInt16 {
    func toData(_ isLittleEndian: Bool = true) -> Data {
        let value = isLittleEndian ? self.littleEndian : self.bigEndian
        return convertData(value)
    }
}

extension Int16 {
    func toData(_ isLittleEndian: Bool = true) -> Data {
        let value = isLittleEndian ? self.littleEndian : self.bigEndian
        return convertData(value)
    }
}

extension UInt32 {
    func toData(_ isLittleEndian: Bool = true) -> Data {
        let value = isLittleEndian ? self.littleEndian : self.bigEndian
        return convertData(value)
    }
}

extension Int {
    func toData(_ isLittleEndian: Bool = true) -> Data {
        let value = isLittleEndian ? self.littleEndian : self.bigEndian
        return convertData(value)
    }
}

extension Int32 {
    func toData(_ isLittleEndian: Bool = true) -> Data {
        let value = isLittleEndian ? self.littleEndian : self.bigEndian
        return convertData(value)
    }
}

extension UInt64 {
    func toData(_ isLittleEndian: Bool = true) -> Data {
        let value = isLittleEndian ? self.littleEndian : self.bigEndian
        return convertData(value)
    }
}

extension Int64 {
    func toData(_ isLittleEndian: Bool = true) -> Data {
        let value = isLittleEndian ? self.littleEndian : self.bigEndian
        return convertData(value)
    }
}

extension Float {
    func toData(_ isLittleEndian: Bool = true) -> Data {
        let value = isLittleEndian ? self.bitPattern.littleEndian : self.bitPattern.bigEndian
        return convertData(value)
    }
}

extension Double {
    func toData(_ isLittleEndian: Bool = true) -> Data {
        let value = isLittleEndian ? self.bitPattern.littleEndian : self.bitPattern.bigEndian
        return convertData(value)
    }
}
