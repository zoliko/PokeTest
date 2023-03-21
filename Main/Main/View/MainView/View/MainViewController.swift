//
//  MainViewViewController.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit
import DITPVisualComponents
import DITPFunctionalities

class MainViewController: UIViewController {

    var presenter: MainViewPresenterProtocol?
    
    @IBOutlet weak var pokemonCarousel: DIVCCarouselPokemon!
    @IBOutlet weak var nameButtom: DIVCButton!
    
    internal var pokemonList: DIVCCarouselPokemonModel? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        pokemonCarousel.delegate = self
        presenter?.loadListPokemon()
        
    }
    
    func setUpView() {
        view.addGradientEfect(fistColor: .primaryBlue, secondColor: .secondaryBlue)
    }
    func reloadPokemonData(inRow row: Int ) {
        guard let element = pokemonList?.results[row] else { return  }
        nameButtom.setTitle(element.name, for: .normal)
    }
}

