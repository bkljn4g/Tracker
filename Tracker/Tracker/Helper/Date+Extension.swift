//
//  Date+Extension.swift
//  Tracker
//
//  Created by Ann Goncharova on 08.07.2023.
//

import UIKit

extension Date {
    var yearMonthDayComponents: DateComponents {
        Calendar.current.dateComponents([.year, .month, .day], from: self)
    }
}
