//
//  EnrollmentProtocols.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit

// MARK: -  Protocol to interaction View ---> Presenter
public protocol EnrollmentPresenterProtocol: AnyObject {
    
    var interactor: EnrollmentInteractorInputProtocol?{get set}
    var view:  EnrollmentViewProtocol?{get set}
    var route: EnrollmentRouterProtocol?{get set}
    
    func viperDidLoad()
    func loggIn()
}
// MARK: -  Protocol to interaction Presenter ---> Interactor
public protocol EnrollmentInteractorInputProtocol: AnyObject {
    var presenter:  EnrollmentInteractorOutputProtocol? {get set}
    
    func sendRequestMessage()
    func requestloggIn()
}
// MARK: -  Protocol to interaction Interactor ---> Presenter
public protocol EnrollmentInteractorOutputProtocol: AnyObject {
    func resiveResponseMessage()
    func responseloggIn()
}
// MARK: -  Protocol to interaction Presenter ---> View
public protocol EnrollmentViewProtocol: AnyObject {
    func showMessage(message: String)
}
// MARK: -  Protocol to Routing
public protocol EnrollmentRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func goToMainView(view: EnrollmentViewProtocol?)
}
