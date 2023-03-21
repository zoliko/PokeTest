//
//  MainViewViewControllerExtension.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import Foundation
import DITPVisualComponents

extension MainViewController: MainViewViewProtocol {
    
    func showListPokemon(listPokemon: pokemonInitialListResponse) {
        let pokemonModel = getDataToCarouselPokemon(listPokemon: listPokemon)
        pokemonList = pokemonModel
        pokemonCarousel.configureCarousel(datInfo: pokemonModel)
        reloadPokemonData(inRow: 0)
    }
    
    func getDataToCarouselPokemon(listPokemon: pokemonInitialListResponse) -> DIVCCarouselPokemonModel {
        let elements = listPokemon.results.map({
            let object = DIVCCarouselPokemonCellModel(name: $0.name, url: $0.url)
            return object
        })
        let model = DIVCCarouselPokemonModel(results: elements)
        return model
    }
    
    func loggout() {
        self.dismiss(animated: true)
    }
    
    func showPokemonDescription(description: pokemonDescriptionResponse) {
        let descriptinfound = description.flavorTextEntries.first(where: { $0.language.name == "es" })?.flavorText.replacingOccurrences(of: "\n", with: " ")
        pokemonDescription.text = descriptinfound
    }
    
    func showPokemonMoves(pokemonMoves moves: pokemonMovesResponse) {
        let movesListString = moves.moves.map({
            $0.move.name.replacingOccurrences(of: "-", with: " ")
        })
        print(movesListString)

    }
    
    
}

extension MainViewController: DIVCCarouselPokemonDelegate  {
    
    func DIVCCarouselPokemon(_ carouselPokemon: DITPVisualComponents.DIVCCarouselPokemon, currentItem row: Int) {
        reloadPokemonData(inRow: row)
    }
    
    
}
