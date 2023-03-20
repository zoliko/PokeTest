//
//  MainViewInteractorExtension.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 20/03/23.
//

import Foundation
import DITPExternalConnection

internal extension MainViewInteractor {
    
    func getDataFrom(endPoint: String) {
        DIECServiceCoordinator.getService(endPoint: endPoint, structureType: pokemonInitialListResponse.self, handler: { [weak self] data, service, error in
            guard let listPokemon = data  as? pokemonInitialListResponse
            else {
                return
            }
            DIECInternalStoreHelper.saveObject(withKey: "keyInternalStore/\(endPoint)", object: listPokemon)
            self?.presenter?.responseListPokemon(listPokemon: listPokemon)
        })
    }
}
