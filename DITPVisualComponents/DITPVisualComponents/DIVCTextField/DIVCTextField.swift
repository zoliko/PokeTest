//
//  DIVCTextField.swift
//  DITPVisualComponents
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit

@IBDesignable public class DIVCTextField: UITextField {
    
    internal var modelConfiguration: DIVCTextFieldConfigurationModel =  DIVCTextFieldConfigurationModel() {
        didSet { loadStyle() }
    }
    
    @IBInspectable public var style: Int = 0 {
        didSet {
            modelConfiguration.setNewStyle(style: DIVCTextFieldStyles.init(rawValue: style) ?? .basic)
        }
    }
    
    internal func loadStyle() {
        self.backgroundColor = modelConfiguration.backgroundTextField?.color
    }
}
