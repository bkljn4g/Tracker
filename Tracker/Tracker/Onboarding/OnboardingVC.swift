//
//  Onboarding.swift
//  Tracker
//
//  Created by Ann Goncharova on 26.10.2023.
//

import UIKit

final class OnboardingVC: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    private lazy var pages: [UIViewController] = {
        return[blueVC, redVC]
    }()
    
    // красный экран Онбординга
    private lazy var redVC: UIViewController = {
        let redVC = UIViewController()
        let image = "onboardingRed"
        redVC.view.addBackground(image: image)
        return redVC
    }()
    
    // синий экран Онбординга
    private lazy var blueVC: UIViewController = {
        let blueVC = UIViewController()
        let image = "onboardingBlue"
        blueVC.view.addBackground(image: image)
        return blueVC
    }()
    
    // отображение индикации текущей страницы
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .ypBlack
        pageControl.pageIndicatorTintColor = UIColor.ypBlack.withAlphaComponent(0.3)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    // лейбл с текстом на синем экране
    private lazy var blueVCLabel: UILabel = {
        let label = UILabel()
        label.textColor = .ypBlack
        label.font = .boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.text = "Отслеживайте только то, что хотите"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // кнопка на синем экране
    private lazy var buttonOnBlueVC: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Вот это технологии!", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .ypBlack
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(enterButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // лейбл с текстом на красном экране
    private lazy var redVCLabel: UILabel = {
        let label = UILabel()
        label.textColor = .ypBlack
        label.font = .boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.text = "Даже если это не литры воды и йога"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // кнопка на красном экране
    private lazy var buttonOnRedVC: UIButton = {
        let button = UIButton()
        button.setTitle("Вот это технологии!", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = .ypBlack
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(enterButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        if let first = pages.first { setViewControllers([first], direction: .forward, animated: true, completion: nil)
        }
        
        addBlueVC()
        addRedVC()
        addPageControl()
    }
    
    private func addBlueVC() {
        blueVC.view.addSubview(blueVCLabel)
        blueVC.view.addSubview(buttonOnBlueVC)
        
        NSLayoutConstraint.activate([
            blueVCLabel.bottomAnchor.constraint(equalTo: blueVC.view.safeAreaLayoutGuide.bottomAnchor, constant: -290),
            blueVCLabel.centerXAnchor.constraint(equalTo: blueVC.view.safeAreaLayoutGuide.centerXAnchor),
            blueVCLabel.widthAnchor.constraint(equalToConstant: 343),
            
            buttonOnBlueVC.heightAnchor.constraint(equalToConstant: 60),
            buttonOnBlueVC.leadingAnchor.constraint(equalTo: blueVC.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buttonOnBlueVC.trailingAnchor.constraint(equalTo: blueVC.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            buttonOnBlueVC.bottomAnchor.constraint(equalTo: blueVC.view.safeAreaLayoutGuide.bottomAnchor, constant: -71)
        ])
    }
    
    private func addRedVC() {
        redVC.view.addSubview(redVCLabel)
        redVC.view.addSubview(buttonOnRedVC)
        
        NSLayoutConstraint.activate([
            redVCLabel.bottomAnchor.constraint(equalTo: redVC.view.safeAreaLayoutGuide.bottomAnchor, constant: -290),
            redVCLabel.centerXAnchor.constraint(equalTo: redVC.view.safeAreaLayoutGuide.centerXAnchor),
            redVCLabel.widthAnchor.constraint(equalToConstant: 343),
            
            buttonOnRedVC.heightAnchor.constraint(equalToConstant: 60),
            buttonOnRedVC.leadingAnchor.constraint(equalTo: redVC.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buttonOnRedVC.trailingAnchor.constraint(equalTo: redVC.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            buttonOnRedVC.bottomAnchor.constraint(equalTo: redVC.view.safeAreaLayoutGuide.bottomAnchor, constant: -71)
        ])
    }
    
    private func addPageControl() {
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -155),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func enterButtonAction() {
        guard let window = UIApplication.shared.windows.first else {
            fatalError("Invalid Configuration")
        }
        window.rootViewController = TabBarController.configure()
        
        UserDefaults.standard.set(true, forKey: "isOnbordingShown") // отслеживает показ нажатия экрана Онбординга, ставит флаг в юзер дефолтс (экран был показан)
    }
    
    // MARK: - UIPageViewControllerDataSource
    
    // определяет предыдущую страницу которая должна отображаться при пролистывании
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return pages.last
        }
        return pages[previousIndex]
    }
    
    // определяет следующую страницу которая должна отображаться при пролистывании
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < pages.count else {
            return pages.first
        }
        return pages[nextIndex]
    }

    // MARK: - UIPageViewControllerDelegate
    
    // обновление индикатора текущей страницы
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool) {
        if let currentViewController = pageViewController.viewControllers?.first,
           let currentIndex = pages.firstIndex(of: currentViewController) {
            pageControl.currentPage = currentIndex
        }
    }
}
