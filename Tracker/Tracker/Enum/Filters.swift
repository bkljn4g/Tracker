//
//  Filters.swift
//  Tracker
//
//  Created by Ann Goncharova on 30.10.2023.
//

import Foundation

enum Filter: String, CaseIterable {
    case all = "Все трекеры"
    case today = "Трекеры на сегодня"
    case completed = "Завершенные"
    case uncompleted = "Незавершенные"
}
