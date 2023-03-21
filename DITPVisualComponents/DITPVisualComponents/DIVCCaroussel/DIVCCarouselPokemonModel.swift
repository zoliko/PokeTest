//
//  DIVCCarouselPokemonModel.swift
//  DITPVisualComponents
//
//  Created by Marcelo Aguilar Bravo on 20/03/23.
//

import Foundation
import DITPExternalConnection

public struct DIVCCarouselPokemonModel {
    let results: [DIVCCarouselPokemonCellModel]
    
    public init(results: [DIVCCarouselPokemonCellModel]) {
        self.results = results
    }
}
public struct DIVCCarouselPokemonCellModel {
    
    let name: String
    let url: String
    let pokemonID: String
    let imageUrl: String
    
    public init(name: String, url: String) {
        self.name = name
        self.url = url
        let splitUrl = url.split(separator: "/")
        self.pokemonID = String(splitUrl[(splitUrl.count - 1)])
        self.imageUrl = "\(DIECServiceCoordinator.getAPIResoucerURL())\(pokemonID).png"
        
        
    }
}
