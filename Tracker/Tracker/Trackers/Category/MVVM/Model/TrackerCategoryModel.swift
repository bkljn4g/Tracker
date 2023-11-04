//
//  TrackerCategory.swift
//  Tracker
//
//  Created by Ann Goncharova on 22.08.2023.
//

import UIKit

<<<<<<< HEAD
struct TrackerCategoryModel {
=======
struct TrackerCategoryModel: Hashable {
>>>>>>> sprint_17
    
    let name: String
    let trackers: [Tracker]
    
<<<<<<< HEAD
    func visibleTrackers(filterString: String) -> [Tracker] {
        if filterString.isEmpty {
            return trackers
        } else {
            return trackers.filter { $0.name.lowercased().contains(filterString.lowercased()) }
=======
    func visibleTrackers(filterString: String, pin: Bool?) -> [Tracker] {
        if filterString.isEmpty {
            return pin == nil ? trackers : trackers.filter { $0.pinned == pin }
        } else {
            return pin == nil ? trackers
                .filter { $0.name.lowercased().contains(filterString.lowercased()) }
            : trackers
                .filter { $0.name.lowercased().contains(filterString.lowercased()) }
                .filter { $0.pinned == pin }
>>>>>>> sprint_17
        }
    }
}
