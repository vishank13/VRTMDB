//
//  DateHelper.swift
//  tmdb
//
//  Created by Vishank Raghav on 18/11/23.
//

import Foundation

class DateHelper {
    
    static let df = DateFormatter()
    
//    static func getDisplayDate(str: String) -> String {
//        df.dateFormat = "yyyy-mm-dd"
//        guard let serverDate = df.date(from: str) else {
//            return ""
//        }
//        df.dateFormat = "MMM d, yyyy"
//        return df.string(from: serverDate)
//    }
    
//    static func getDisplayDate(str: String,
//                               format: String) -> String {
//        df.dateFormat = "yyyy-mm-dd"
//        guard let serverDate = df.date(from: str) else {
//            return ""
//        }
//        df.dateFormat = format
//        return df.string(from: serverDate)
//    }
    
    static func getDisplayDate(str: String,
                               sourceFormat: String = "yyyy-MM-dd",
                               format: String = "MMM d, yyyy") -> String {
        df.dateFormat = sourceFormat
        guard let serverDate = df.date(from: str) else {
            return ""
        }
        df.dateFormat = format
        return df.string(from: serverDate)
    }
    
    static func getDateFrom(str: String,
                            sourceFormat: String = "yyyy-MM-dd") -> Date? {
        df.dateFormat = sourceFormat
        guard let serverDate = df.date(from: str) else {
            return nil
        }
        
        return serverDate
    }
}
