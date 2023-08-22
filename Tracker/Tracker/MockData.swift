//
//  MockData.swift
//  Tracker
//
//  Created by Anka on 22.08.2023.
//

import Foundation

class MockData {
    static var categories: [TrackerCategory] = [
        TrackerCategory(name: "Важное", trackers: [
            Tracker(id: UUID(), name: "Полить цветы", color: .color15, emoji: "🏝", schedule: [.wednesday, .saturday]),
            Tracker(id: UUID(), name: "Помыть посуду", color: .color13, emoji: "🙂", schedule: [.monday, .saturday, .wednesday, .friday, .sunday, .thursday,.tuesday])
        ]),
        TrackerCategory(name: "Тренировки", trackers: [
            Tracker(id: UUID(), name: "Зарядка", color: .color10, emoji: "🤸‍♂️", schedule: [.monday, .wednesday, .friday]),
            Tracker(id: UUID(), name: "Бассейн", color: .color14, emoji: "🏊‍♀️", schedule: [.tuesday, .thursday, .saturday]),
            Tracker(id: UUID(), name: "Бег", color: .color17, emoji: "🏃‍♂️", schedule: [.wednesday, .saturday]),
        Tracker(id: UUID(), name: "Зарядка", color: .color10, emoji: "🤸‍♂️", schedule: [.monday, .wednesday, .saturday]),
        Tracker(id: UUID(), name: "Бассейн", color: .color14, emoji: "🏊‍♀️", schedule: [.tuesday, .thursday, .saturday]),
            Tracker(id: UUID(), name: "Бег", color: .color17, emoji: "🏃‍♂️", schedule: [.wednesday, .saturday]),
    ])]
}
