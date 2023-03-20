//
//  MainViewRouter.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit
public class MainViewRouter: MainViewRouterProtocol {
    
    public static func createModule() -> UIViewController {
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "IDMainView") as? MainViewController
        else {
            return UIViewController()
        }
        view.modalPresentationStyle = .fullScreen
        let presenter: MainViewPresenterProtocol & MainViewInteractorOutputProtocol = MainViewPresenter()
        view.presenter = presenter
        view.presenter?.view = view
        view.presenter?.route = MainViewRouter()
        view.presenter?.interactor = MainViewInteractor()
        view.presenter?.interactor?.presenter = presenter
        return view
    }
}


