//
//  Date+Extensions.swift
//
//  Created by uenomasamitsu on 2023/10/25.
//  Copyright © 2023 aptpod, Inc. All rights reserved.
//

import Foundation

extension Date {
    
    func addDay(day: Int) -> Date? {
        let calendar = NSCalendar(identifier: .ISO8601)
        var dateComponents = calendar?.components(in: .current, from: self)
        dateComponents!.day! += day
        return dateComponents!.date
    }
    
    func addHour(hour: Int) -> Date? {
        let calendar = NSCalendar(identifier: .ISO8601)
        var dateComponents = calendar?.components(in: .current, from: self)
        dateComponents!.hour! += hour
        return dateComponents!.date
    }
    
    func toString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    private static var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    //MARK: - Instance Properties
    /// RFC3339で表現された文字列。
    ///
    /// マイクロ秒までサポートしています。
    public var rfc3339String: String {
        let fomatter = Date.formatter
        fomatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let time = self.timeIntervalSince1970
        let int: TimeInterval = floor(time)
        let string = String(time)
        var few: Int = 0
        var digits = ""
        if string.contains(".") {
            let split = string.split(separator: ".")
            if split.count >= 2 {
                var sFew = split[1].prefix(6)
                for _ in 0..<sFew.count {
                    if sFew.suffix(1) == "0" {
                        sFew = sFew.prefix(sFew.count-1)
                    }
                }
                if let v = Int(String(sFew)) {
                    few = v
                    if sFew.count > 0 {
                        digits = "0\(sFew.count)"
                    }
                }
            }
        }
        let dateTime = fomatter.string(from: Date(timeIntervalSince1970: int))
        return dateTime + ((few == 0) ? "Z" : String(format: ".%\(digits)dZ", few))
    }
    
    //MARK: - Initializers
    /// ISO8601形式の文字列からDateを生成します。
    /// - parameter fromISO8601: ISO8601形式で表現された文字列
    public init?(fromISO8601 string: String) {
        let fomatter = Date.formatter
        fomatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        if let date = fomatter.date(from: string) {
            self = date
            return
        }

        fomatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        if let date = fomatter.date(from: string) {
            self = date
            return
        }

        return nil
    }
    
    /// RFC3339形式の文字列からDateを生成します。
    /// - parameter fromRFC3339: RFC3339形式で表現された文字列
    public init?(fromRFC3339 string: String) {
        let formatter = Date.formatter
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'"
        if let date = formatter.date(from: string) {
            let sec = floor(date.timeIntervalSince1970)
            var few: Double = 0
            if string.contains(".") {
                let split1 = string.split(separator: ".")
                guard split1.count >= 2 else { return nil }
                let split2 = split1[1].split(separator: "Z")
                guard split2.count >= 1 else { return nil }
                let sFew = String(split2[0])
                guard var v = Double(sFew) else { return nil }
                for _ in 0..<sFew.count { v = v * 0.1 }
                few = v
            }
            let time = sec + few
            self = Date(timeIntervalSince1970: time)
            return
        }
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSxxxxx"
        if let date = formatter.date(from: string) {
            let sec = floor(date.timeIntervalSince1970)
            var few: Double = 0
            if string.contains(".") {
                let split1 = string.split(separator: ".")
                guard split1.count >= 2 else { return nil }
                var sFew: String
                if split1[1].contains("+") {
                    sFew = String(split1[1].split(separator: "+")[0])
                }
                else if split1[1].contains("-") {
                    sFew = String(split1[1].split(separator: "-")[0])
                } else { return nil }
                guard var v = Double(sFew) else { return nil }
                for _ in 0..<sFew.count { v = v * 0.1 }
                few = v
            }
            let time = sec + few
            self = Date(timeIntervalSince1970: time)
            return
        }

        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        if let date = formatter.date(from: string) {
            self = date
            return
        }
        return nil
    }

}

