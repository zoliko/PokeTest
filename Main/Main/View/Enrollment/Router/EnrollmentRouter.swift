//
//  EnrollmentRouter.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit
public class EnrollmentRouter: EnrollmentRouterProtocol {
    
    public static func createModule() -> UIViewController {
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "IDEnrollmentView") as? EnrollmentViewController
        else {
            return UIViewController()
        }
        view.modalPresentationStyle = .fullScreen
        let presenter: EnrollmentPresenterProtocol & EnrollmentInteractorOutputProtocol = EnrollmentPresenter()
        
        view.presenter = presenter
        view.presenter?.view = view
        view.presenter?.route = EnrollmentRouter()
        view.presenter?.interactor = EnrollmentInteractor()
        view.presenter?.interactor?.presenter = presenter
        
        return view
        
    }
}


