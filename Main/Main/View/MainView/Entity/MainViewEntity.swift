//
//  MainViewEntity.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import Foundation
import DITPExternalConnection

//MARK: - pokemonInitialListResponse

public struct pokemonInitialListResponse: ModelsResponseUtils {
    let results: [pokemonInitialInfo]
}
public struct pokemonInitialInfo: ModelsResponseUtils {
    
    let name: String
    let url: String

}
//MARK: - pokemonDescriptionResponse

public struct pokemonDescriptionResponse: ModelsResponseUtils {
    let flavorTextEntries: [pokemonDescriptionflavorText]
}
public struct pokemonDescriptionflavorText: ModelsResponseUtils {
    let flavorText: String
    let language: pokemonDescriptionlanguage
}
public struct pokemonDescriptionlanguage: ModelsResponseUtils {
    let name: String
}

//MARK: - pokemonMovesResponse

public struct pokemonMovesResponse: ModelsResponseUtils {
    let moves: [pokemonMovesData]
}
public struct pokemonMovesData: ModelsResponseUtils {
    let move: pokemonMoves
}
public struct pokemonMoves: ModelsResponseUtils {
    let name: String
}
