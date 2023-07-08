//
//  TrackersViewController.swift
//  Tracker
//
//  Created by Anka on 08.07.2023.
//

import UIKit

class TrackersViewController: UIViewController {
    private var currentDate: Int?
    private var searchText: String = ""
    private var mainTitle = UILabel()
    private var widthAnchor: NSLayoutConstraint?
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        return formatter
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "star")
        return imageView
    }()
    
    
    
    
    
    override func viewDidLoad () {
        super.viewDidLoad()
        
        
    }
}
