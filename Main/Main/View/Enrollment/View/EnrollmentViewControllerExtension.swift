//
//  EnrollmentViewControllerExtension.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import Foundation

extension EnrollmentViewController: EnrollmentViewProtocol {
    func showMessage(title: String, message: String?) {
        showAlertMessage(title: title, message: message ?? "")
    }
    
   
}
