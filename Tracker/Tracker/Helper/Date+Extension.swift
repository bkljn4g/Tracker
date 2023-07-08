//
//  Date+Extension.swift
//  Tracker
//
//  Created by Anka on 08.07.2023.
//

import UIKit

extension Date {
    var yearMonthDayComponents: DateComponents {
        Calendar.current.dateComponents([.year, .month, .day], from: self)
    }
}
