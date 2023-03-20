//
//  DIERegisterManager.swift
//  DITPEnrollment
//
//  Created by Marcelo Aguilar Bravo on 20/03/23.
//

import Foundation
import FirebaseAuth

public class DIERegisterManager {
    public static func registerUser(withEmail email: String, withPassword password: String, handler: ((_ data: Any?, _ error: Any?) -> Void)? ) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            handler?(authResult, error)
        }
    }
}
