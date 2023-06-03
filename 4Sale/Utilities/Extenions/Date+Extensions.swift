//
//  Date+Extensions.swift
//  POMacArch
//
//  Created by Mohamed gamal on 05/05/2021.
//  Copyright © 2021 POMac. All rights reserved.
//

import Foundation

extension TimeZone {
    static let gmt = TimeZone(secondsFromGMT: 0)!
}
extension Formatter {
    static let date = DateFormatter()
}
extension Date {
    func localizedDescription(dateStyle: DateFormatter.Style = .medium,
                              timeStyle: DateFormatter.Style = .medium,
                              timeZone: TimeZone = .current,
                              locale: Locale = .current) -> String {
        Formatter.date.locale = locale
        Formatter.date.timeZone = timeZone
        Formatter.date.dateStyle = dateStyle
        Formatter.date.timeStyle = timeStyle
        return Formatter.date.string(from: self)
    }
    var localizedDescription: String { localizedDescription() }
}

extension Date {
    
    var fullDate: String { localizedDescription(dateStyle: .full, timeStyle: .none) }
    var longDate: String { localizedDescription(dateStyle: .long, timeStyle: .none) }
    var mediumDate: String { localizedDescription(dateStyle: .medium, timeStyle: .none) }
    var shortDate: String { localizedDescription(dateStyle: .short, timeStyle: .none) }
    
    var fullTime: String { localizedDescription(dateStyle: .none, timeStyle: .full) }
    var longTime: String { localizedDescription(dateStyle: .none, timeStyle: .long) }
    var mediumTime: String { localizedDescription(dateStyle: .none, timeStyle: .medium) }
    var shortTime: String { localizedDescription(dateStyle: .none, timeStyle: .short) }
    
    var fullDateTime: String { localizedDescription(dateStyle: .full, timeStyle: .full) }
    var longDateTime: String { localizedDescription(dateStyle: .long, timeStyle: .long) }
    var mediumDateTime: String { localizedDescription(dateStyle: .medium, timeStyle: .medium) }
    var shortDateTime: String { localizedDescription(dateStyle: .short, timeStyle: .short) }
    
    func equal(to date: Date) -> Bool {
        Calendar.current.compare(self, to: date, toGranularity: .day) == ComparisonResult.orderedSame && Calendar.current.compare(self, to: date, toGranularity: .month) == ComparisonResult.orderedSame && Calendar.current.compare(self, to: date, toGranularity: .year) == ComparisonResult.orderedSame
    }
    
    func toString(format: DateFormate) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.timeZone = .current
        dateFormatter.locale = .init(identifier: "en")
        return dateFormatter.string(from: self)
    }
    
    func toEnglishString(format: DateFormate) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.timeZone = .current
        dateFormatter.locale = .init(identifier: "en_US_POSIX")
        return dateFormatter.string(from: self)
    }
    
    func timeAgo() -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.year, .month, .day, .hour, .minute, .second]
        formatter.zeroFormattingBehavior = .dropAll
        formatter.maximumUnitCount = 1
        let locale = Locale.init(identifier: "en")
        return String(format: formatter.string(from: self, to: Date()) ?? "", locale: locale)
    }
    
    func getNextDay(date : Date) -> Date?{
        return Calendar.current.date(byAdding: .day, value: 1, to: date)
    }
    
    func getPreviousDay(date : Date) -> Date?{
        return Calendar.current.date(byAdding: .day, value: -1, to: date)
    }
    
    func remainingDays(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    
   
    func timeAgoDisplay() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        
        if secondsAgo < minute {
            return "Just Now".localized
        } else if secondsAgo < hour {
            return "\(secondsAgo / minute)"+" min ago".localized
        } else if secondsAgo < day {
            return "\(secondsAgo / hour)"+" hrs ago".localized
        } else if secondsAgo < week {
            return "\(secondsAgo / day)"+" days ago".localized
        }
        
        return "\(secondsAgo / week)"+" weeks ago".localized
    }
}

extension Date {
    static func getDateFormOpstCreated(dateEx: String) -> Date? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.locale = Locale(identifier: "en_US_POSIX")
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatterGet.date(from: dateEx)
        //  print(dateFormatterPrint.string(from: date))
        return date
        
    }
    
    static func getDateFormString(dateEx: String) -> Date? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.locale = Locale(identifier: "en_US_POSIX")
        dateFormatterGet.dateFormat = "dd MMMM yyyy"
        let date = dateFormatterGet.date(from: dateEx)
        //  print(dateFormatterPrint.string(from: date))
        return date
        
    }
    
    static func getTimeFormString(dateEx: String) -> Date? {
        let outFormatter = DateFormatter()
        outFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        outFormatter.dateFormat = "hh:mm a"

        let date = outFormatter.date(from: dateEx)
        // Customisable AP/PM symbols
       print(date)
        return date
        
    }
    
    static func getRemainTima (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}
