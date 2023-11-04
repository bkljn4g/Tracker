//
//  Color+Extension.swift
//  Tracker
//
//  Created by Ann Goncharova on 22.08.2023.
//

import UIKit

<<<<<<< HEAD
=======
final class Colors {
    var viewBackgroundColor = UIColor.systemBackground
    var datePickerTintColor = UIColor { (traits) -> UIColor in
        let isDarkMode = traits.userInterfaceStyle == .dark
        return isDarkMode ? UIColor.black : UIColor.black
    }
}

>>>>>>> sprint_17
extension UIColor {
    
    static var backgroundColor: UIColor { UIColor(named: "backgroundColor") ?? UIColor.red }
    static var findColor: UIColor { UIColor(named: "findColor") ?? UIColor.gray }
    static var ypGray: UIColor { UIColor(named: "ypGray") ?? UIColor.gray }
    static var ypRed: UIColor { UIColor(named: "ypRed") ?? UIColor.red }
    static var ypBlack: UIColor { UIColor(named: "ypBlack") ?? UIColor.black }
    static var ypBlue: UIColor { UIColor(named: "ypBlue") ?? UIColor.blue }
    static var color1: UIColor { UIColor(named: "Color1") ?? UIColor.red }
    static var color2: UIColor { UIColor(named: "Color2") ?? UIColor.red }
    static var color3: UIColor { UIColor(named: "Color3") ?? UIColor.red }
    static var color4: UIColor { UIColor(named: "Color4") ?? UIColor.red }
    static var color5: UIColor { UIColor(named: "Color5") ?? UIColor.red }
    static var color6: UIColor { UIColor(named: "Color6") ?? UIColor.red }
    static var color7: UIColor { UIColor(named: "Color7") ?? UIColor.red }
    static var color8: UIColor { UIColor(named: "Color8") ?? UIColor.red }
    static var color9: UIColor { UIColor(named: "Color9") ?? UIColor.red }
    static var color10: UIColor { UIColor(named: "Color10") ?? UIColor.red }
    static var color11: UIColor { UIColor(named: "Color11") ?? UIColor.red }
    static var color12: UIColor { UIColor(named: "Color12") ?? UIColor.red }
    static var color13: UIColor { UIColor(named: "Color13") ?? UIColor.red }
    static var color14: UIColor { UIColor(named: "Color14") ?? UIColor.red }
    static var color15: UIColor { UIColor(named: "Color15") ?? UIColor.red }
    static var color16: UIColor { UIColor(named: "Color16") ?? UIColor.red }
    static var color17: UIColor { UIColor(named: "Color17") ?? UIColor.red }
    static var color18: UIColor { UIColor(named: "Color18") ?? UIColor.red }
    static var switchColor: UIColor { ypBlue }
<<<<<<< HEAD
=======
    static let ypWhite = UIColor(named: "ypWhite") ?? UIColor.white
    static let gradientColor1 = UIColor(named: "gradientColor1") ?? UIColor.red
    static let gradientColor2 = UIColor(named: "gradientColor2") ?? UIColor.green
    static let gradientColor3 = UIColor(named: "gradientColor3") ?? UIColor.blue
    static let datePickerColor = UIColor(named: "datePickerColor") ?? UIColor.gray
    static let datePickerTintColor = UIColor(named: "datePickerTintColor") ?? UIColor.black
    static let searchTextFieldColor = UIColor(named: "searchTextFieldColor") ?? UIColor.gray
    
>>>>>>> sprint_17
    
    var hexString: String {
        let components = self.cgColor.components
        let r: CGFloat = components?[0] ?? 0.0
        let g: CGFloat = components?[1] ?? 0.0
        let b: CGFloat = components?[2] ?? 0.0
        return String.init(
            format: "%02lX%02lX%02lX",
            lroundf(Float(r * 255)),
            lroundf(Float(g * 255)),
            lroundf(Float(b * 255))
        )
    }
}
