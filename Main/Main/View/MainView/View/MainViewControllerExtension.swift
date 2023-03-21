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
        pokemonCarousel.configureCarousel(datInfo: pokemonModel)
    }
    
    func getDataToCarouselPokemon(listPokemon: pokemonInitialListResponse) -> DIVCCarouselPokemonModel {
        let elements = listPokemon.results.map({
            let object = DIVCCarouselPokemonCellModel(name: $0.name, url: $0.url)
            return object
        })
        let model = DIVCCarouselPokemonModel(results: elements)
        return model
    }
}
    
