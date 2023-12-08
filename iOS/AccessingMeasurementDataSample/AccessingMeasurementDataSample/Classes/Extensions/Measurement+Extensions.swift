//
//  Measurement+Extensions.swift
//  AccessingMeasurementDataSample
//
//  Created by uenomasamitsu on 2023/10/30.
//  Copyright © 2023 aptpod, Inc. All rights reserved.
//

import Foundation

extension Measurement {
    
    var durationValue: TimeInterval? {
        if let time = self.maxElapsedTime {
            return TimeInterval(time) / (1000 * 1000)
        }
        return nil
    }
    
    var baseTimeDate: Date? {
        return Date(fromRFC3339: self.basetime)
    }
}
