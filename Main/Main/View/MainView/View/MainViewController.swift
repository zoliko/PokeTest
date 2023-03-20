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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()

    }
    
    func setUpView() {
        print("MainView")
        view.backgroundColor = .primaryYellow
    }
}
