//
//  EnrollmentPresenter.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import Foundation
import CoreData

public class EnrollmentPresenter: EnrollmentPresenterProtocol {
    
    public var interactor: EnrollmentInteractorInputProtocol?
    weak public var view: EnrollmentViewProtocol?
    public var route: EnrollmentRouterProtocol?
    
  
    public func loggIn(withEmail email: String, withPassword password: String, context: NSManagedObjectContext) {
        interactor?.requestloggIn(withEmail: email, withPassword: password, context: context)
    }
    
    public func registerUser(withEmail email: String, withPassword password: String, context: NSManagedObjectContext) {
        interactor?.requestRegisterUser(withEmail: email, withPassword: password, context: context)
    }
    
}
extension EnrollmentPresenter: EnrollmentInteractorOutputProtocol {
    
    public func resiveResponseMessage(title: String, message: String?) {
        view?.showMessage(title: title, message: message)
    }
    public func responseloggIn(dataUser: FirebaseUserData) {
        route?.goToMainView(view: view)
    }
    public func responseRegisterUser(dataUser: FirebaseUserData) {
        route?.goToMainView(view: view)
    }
}
