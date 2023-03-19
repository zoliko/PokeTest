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
    
    
}
extension EnrollmentPresenter: EnrollmentInteractorOutputProtocol { 
    
}
