//
//  TrackerCategory.swift
//  Tracker
//
//  Created by Ann Goncharova on 22.08.2023.
//

import UIKit

struct TrackerCategory {
    
    let name: String
    let trackers: [Tracker]
    
    func visibleTrackers(filterString: String) -> [Tracker] {
        if filterString.isEmpty {
            return trackers
        } else {
            return trackers.filter { $0.name.lowercased().contains(filterString.lowercased()) }
        }
    }
}
