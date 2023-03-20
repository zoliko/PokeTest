//
//  ViewController.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit
import DITPVisualComponents
import DITPEnrollment
import DITPExternalConnection

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        vericateLoggin()
    }
    
    func setUpView() {
        view.addGradientEfect(fistColor: .primaryBlue, secondColor: .secondaryBlue)
    }
    
    func vericateLoggin() {
        if !DIELoginManager.isLoggin() {
            self.present(EnrollmentRouter.createModule(), animated: true)
        } else {
            self.present(MainViewRouter.createModule(), animated: true)
        }
    }
}
