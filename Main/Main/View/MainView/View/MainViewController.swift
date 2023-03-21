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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        presenter?.loadListPokemon()
    }
    
    func setUpView() {
        view.addGradientEfect(fistColor: .primaryBlue, secondColor: .secondaryBlue)
    }
}

