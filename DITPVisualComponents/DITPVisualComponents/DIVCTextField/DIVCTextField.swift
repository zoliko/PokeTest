//
//  DIVCTextField.swift
//  DITPVisualComponents
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit

@IBDesignable public class DIVCTextField: UITextField {
    
    public var styleTextField: DIVCTextFieldStyles = DIVCTextFieldStyles.none {
        didSet { loadStyle() }
    }
    @IBInspectable public var style: Int = 0 {
        didSet {
            styleTextField = DIVCTextFieldStyles(rawValue: style) ?? .none
        }
    }
    internal func loadStyle() {
        switch styleTextField {
        case .none:
            self.backgroundColor = UIColor.red
        }
    }
    
    
    
}
