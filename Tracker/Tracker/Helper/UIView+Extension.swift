//
//  UIView+Extension.swift
//  Tracker
//
//  Created by Ann Goncharova on 29.10.2023.
//

import UIKit

// установка фонового изображения на всю область экрана
extension UIView {
    
    func addBackground(image: String) {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let imageViewBackground = UIImageView(frame: CGRectMake(0, 0, width, height))
        imageViewBackground.image = UIImage(named: image)
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }
}
