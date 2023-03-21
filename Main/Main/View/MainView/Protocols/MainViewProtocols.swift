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
    
    func loadListPokemon()
    func loggout()
    
    func loadPokemonDescriptionWith(pokemonID : Int)
    func loadPokemonMovesWith(pokemonID : Int)
}
// MARK: -  Protocol to interaction Presenter ---> Interactor
public protocol MainViewInteractorInputProtocol: AnyObject {
    var presenter:  MainViewInteractorOutputProtocol? {get set}
    func requestListPokemon()
    func requestLoggout()
    
    func requestPokemonDescription(pokemonID : Int)
    func requestPokemonMoves(pokemonID : Int)
}
// MARK: -  Protocol to interaction Interactor ---> Presenter
public protocol MainViewInteractorOutputProtocol: AnyObject {
    func responseListPokemon(listPokemon: pokemonInitialListResponse)
    func responseLoggout()
    
    func responsePokemonDescription(pokemonDescription: pokemonDescriptionResponse)
    func responsePokemonMoves(pokemonMoves moves: pokemonMovesResponse)
}
// MARK: -  Protocol to interaction Presenter ---> View
public protocol MainViewViewProtocol: AnyObject {
    func showListPokemon(listPokemon: pokemonInitialListResponse)
    func showPokemonDescription(description: pokemonDescriptionResponse)
    func showPokemonMoves(pokemonMoves moves: pokemonMovesResponse)
    func loggout()
}
// MARK: -  Protocol to Routing
public protocol MainViewRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}
