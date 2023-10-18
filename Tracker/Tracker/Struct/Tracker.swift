//
//  Tracker.swift
//  Tracker
//
//  Created by Ann Goncharova on 22.08.2023.
//

import UIKit

struct Tracker {
    
    let id: UUID
    let name: String
    let color: UIColor?
    let emoji: String?
    let schedule: [WeekDay]?
}
