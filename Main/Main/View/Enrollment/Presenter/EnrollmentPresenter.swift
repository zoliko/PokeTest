//
//  EnrollmentPresenter.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import Foundation

public class EnrollmentPresenter: EnrollmentPresenterProtocol {
    
    public var interactor: EnrollmentInteractorInputProtocol?
    weak public var view: EnrollmentViewProtocol?
    public var route: EnrollmentRouterProtocol?
    
  
    public func loggIn() {
        interactor?.requestloggIn()
    }
    
    public func registerUser(withEmail email: String, withPassword password: String) {
        interactor?.requestRegisterUser(withEmail: email, withPassword: password)
    }
    
}
extension EnrollmentPresenter: EnrollmentInteractorOutputProtocol {
    
    public func resiveResponseMessage(message: String?) {
        view?.showMessage(message: message)
    }
    
    public func responseloggIn() {
        route?.goToMainView(view: view)
    }
    
    public func responseRegisterUser(dataUser: FirebaseUserData) {
        print(dataUser)
    }
    
    
    
}
