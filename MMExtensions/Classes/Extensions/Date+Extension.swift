//
//  NSDate+Extension.swift
//  Muthuraj Muthulingam
//  Copyright © 2017 Muthuraj Muthulingam. All rights reserved.
//

import Foundation

public enum MMDateFormat: String {
    case mmmDDYYY = "MMM dd, YYYY"
}

public extension Date
{
    public init(withMilliseconds date: Int64) {
        self.init(timeIntervalSince1970: TimeInterval(date / 1000))
    }
    
    /// convert string from milliseconds value
    public static func stringFromMilliSeconds(date:Int64, format : MMDateFormat = .mmmDDYYY) -> String
    {
        let date = Date(withMilliseconds: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: date)
    }
    
    /// returns string friendly format
    public func timeAgoWithCurrentTime(_ timestamp : Int64) -> String {
        
        let interval = timestamp
        let now:Date = NSDate(timeIntervalSince1970: TimeInterval(interval)) as Date
        
        let deltaSeconds = (self.timeIntervalSince(now));
        let deltaMinutes = deltaSeconds / 60.0;
        
        var minutes: Double
        
        if(deltaSeconds < 5) {
            return "a second ago".localized()
        }
        else if(deltaSeconds < 60) {
            return String(format: "%@ seconds ago".localized(),deltaSeconds)
        }
        else if(deltaSeconds < 120) {
            return "one minute ago".localized()
        }
        else if (deltaSeconds < 180)
        {
            return "two minutes ago".localized()
        }
        else if (deltaMinutes < 60) {
            return String(format: "%@ minutes ago".localized(),deltaMinutes)
        }
        else if (deltaMinutes < 120) {
            return "1 hour ago".localized()
        }
        else if (deltaMinutes < (24 * 60)) {
            minutes = (floor(deltaMinutes/60))
            return String(format: "%@ hours ago".localized(), minutes)
        }
        else if (deltaMinutes < (24 * 60 * 2)) {
            return "One day ago".localized()
        }
        else if (deltaMinutes < (24 * 60 * 3) && deltaMinutes >= (24 * 60 * 2))
        {
            return "Two days ago".localized()
        }
        else if (deltaMinutes < (24 * 60 * 7)) {
            minutes = (floor(deltaMinutes/(60 * 24)))
            return String(format: "%@ days ago".localized(), minutes)
        }
        else if (deltaMinutes < (24 * 60 * 14)) {
            return "last week".localized()
        }
        else if (deltaMinutes < (24 * 60 * 31)) {
            minutes = (floor(deltaMinutes/(60 * 24 * 7)))
            return String(format: "%@ weeks ago".localized(),minutes)
        }
        else if (deltaMinutes < (24 * 60 * 61)) {
            return "last month".localized()
        }
        else if (deltaMinutes < (24 * 60 * 365.25)) {
            minutes = (floor(deltaMinutes/(60 * 24 * 30)))
            return String(format: "%.0f",minutes)
        }
        else if (deltaMinutes < (24 * 60 * 731)) {
            return "last year".localized()
        }
        
        minutes = (floor(deltaMinutes/(60 * 24 * 365)))
        return String(format: "%.0f years ago".localized(),minutes)
    }
}



