//
//  ViewController.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit
import DITPVisualComponents

class ViewController: UIViewController {

    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var adorno: UIImageView!
    @IBOutlet weak var adorno2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        adorno.image = UIImage(named: "DIVCShadowballrotate", in: DITPVisualComponentsBundleManager.bundle(), compatibleWith: nil)
        image.image = UIImage(named: "DIVCLogo", in: DITPVisualComponentsBundleManager.bundle(), compatibleWith: nil)
        view.addGradientEfect(fistColor: .primaryBlue, secondColor: .secondaryBlue)
        adorno2.image = UIImage(named: "DIVCShadowball", in: DITPVisualComponentsBundleManager.bundle(), compatibleWith: nil)?.withTintColor(.primaryWhite.withAlphaComponent(0.05), renderingMode: .alwaysOriginal)
    }


}

