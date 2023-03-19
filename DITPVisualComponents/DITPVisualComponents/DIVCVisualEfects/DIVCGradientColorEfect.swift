//
//  DIVCGradientColorEfect.swift
//  DITPVisualComponents
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit

public extension UIView {
    func addGradientEfect(fistColor: DIVCPalletColor,
                          fistAlpha: CGFloat = 1.0,
                          secondColor: DIVCPalletColor,
                          secondAlpha: CGFloat = 1.0) {
        
        let efectView = UIView(frame: self.bounds)
        efectView.tag = DIVCVisualEfectsTags.gradientEfect.rawValue
        let gradient = CAGradientLayer()
        gradient.frame = efectView.bounds
        gradient.colors = [fistColor.color.withAlphaComponent(fistAlpha).cgColor,
                           secondColor.color.withAlphaComponent(secondAlpha).cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        efectView.layer.insertSublayer(gradient, at: 0)
        self.addSubview(efectView)
        self.sendSubviewToBack(efectView)
    }
    func removeGradientEfect() {
        guard let efectView = self.viewWithTag(DIVCVisualEfectsTags.gradientEfect.rawValue) else { return }
        efectView.removeFromSuperview()
    }
}
