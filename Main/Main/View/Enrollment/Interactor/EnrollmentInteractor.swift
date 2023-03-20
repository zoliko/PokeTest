//
//  EnrollmentInteractor.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import Foundation
import DITPEnrollment
import FirebaseAuth

public class EnrollmentInteractor: EnrollmentInteractorInputProtocol {
    
    
    
    public var presenter: EnrollmentInteractorOutputProtocol?
    
    
    public func requestloggIn() {
        DIELoginManager.loggIn()
        presenter?.responseloggIn()
    }
    
    public func requestRegisterUser(withEmail email: String, withPassword password: String) {
        
        DIERegisterManager.registerUser(withEmail: email, withPassword: password, handler: { [weak self] dataResponse, errorResponse in
            if dataResponse != nil {
                guard let dataResult = dataResponse as?  AuthDataResult
                else {
                    return
                }
                let userData = FirebaseUserData(userInfo: dataResult)
                self?.presenter?.responseRegisterUser(dataUser: userData)
            } else {
                guard let error = errorResponse as? NSError,
                let message = error.userInfo["NSLocalizedDescription"] as? String
                else {
                    return
                }
                self?.presenter?.resiveResponseMessage(message: message)
            }
            
        })
        
    }
    
    
}
