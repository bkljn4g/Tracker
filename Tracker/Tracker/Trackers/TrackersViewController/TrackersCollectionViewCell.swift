//
//  TrackersCollectionViewCell.swift
//  Tracker
//
//  Created by Anka on 22.08.2023.
//

import UIKit

protocol TrackersCollectionViewCellDelegate: AnyObject {
    func completedTracker(id: UUID)
}

final class TrackersCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "trackersCollectionViewCell"
    
    public weak var delegate: TrackersCollectionViewCellDelegate?
<<<<<<< HEAD
=======
    public var menuView: UIView {
        return trackerView
    }
>>>>>>> sprint_17
    private var isCompletedToday: Bool = false
    private var trackerId: UUID? = nil
    private let limitNumberOfCharacters = 38
    
    // ячейка трекера
    private lazy var trackerView: UIView = {
        let trackerView = UIView()
        trackerView.layer.cornerRadius = 16
        trackerView.translatesAutoresizingMaskIntoConstraints = false
        return trackerView
    }()
    
<<<<<<< HEAD
=======
    private lazy var pinImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pinSquare")
        image.isHidden = false
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
>>>>>>> sprint_17
    // вью на которой лежит эмодзи
    private lazy var emojiView: UIView = {
        let emojiView = UIView()
        emojiView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        emojiView.layer.cornerRadius = 12
        emojiView.translatesAutoresizingMaskIntoConstraints = false
        return emojiView
    }()
    
    // лейбл с эмодзи
    private lazy var emojiLabel: UILabel = {
        let emojiLabel = UILabel()
        emojiLabel.clipsToBounds = true
        emojiLabel.layer.cornerRadius = 12
        emojiLabel.font = .systemFont(ofSize: 16)
        emojiLabel.textAlignment = .center
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        return emojiLabel
    }()
    
    // лейбл названия трекера
    private lazy var trackerNameLabel: UILabel = {
        let trackerNameLabel = UILabel()
<<<<<<< HEAD
        trackerNameLabel.font = .systemFont(ofSize: 12, weight: .medium) // поменяла размер шрифта
        trackerNameLabel.textColor = .white // поменяла цвет шрифта (black - white)
        trackerNameLabel.numberOfLines = 0
=======
        trackerNameLabel.font = .systemFont(ofSize: 12, weight: .medium)
        trackerNameLabel.textColor = .ypWhite
        trackerNameLabel.numberOfLines = 2
>>>>>>> sprint_17
        trackerNameLabel.text = "Название трекера"
        trackerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return trackerNameLabel
    }()
    
    // кол-во дней выполнения привычки
    private lazy var resultLabel: UILabel = {
        let resultLabel = UILabel()
        resultLabel.text = "0 дней"
        resultLabel.textColor = .ypBlack
<<<<<<< HEAD
        resultLabel.font = .systemFont(ofSize: 12, weight: .medium) // поменяла шрифт и его размер
=======
        resultLabel.font = .systemFont(ofSize: 12, weight: .medium)
>>>>>>> sprint_17
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        return resultLabel
    }()
    
    // кнопка выполнения привычки
    private lazy var checkButton: UIButton = {
        let checkButton = UIButton()
<<<<<<< HEAD
        checkButton.setImage(UIImage(named: "plus"), for: .normal) // добавила картинку нормального размера
        checkButton.addTarget(self, action: #selector(didTapCheckButton), for: .touchUpInside)
        checkButton.tintColor = .white
=======
        checkButton.setImage(UIImage(named: "plus"), for: .normal)
        checkButton.addTarget(self, action: #selector(didTapCheckButton), for: .touchUpInside)
        checkButton.tintColor = .ypWhite
        checkButton.backgroundColor = .ypWhite
>>>>>>> sprint_17
        checkButton.layer.cornerRadius = 17
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        return checkButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(trackerView)
<<<<<<< HEAD
=======
        trackerView.addSubview(pinImageView)
>>>>>>> sprint_17
        contentView.addSubview(resultLabel)
        contentView.addSubview(checkButton)
        trackerView.addSubview(emojiView)
        emojiView.addSubview(emojiLabel)
        trackerView.addSubview(trackerNameLabel)
        
        NSLayoutConstraint.activate([
            
            // ячейка привычки
            trackerView.heightAnchor.constraint(equalToConstant: 90),
            trackerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            trackerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            trackerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
<<<<<<< HEAD
=======
            trackerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -58),
            trackerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            // пин
            pinImageView.heightAnchor.constraint(equalToConstant: 12),
            pinImageView.widthAnchor.constraint(equalToConstant: 8),
            pinImageView.topAnchor.constraint(equalTo: trackerView.topAnchor, constant: 18),
            pinImageView.trailingAnchor.constraint(equalTo: trackerView.trailingAnchor, constant: -12),
>>>>>>> sprint_17
            
            // мини-вьюшка на которой лежит эмодзи
            emojiView.heightAnchor.constraint(equalToConstant: 24),
            emojiView.widthAnchor.constraint(equalToConstant: 24),
            emojiView.topAnchor.constraint(equalTo: trackerView.topAnchor, constant: 12),
            emojiView.leadingAnchor.constraint(equalTo: trackerView.leadingAnchor, constant: 12),
            
            // лейбл с эмодзи
            emojiLabel.centerXAnchor.constraint(equalTo: emojiView.centerXAnchor) ,
            emojiLabel.centerYAnchor.constraint(equalTo: emojiView.centerYAnchor),
            
            // лейбл с текстом привычки в ячейке события
<<<<<<< HEAD
            trackerNameLabel.trailingAnchor.constraint(equalTo: trackerView.trailingAnchor, constant: -12),
            trackerNameLabel.leadingAnchor.constraint(equalTo: trackerView.leadingAnchor, constant: 12),
            trackerNameLabel.bottomAnchor.constraint(equalTo: trackerView.bottomAnchor, constant: -12),
            
            // кнопка + под ячейкой события
            checkButton.topAnchor.constraint(equalTo: trackerView.bottomAnchor, constant: 8),
            checkButton.trailingAnchor.constraint(equalTo: trackerView.trailingAnchor, constant: -12),
=======
            trackerNameLabel.topAnchor.constraint(equalTo: trackerView.topAnchor, constant: 44),
            trackerNameLabel.trailingAnchor.constraint(equalTo: trackerView.trailingAnchor, constant: -12),
            trackerNameLabel.leadingAnchor.constraint(equalTo: trackerView.leadingAnchor, constant: 12),
            trackerNameLabel.heightAnchor.constraint(equalToConstant: 34),
            
            // кнопка + под ячейкой события
            checkButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            checkButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
>>>>>>> sprint_17
            checkButton.heightAnchor.constraint(equalToConstant: 34),
            checkButton.widthAnchor.constraint(equalToConstant: 34 ),
            
            // лейбл с кол-вом дней под ячейками привычек и событий
            resultLabel.centerYAnchor.constraint(equalTo: checkButton.centerYAnchor),
            resultLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc private func didTapCheckButton() {
        guard let id = trackerId else {
            print("Id not set")
            return
        }
        delegate?.completedTracker(id: id)
    }
    
    func configure(
        _ id: UUID,
        name: String,
        color: UIColor,
        emoji: String,
        isCompleted: Bool,
        isEnabled: Bool,
<<<<<<< HEAD
        completedCount: Int
    ) {
        let mod10 = completedCount % 10
        let mod100 = completedCount % 100
        let not10To20 = mod100 < 10 || mod100 > 20
        var str = "\(completedCount) "
=======
        completedCount: Int,
        pinned: Bool
    ) {
>>>>>>> sprint_17
        
        trackerId = id
        trackerNameLabel.text = name
        trackerView.backgroundColor = color
        checkButton.backgroundColor = color
        emojiLabel.text = emoji
<<<<<<< HEAD
        isCompletedToday = isCompleted
        checkButton.setImage(isCompletedToday ? UIImage(systemName: "checkmark")! : UIImage(systemName: "plus")!, for: .normal)

=======
        pinImageView.isHidden = !pinned
        isCompletedToday = isCompleted
        checkButton.setImage(isCompletedToday ? UIImage(systemName: "checkmark")! : UIImage(systemName: "plus")!, for: .normal)
        
>>>>>>> sprint_17
        // если кнопка события нажата, делаем полупрозрачной
        if isCompletedToday == true {
            checkButton.alpha = 0.5
        } else {
            checkButton.alpha = 1
        }
        checkButton.isEnabled = isEnabled
<<<<<<< HEAD
        
        if completedCount == 0 {
            str += "дней"
        } else if mod10 == 1 && not10To20 {
            str += "день"
        } else if (mod10 == 2 || mod10 == 3 || mod10 == 4) && not10To20 {
            str += "дня"
        } else {
            str += "дней"
        }
        resultLabel.text = str
=======
        resultLabel.text = String.localizedStringWithFormat(NSLocalizedString("numberOfDay", comment: "Число дней"), completedCount)
>>>>>>> sprint_17
    }
}
