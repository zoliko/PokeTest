//
//  MainViewPresenter.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import Foundation

public class MainViewPresenter: MainViewPresenterProtocol {
    
    public var interactor: MainViewInteractorInputProtocol?
    weak public var view: MainViewViewProtocol?
    public var route: MainViewRouterProtocol?

    
}
extension MainViewPresenter: MainViewInteractorOutputProtocol {
    

    
}
