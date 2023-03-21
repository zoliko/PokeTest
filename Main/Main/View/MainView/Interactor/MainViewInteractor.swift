//
//  MainViewInteractor.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import Foundation
import DITPEnrollment

public class MainViewInteractor: MainViewInteractorInputProtocol {

    public var presenter: MainViewInteractorOutputProtocol?
    public func requestListPokemon() {
        getDataFrom(endPoint: "pokemon/?offset=0&limit=1000")
    }
    public func requestLoggout() {
        DIELoginManager.loggOut()
        presenter?.responseLoggout()
    }
    public func requestPokemonDescription(pokemonID: Int) {
        getDescriptionFrom(endPoint: "pokemon-species/\(pokemonID)/")
    }

}
