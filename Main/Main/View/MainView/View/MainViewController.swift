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
    @IBOutlet weak var decoreImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        pokemonCarousel.delegate = self
        presenter?.loadListPokemon()
        
    }
    
    func setUpView() {
        view.addGradientEfect(fistColor: .primaryBlue, secondColor: .secondaryBlue)
        decoreImage.image = UIImage(named: "DIVCShadowball", in: DITPVisualComponentsBundleManager.bundle(), compatibleWith: nil)?.withTintColor(.primaryWhite.withAlphaComponent(0.05), renderingMode: .alwaysOriginal)
    }
    func reloadPokemonData(inRow row: Int ) {
        guard let element = pokemonList?.results[row] else { return  }
        nameButtom.setTitle(element.name, for: .normal)
    }
    @IBAction func loggoutAction(_ sender: UIButton) {
        presenter?.loggout()
    }
}

