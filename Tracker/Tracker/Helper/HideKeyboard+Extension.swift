//
//  HideKeyboard+Extension.swift
//  Tracker
//
//  Created by Anka on 29.09.2023.
//

import UIKit

// скрытие клавиатуры при нажатии на экран
extension UIViewController {
    func addTapGestureToHideKeyboard(for editedView: UIView) {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(editedView.endEditing))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
}
