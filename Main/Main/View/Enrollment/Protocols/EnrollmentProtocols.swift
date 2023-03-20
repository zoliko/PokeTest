//
//  EnrollmentProtocols.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit
import CoreData

// MARK: -  Protocol to interaction View ---> Presenter
public protocol EnrollmentPresenterProtocol: AnyObject {
    
    var interactor: EnrollmentInteractorInputProtocol?{get set}
    var view:  EnrollmentViewProtocol?{get set}
    var route: EnrollmentRouterProtocol?{get set}
    
    func loggIn(context: NSManagedObjectContext)
    func registerUser(withEmail email: String, withPassword password: String, context: NSManagedObjectContext)
}
// MARK: -  Protocol to interaction Presenter ---> Interactor
public protocol EnrollmentInteractorInputProtocol: AnyObject {
    var presenter:  EnrollmentInteractorOutputProtocol? {get set}
    
    func requestloggIn(context: NSManagedObjectContext)
    func requestRegisterUser(withEmail email: String, withPassword password: String, context: NSManagedObjectContext)
}
// MARK: -  Protocol to interaction Interactor ---> Presenter
public protocol EnrollmentInteractorOutputProtocol: AnyObject {
    func resiveResponseMessage(title: String, message: String?)
    func responseloggIn()
    func responseRegisterUser(dataUser: FirebaseUserData)
}
// MARK: -  Protocol to interaction Presenter ---> View
public protocol EnrollmentViewProtocol: AnyObject {
    func showMessage(title: String, message: String?)
}
// MARK: -  Protocol to Routing
public protocol EnrollmentRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func goToMainView(view: EnrollmentViewProtocol?)
}
