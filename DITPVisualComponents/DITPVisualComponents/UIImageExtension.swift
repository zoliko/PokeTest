//
//  UIImageExtension.swift
//  DITPFunctionalities
//
//  Created by Marcelo Aguilar Bravo on 20/03/23.
//

import UIKit

public extension UIImageView {
    func loadExternalImage(from stringURL: String?, defaultImage: String = "DIVCShadowball") {
        guard let stringPoster = stringURL,
              let url = URL(string: stringPoster)
        else {
            DispatchQueue.main.async {
                self.image = UIImage(named: defaultImage)
            }
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            guard let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data)
            else {
                DispatchQueue.main.async {
                    self?.image = UIImage(named: defaultImage)
                }
                return
            }
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
    
    func rounderCorners(rounderValue: CGFloat = 13.5, backgroundColor: UIColor = UIColor.clear) {
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.frame
        rectShape.position = self.center
        rectShape.path = UIBezierPath(roundedRect: self.bounds,
                                      byRoundingCorners: [.topRight , .topLeft,.bottomLeft,.bottomRight],
                                      cornerRadii: CGSize(width: rounderValue, height: rounderValue)).cgPath
        self.layer.backgroundColor = backgroundColor.cgColor
        self.layer.mask = rectShape
    }
}

