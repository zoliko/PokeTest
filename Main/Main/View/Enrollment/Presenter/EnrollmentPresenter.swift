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
    
    public func viperDidLoad() {
        interactor?.sendRequestMessage()
    }
    
}
extension EnrollmentPresenter: EnrollmentInteractorOutputProtocol {
    public func resiveResponseMessage() {
        view?.showMessage(message: "hola")
    }
    
    
}