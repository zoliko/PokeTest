//
//  ViewController.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit
import DITPVisualComponents
import DITPEnrollment

class ViewController: UIViewController {
    
    
    @IBOutlet weak var logoBall: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logoBall.showShakeAnimation(duration: 0.75, { [weak self] in
                self?.vericateLoggin()
        })
    }
    func setUpView() {
        view.addGradientEfect(fistColor: .primaryBlue, secondColor: .secondaryBlue)
        logoBall.image = UIImage(named: "DIVCLogoPokeball", in: DITPVisualComponentsBundleManager.bundle(), compatibleWith: nil)
    }
    func vericateLoggin() {
        if !DIELoginManager.isLoggin() {
            self.present(EnrollmentRouter.createModule(), animated: true)
        } else {
            self.present(MainViewRouter.createModule(), animated: true)
        }
    }
}
