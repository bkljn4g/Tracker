//
//  StatisticsViewController.swift
//  Tracker
//
//  Created by Ann Goncharova on 22.08.2023.
//

import UIKit

final class StatisticsVC: UIViewController {
    
        private let colors = Colors()
        private let trackerRecordStore = TrackerRecordStore()
        private var completedTrackers: [TrackerRecord] = []
        
        private lazy var titleStatistics: UILabel = {
            let label = UILabel()
            label.textColor = .ypBlack
            label.text = NSLocalizedString("statistics", tableName: "LocalizableString", comment: "statistics")
            label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private lazy var imageNoStatistics: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "noStatistics")
            return imageView
        }()
        
        // текст под плачущим эмодзи
        private lazy var titleImageNoStatistics: UILabel = {
            let label = UILabel()
            label.textColor = .ypBlack
            label.text = "Анализировать пока нечего"
            label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private lazy var completedTrackerView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        private lazy var resultTitle: UILabel = {
            let label = UILabel()
            label.textColor = .ypBlack
            label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
            label.textAlignment = .left
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        // текст в ячейке (лучший период, идеальные дни и тд)
        private lazy var resultSubTitle: UILabel = {
            let label = UILabel()
            label.textColor = .ypBlack
            label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            label.textAlignment = .left
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colors.viewBackgroundColor
    }
}
