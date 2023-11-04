//
//  ScheduleVC.swift
//  Tracker
//
//  Created by Ann Goncharova on 22.08.2023.
//

import UIKit

protocol ScheduleVCDelegate: AnyObject {
    func createSchedule(schedule: [WeekDay])
}

class ScheduleVC: UIViewController {
<<<<<<< HEAD
    
=======
    private let colors = Colors()
>>>>>>> sprint_17
    public weak var delegate: ScheduleVCDelegate?
    var schedule: [WeekDay] = []
    
    // лейбл "Расписание"
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .ypBlack
        label.text = "Расписание"
<<<<<<< HEAD
        label.font = .systemFont(ofSize: 16, weight: .medium) // поменяла шрифт на .medium
=======
        label.font = .systemFont(ofSize: 16, weight: .medium)
>>>>>>> sprint_17
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // кнопка "Готово"
    private lazy var enterButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Готово", for: .normal)
<<<<<<< HEAD
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium) // поменяла шрифт на .medium
=======
        button.setTitleColor(.ypWhite, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
>>>>>>> sprint_17
        button.backgroundColor = .ypBlack
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(enterButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
<<<<<<< HEAD
=======
    private lazy var buttonBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .ypWhite
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        }()
    
>>>>>>> sprint_17
    // таблица с днями недели
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        var width = view.frame.width - 16 * 2
        var height = 7 * 75
        tableView.register(WeekDayTableViewCell.self, forCellReuseIdentifier: WeekDayTableViewCell.identifier)
        tableView.layer.cornerRadius = 16
        tableView.separatorColor = .ypGray
<<<<<<< HEAD
        tableView.frame = CGRect(x: 0, y: 0, width: Int(width), height: 525) // отображение всех дней недели при запуске
=======
        tableView.backgroundColor = .ypWhite
        tableView.frame = CGRect(x: 16, y: 16, width: Int(width), height: Int(height))
>>>>>>> sprint_17
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
<<<<<<< HEAD
        scrollView.backgroundColor = .white
=======
        scrollView.backgroundColor = .ypWhite
>>>>>>> sprint_17
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
<<<<<<< HEAD
    private lazy var buttonBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
=======
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colors.viewBackgroundColor
>>>>>>> sprint_17
        addSubviews()
        setupLayout()
    }
    
    private func addSubviews() {
        view.addSubview(label)
        view.addSubview(scrollView)
        scrollView.addSubview(tableView)
        scrollView.addSubview(buttonBackgroundView)
        buttonBackgroundView.addSubview(enterButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 27),
            
            enterButton.bottomAnchor.constraint(equalTo: buttonBackgroundView.bottomAnchor, constant: -50),
            enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            enterButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            enterButton.heightAnchor.constraint(equalToConstant: 60),
            
            scrollView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            buttonBackgroundView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonBackgroundView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttonBackgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonBackgroundView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    @objc
    private func enterButtonAction() {
        delegate?.createSchedule(schedule: schedule)
        dismiss(animated: true)
    }
}

extension ScheduleVC: UITableViewDataSource {
    
<<<<<<< HEAD
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WeekDay.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let weekDayCell = tableView.dequeueReusableCell(withIdentifier: WeekDayTableViewCell.identifier) as? WeekDayTableViewCell else {
            return UITableViewCell()
        }
        let weekDay = WeekDay.allCases[indexPath.row]
        weekDayCell.delegate = self
        //weekDayCell.contentView.backgroundColor = .backgroundColor
        weekDayCell.selectionStyle = .none // убрала выделение ячеек серым при нажатии
        weekDayCell.label.text = WeekDay.allCases[indexPath.row].rawValue
        weekDayCell.weekDay = weekDay
        weekDayCell.switchCell.isOn = schedule.contains(weekDay)
        if indexPath.row == 6 {
            weekDayCell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        } else {
            weekDayCell.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        }
        return weekDayCell
    }
=======
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return WeekDay.allCases.count
        }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let weekDayCell = tableView.dequeueReusableCell(withIdentifier: WeekDayTableViewCell.identifier) as? WeekDayTableViewCell else {
                return UITableViewCell()
            }
            let weekDay = WeekDay.allCases[indexPath.row]
            weekDayCell.delegate = self
            weekDayCell.contentView.backgroundColor = .backgroundColor
            weekDayCell.selectionStyle = .none
            weekDayCell.label.text = WeekDay.allCases[indexPath.row].rawValue
            weekDayCell.weekDay = weekDay
            weekDayCell.switchCell.isOn = schedule.contains(weekDay)
            if indexPath.row == 6 {
                weekDayCell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            } else {
                weekDayCell.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
            }
            return weekDayCell
        }
>>>>>>> sprint_17
}

extension ScheduleVC: UITableViewDelegate {
    
<<<<<<< HEAD
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
=======
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 75
        }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
>>>>>>> sprint_17
}

extension ScheduleVC: WeekDayTableViewCellDelegate {
    
    func stateChanged(for day: WeekDay, isOn: Bool) {
        if isOn {
            schedule.append(day)
        } else {
            if let index = schedule.firstIndex(of: day) {
                schedule.remove(at: index)
            }
        }
    }
}
