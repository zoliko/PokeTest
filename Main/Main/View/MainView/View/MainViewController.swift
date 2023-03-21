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
    @IBOutlet weak var pokemonDescription: UITextView!
    @IBOutlet weak var movesList: DIVCCarouselChips!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        pokemonCarousel.delegate = self
        presenter?.loadListPokemon()
    }
    
    func setUpView() {
        view.addGradientEfect(fistColor: .primaryBlue, secondColor: .secondaryBlue)
        movesList.backgroundColor = UIColor.clear
        decoreImage.image = UIImage(named: "DIVCShadowball", in: DITPVisualComponentsBundleManager.bundle(), compatibleWith: nil)?.withTintColor(.primaryWhite.withAlphaComponent(0.05), renderingMode: .alwaysOriginal)
        pokemonDescription.textColor = UIColor.primaryWhite
        pokemonDescription.layer.cornerRadius = pokemonDescription.frame.height / 8
        pokemonDescription.backgroundColor = UIColor.primaryWarning.withAlphaComponent(0.3)
        pokemonDescription.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    @IBAction func loggoutAction(_ sender: UIButton) {
        presenter?.loggout()
    }
    
    func reloadPokemonData(inRow row: Int ) {
        guard let element = pokemonList?.results[row] else { return  }
        nameButtom.setTitle(element.name, for: .normal)
        presenter?.loadPokemonDescriptionWith(pokemonID: (row + 1))
        presenter?.loadPokemonMovesWith(pokemonID: (row + 1))
    }
}

