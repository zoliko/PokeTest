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

    public func loadListPokemon() {
        interactor?.requestListPokemon()
    }
    public func loggout() {
        interactor?.requestLoggout()
    }
    
}
extension MainViewPresenter: MainViewInteractorOutputProtocol {
    public func responseListPokemon(listPokemon: pokemonInitialListResponse) {
        view?.showListPokemon(listPokemon: listPokemon)
    }
    
    public func responseLoggout() {
        view?.loggout()
    }
}
