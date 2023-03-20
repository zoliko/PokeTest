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
    case primaryWhite
    case appClear
    case primarySuccess
    case primaryWarning
    case primaryError
    
    public var color: UIColor {
        switch self {
        case .primaryBlue:
            return UIColor.primaryBlue
        case .secondaryBlue:
            return UIColor.secondaryBlue
        case .primaryYellow:
            return UIColor.primaryYellow
        case .primaryWhite:
            return UIColor.primaryWhite
        case .appClear:
            return UIColor.appClear
        case .primarySuccess:
            return UIColor.primarySuccess
        case .primaryWarning:
            return UIColor.primaryWarning
        case .primaryError:
            return UIColor.primaryError
        }
    }
}
