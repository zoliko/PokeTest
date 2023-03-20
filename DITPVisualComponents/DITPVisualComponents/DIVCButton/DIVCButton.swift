//
//  DIVCButton.swift
//  DITPVisualComponents
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit

@IBDesignable public class DIVCButton: UIButton{

//    public var textButton: String? {
//        didSet{
//            self.textButton = placeHolderTextField
//        }
//    }

//    internal var padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8) {
//        didSet { loadStyle() }
//    }

    internal var modelConfiguration: DIVCTButtonConfigurationModel =  DIVCTButtonConfigurationModel() {
        didSet { loadStyle() }
    }

    @IBInspectable public var style: Int = 0 {
        didSet {
            modelConfiguration.setNewStyle(style: DIVCButtonStyles.init(rawValue: style) ?? .basic)
        }
    }

    internal func loadStyle() {
        self.layer.cornerRadius = self.layer.frame.height / 2
        self.backgroundColor = modelConfiguration.backgroundButton?.color
        self.layer.borderWidth =  2.0
        self.layer.borderColor = modelConfiguration.backgroundBorderButton?.color.cgColor
        self.tintColor = modelConfiguration.colorTextButton?.color
    }
}
