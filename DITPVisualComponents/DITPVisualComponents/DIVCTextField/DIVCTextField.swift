//
//  DIVCTextField.swift
//  DITPVisualComponents
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit

@IBDesignable public class DIVCTextField: UITextField {
    
    public var placeHolderTextField: String? {
        didSet{
            self.placeholder = placeHolderTextField
        }
    }
    
    internal var padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8) {
        didSet { loadStyle() }
    }
    
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
        self.attributedPlaceholder = modelConfiguration.placeHolderConfiguration
        self.borderStyle = .none
        self.layer.borderWidth = modelConfiguration.borderTextField ?? 2.0
        self.layer.cornerRadius = self.layer.frame.height / 2
        self.layer.borderColor = modelConfiguration.backgroundBorderTextField?.color.cgColor
        self.textColor = modelConfiguration.colorTextField?.color
    }
}
