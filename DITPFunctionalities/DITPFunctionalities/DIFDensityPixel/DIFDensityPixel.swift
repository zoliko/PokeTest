//
//  DIFDensityPixel.swift
//  DITPFunctionalities
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit
public extension CGFloat {
    var densityPixel: CGFloat {
        return (self / 320 ) * UIScreen.main.bounds.width
    }
}
