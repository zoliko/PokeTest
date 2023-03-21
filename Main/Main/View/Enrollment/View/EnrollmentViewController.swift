//
//  EnrollmentViewController.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit
import DITPVisualComponents
import DITPFunctionalities
import CoreData

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
        registerNotifications()
    }
    
    func setUpView() {
        view.addGradientEfect(fistColor: .primaryBlue, secondColor: .secondaryBlue)
        pokeballRotate.image = UIImage(named: "DIVCShadowballrotate", in: DITPVisualComponentsBundleManager.bundle(), compatibleWith: nil)
        logo.image = UIImage(named: "DIVCLogo", in: DITPVisualComponentsBundleManager.bundle(), compatibleWith: nil)
        pokeball.image = UIImage(named: "DIVCShadowball", in: DITPVisualComponentsBundleManager.bundle(), compatibleWith: nil)?.withTintColor(.primaryWhite.withAlphaComponent(0.05), renderingMode: .alwaysOriginal)
        
        inputUser.placeHolderTextField = "Usuario"
        inputPass.placeHolderTextField = "Contraseña"
    }
    @IBAction func buttonAccionRegister(_ sender: UIButton) {
        validateInput(completion: { [weak self] context, email, password in
            self?.presenter?.registerUser(withEmail: email, withPassword: password, context: context)
        })
    }
    @IBAction func buttonAccionLoggin(_ sender: UIButton) {
        validateInput(completion: { [weak self] context, email, password in
            self?.presenter?.loggIn(withEmail: email, withPassword: password, context: context)
        })
    }
    
    func validateInput(completion: ((_ context: NSManagedObjectContext,_ user: String, _ password: String) -> Void)? ) {
        if inputUser.isValidEmail() && !inputPass.isEmpy() {
            guard let email = inputUser.text,
                  let password = inputPass.text,
                  let context = self.getCoreDataContext()
            else {
                return
            }
            inputUser.changeColorBorderByValidation(validationCase: .success)
            inputPass.changeColorBorderByValidation(validationCase: .success)
            completion?(context, email, password)
            
        }
        else {
            inputUser.changeColorBorderByValidation(validationCase: .error)
            inputPass.changeColorBorderByValidation(validationCase: .error)
        }
        inputUser.text = ""
        inputPass.text = ""
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
}
