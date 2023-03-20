//
//  DIVCTextFieldValidationsExtension.swift
//  DITPVisualComponents
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit

public extension DIVCTextField {
    
    func isEmpy() -> Bool {
        return self.text == String()
    }
    
    func isValidEmail() -> Bool {
        if !self.isEmpy() {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: self.text)
        }
        return false
    }
    
    
}
