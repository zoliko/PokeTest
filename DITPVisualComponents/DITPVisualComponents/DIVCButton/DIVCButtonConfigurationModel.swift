//
//  DIVCTButtonConfigurationModel.swift
//  DITPVisualComponents
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import Foundation

public struct DIVCTButtonConfigurationModel {
    
    var styleButton: DIVCButtonStyles
    var backgroundButton: DIVCPalletColor? = DIVCPalletColor.primaryYellow
    var backgroundBorderButton: DIVCPalletColor?
    
    var colorTextButton: DIVCPalletColor? = DIVCPalletColor.primaryWhite
    
    init(styleTextField: DIVCButtonStyles = .basic) {
        self.styleButton = styleTextField
        self.getConfiguration(style: styleTextField)
    }
    
    public mutating func setNewStyle(style: DIVCButtonStyles) {
        self.getConfiguration(style: style)
    }
    
    internal mutating func getConfiguration(style: DIVCButtonStyles) {
        switch style {
        case .basic:
            self.backgroundButton = DIVCPalletColor.primaryYellow
            self.backgroundBorderButton = DIVCPalletColor.primaryYellow
            self.colorTextButton = DIVCPalletColor.primaryWhite
        }
    }
}
