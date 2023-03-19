//
//  DIVCPalletColor.swift
//  DITPVisualComponents
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit

//MARK: - DIVCPalletColor
public enum DIVCPalletColor {
    
    case primaryBlue
    case secondaryBlue
    case primaryYellow
    
    public var color: UIColor {
        switch self {
        case .primaryBlue:
            return UIColor.primaryBlue
        case .secondaryBlue:
            return UIColor.secondaryBlue
        case .primaryYellow:
            return UIColor.primaryYellow
        }
    }
}
