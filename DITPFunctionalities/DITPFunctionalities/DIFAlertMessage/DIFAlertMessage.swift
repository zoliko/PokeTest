//
//  DIFAlertMessage.swift
//  DITPFunctionalities
//
//  Created by Marcelo Aguilar Bravo on 20/03/23.
//

import UIKit
public extension UIViewController {
    func showAlertMessage(title: String, message: String) {
        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let oKButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alertMessage.addAction(oKButton)
        self.present(alertMessage, animated:true, completion: nil)
    }
}
