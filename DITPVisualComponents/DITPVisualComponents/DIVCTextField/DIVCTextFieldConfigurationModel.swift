//
//  DIVCTextFieldConfigurationModel.swift
//  DITPVisualComponents
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import Foundation

public struct DIVCTextFieldConfigurationModel {
    
    var styleTextField: DIVCTextFieldStyles
    var backgroundTextField: DIVCPalletColor? = DIVCPalletColor.primaryWhite
    var placeHolderConfiguration: NSAttributedString?
    var backgroundBorderTextField: DIVCPalletColor?
    var borderTextField: CGFloat?
    var colorTextField: DIVCPalletColor?
    
    init(styleTextField: DIVCTextFieldStyles = .basic) {
        self.styleTextField = styleTextField
        self.getConfiguration(style: styleTextField)
    }
    
    public mutating func setNewStyle(style: DIVCTextFieldStyles) {
        self.getConfiguration(style: style)
    }
    
    internal mutating func getConfiguration(style: DIVCTextFieldStyles) {
        switch style {
        case .basic:
            self.backgroundTextField = DIVCPalletColor.primaryWhite
        case .loggin:
            self.backgroundTextField = DIVCPalletColor.primaryWhite
            self.placeHolderConfiguration = NSAttributedString(string: "Placeholder Text",
                                                               attributes: [NSAttributedString.Key.foregroundColor: DIVCPalletColor.secondaryBlue.color])
            self.backgroundBorderTextField = DIVCPalletColor.primaryYellow
            self.borderTextField = 3.0
            self.colorTextField = DIVCPalletColor.secondaryBlue
        }
    }
}
