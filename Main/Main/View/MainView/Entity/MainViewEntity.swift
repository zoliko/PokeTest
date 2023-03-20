//
//  MainViewEntity.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import Foundation
import DITPExternalConnection

public struct pokemonInitialListResponse: ModelsResponseUtils {
    let results: [pokemonInitialInfo]
}
public struct pokemonInitialInfo: ModelsResponseUtils {
    
    let name: String
    let url: String

}
