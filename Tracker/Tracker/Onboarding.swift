//
//  Onboarding.swift
//  Tracker
//
//  Created by Ann Goncharova on 26.10.2023.
//

import UIKit

final class OnboardingVC: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    private lazy var pages: [UIViewController] = {
        return[redVC, blueVC]
    }()
    
    private lazy var redVC: UIViewController = {
        let redVC = UIViewController()
        let image = "onboardingRed"
        redVC.view.addBackground(image: image)
        return redVC
    }()
    
    private lazy var blueVC: UIViewController = {
        let redVC = UIViewController()
        let image = "onboardingBlue"
        redVC.view.addBackground(image: image)
        return blueVC
    }()
}
