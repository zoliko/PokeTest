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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named: "DIVCLogo", in: DITPVisualComponentsBundleManager.bundle(), compatibleWith: nil)
        view.addGradientEfect(fistColor: .primaryBlue, secondColor: .secondaryBlue)
    }


}

