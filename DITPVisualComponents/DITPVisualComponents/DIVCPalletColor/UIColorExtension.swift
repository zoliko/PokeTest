//
//  UIColorExtension.swift
//  DITPVisualComponents
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit

public extension UIColor {
    
    private static func createColorFrom(hexadecimalString hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    //MARK: - Basic Pallet Colors
    
    public static var primaryBlue: UIColor { return createColorFrom(hexadecimalString: "#5C98DB") }
    public static var secondaryBlue: UIColor { return createColorFrom(hexadecimalString: "#0E437E") }
    
    public static var primaryYellow: UIColor { return createColorFrom(hexadecimalString: "#F9C623") }
    
    //MARK: - Font Colors
}
