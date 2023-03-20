//
//  EnrollmentViewController.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit
import DITPVisualComponents
import DITPFunctionalities

class EnrollmentViewController: UIViewController {

    var presenter: EnrollmentPresenterProtocol?
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var pokeballRotate: UIImageView!
    @IBOutlet weak var pokeball: UIImageView!
    @IBOutlet weak var inputUser: DIVCTextField!
    @IBOutlet weak var inputPass: DIVCTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        view.addGradientEfect(fistColor: .primaryBlue, secondColor: .secondaryBlue)
        pokeballRotate.image = UIImage(named: "DIVCShadowballrotate", in: DITPVisualComponentsBundleManager.bundle(), compatibleWith: nil)
        logo.image = UIImage(named: "DIVCLogo", in: DITPVisualComponentsBundleManager.bundle(), compatibleWith: nil)
        pokeball.image = UIImage(named: "DIVCShadowball", in: DITPVisualComponentsBundleManager.bundle(), compatibleWith: nil)?.withTintColor(.primaryWhite.withAlphaComponent(0.05), renderingMode: .alwaysOriginal)
        
        inputUser.placeHolderTextField = "Usuario"
        inputPass.placeHolderTextField = "Contraseña"
        
        inputUser.text = "Waxelo77@gmail.com"
        inputPass.text = "23Sauco23"
    
    }

    @IBAction func buttonAccionRegister(_ sender: UIButton) {
        if inputUser.isValidEmail() && !inputPass.isEmpy() {
            guard let email = inputUser.text,
                  let password = inputPass.text,
                  let context = self.getCoreDataContext()
            else {
                return
            }
            
            presenter?.registerUser(withEmail: email, withPassword: password, context: context)
        } 
    }
    @IBAction func buttonAccionLoggin(_ sender: UIButton) {
        if inputUser.isEmpy() && inputPass.isEmpy() {
            //presenter?.loggIn()
        } else {
            //inputUser.changeColorBorderByValidation(validationCase: .error)
            //inputPass.changeColorBorderByValidation(validationCase: .error)
        }
    }
}
