//
//  EmojiAndColorCollectionViewCell.swift
//  Tracker
//
//  Created by Ann Goncharova on 21.10.2023.
//

import UIKit

final class EmojiAndColorCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "emojiAndColorCollectionViewCell"
    
    lazy var emojiLabel: UILabel = {
        let emojiLabel = UILabel()
        emojiLabel.font = .boldSystemFont(ofSize: 32)
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        return emojiLabel
    }()
    
    lazy var colorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(emojiLabel)
        contentView.addSubview(colorView)
        
<<<<<<< HEAD
        let colorViewHeight: CGFloat = 40
        let colorViewWidth: CGFloat = 40
        
=======
>>>>>>> sprint_17
        NSLayoutConstraint.activate([
            
            emojiLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            emojiLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            colorView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            colorView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
<<<<<<< HEAD
            colorView.heightAnchor.constraint(equalToConstant: colorViewHeight),
            colorView.widthAnchor.constraint(equalToConstant: colorViewWidth)
=======
            colorView.heightAnchor.constraint(equalToConstant: 40),
            colorView.widthAnchor.constraint(equalToConstant: 40)
>>>>>>> sprint_17
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
