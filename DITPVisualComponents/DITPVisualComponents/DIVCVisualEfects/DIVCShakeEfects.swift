//
//  DIVCShakeEfects.swift
//  DITPVisualComponents
//
//  Created by Marcelo Aguilar Bravo on 20/03/23.
//

import UIKit

public extension UIView {
    
    func showShakeAnimation(duration: CFTimeInterval,_ completion: (() -> Void)? = nil) {
        CATransaction.begin()
        CATransaction.setCompletionBlock({
            completion?()
        })
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction.init(name: .linear)
        animation.duration = duration
        animation.values = [-14.0, 14.0, -14.0, 14.0, -8.0, 8.0, -4.0, 4.0, 0.0 ]
        self.layer.add(animation, forKey: "shake")
        CATransaction.commit()
    }
}
