//
//  DIVCTextFieldConfigurationModel.swift
//  DITPVisualComponents
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import Foundation

public struct DIVCTextFieldConfigurationModel {
    
    var styleTextField: DIVCTextFieldStyles
    var backgroundextField: DIVCPalletColor?
    
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
            self.backgroundextField = DIVCPalletColor.primaryYellow
        case .success:
            self.backgroundextField = DIVCPalletColor.primaryBlue
        }
    }
}
