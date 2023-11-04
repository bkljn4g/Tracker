//
//  Tracker.swift
//  Tracker
//
//  Created by Ann Goncharova on 22.08.2023.
//

import UIKit

struct Tracker: Hashable {
    
    let id: UUID
    let name: String
    let color: UIColor?
    let emoji: String?
    let schedule: [WeekDay]?
<<<<<<< HEAD
=======
    let pinned: Bool?
    var category: TrackerCategoryModel? {
        return TrackerCategoryStore().category(forTracker: self)
    }
>>>>>>> sprint_17
}
