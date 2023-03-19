//
//  EnrollmentViewController.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit
import DITPVisualComponents

class EnrollmentViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var pokeballRotate: UIImageView!
    @IBOutlet weak var pokeball: UIImageView!
    
    var presenter: EnrollmentPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        presenter?.viperDidLoad()
    }
    
    func setUpView() {
        view.addGradientEfect(fistColor: .primaryBlue, secondColor: .secondaryBlue)
        pokeballRotate.image = UIImage(named: "DIVCShadowballrotate", in: DITPVisualComponentsBundleManager.bundle(), compatibleWith: nil)
        logo.image = UIImage(named: "DIVCLogo", in: DITPVisualComponentsBundleManager.bundle(), compatibleWith: nil)
        pokeball.image = UIImage(named: "DIVCShadowball", in: DITPVisualComponentsBundleManager.bundle(), compatibleWith: nil)?.withTintColor(.primaryWhite.withAlphaComponent(0.05), renderingMode: .alwaysOriginal)
    }

}
