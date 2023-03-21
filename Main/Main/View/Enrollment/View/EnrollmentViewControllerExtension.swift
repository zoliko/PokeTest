//
//  EnrollmentViewControllerExtension.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import Foundation
import UIKit

extension EnrollmentViewController: EnrollmentViewProtocol {
    func showMessage(title: String, message: String?) {
        showAlertMessage(title: title, message: message ?? "")
    }
    
    
}
//MARK: - Keyboard Efects
extension EnrollmentViewController: UITextFieldDelegate {
    
    public func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc public func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        inputUser.resignFirstResponder()
        inputPass.resignFirstResponder()
    }
    
    @objc func keyboardWillChange(notification: Notification) {
        guard let temp  = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        else { return }
        let keyboardSize = temp.height
        switch notification.name.rawValue {
        case "UIKeyboardWillShowNotification":
            if(inputUser.isFirstResponder || inputPass.isFirstResponder) {
                view.frame.origin.y = (-1.0 * (keyboardSize * 0.6))
            }
        case "UIKeyboardWillHideNotification":view.frame.origin.y = 0
        default:view.frame.origin.y = 0
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case inputUser:
            inputPass.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
}
