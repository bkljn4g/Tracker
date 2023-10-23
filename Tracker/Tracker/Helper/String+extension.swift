//
//  String+extension.swift
//  Tracker
//
//  Created by Anka on 22.10.2023.
//

import UIKit

// конвертация строки с цветом в объект юайКолор
extension String {
    var color: UIColor {
        var rgbValue:UInt64 = 0
        Scanner(string: self).scanHexInt64(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
