//
//  Date+Extension.swift
//  Tracker
//
//  Created by Anka on 22.08.2023.
//

import Foundation

extension Date {
    var yearMonthDayComponents: DateComponents {
        Calendar.current.dateComponents([.year, .month, .day], from: self)
    }
}
