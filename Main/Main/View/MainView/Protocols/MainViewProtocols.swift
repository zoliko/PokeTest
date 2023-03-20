//
//  MainViewProtocols.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit

// MARK: -  Protocol to interaction View ---> Presenter
public protocol MainViewPresenterProtocol: AnyObject {
    
    var interactor: MainViewInteractorInputProtocol?{get set}
    var view:  MainViewViewProtocol?{get set}
    var route: MainViewRouterProtocol?{get set}
    
}
// MARK: -  Protocol to interaction Presenter ---> Interactor
public protocol MainViewInteractorInputProtocol: AnyObject {
    var presenter:  MainViewInteractorOutputProtocol? {get set}
}
// MARK: -  Protocol to interaction Interactor ---> Presenter
public protocol MainViewInteractorOutputProtocol: AnyObject {
}
// MARK: -  Protocol to interaction Presenter ---> View
public protocol MainViewViewProtocol: AnyObject {
}
// MARK: -  Protocol to Routing
public protocol MainViewRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}
