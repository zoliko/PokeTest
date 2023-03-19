//
//  ViewController.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit
import DITPVisualComponents

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryBlue
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.present(EnrollmentRouter.createModule(), animated: true)
        
    }
}

