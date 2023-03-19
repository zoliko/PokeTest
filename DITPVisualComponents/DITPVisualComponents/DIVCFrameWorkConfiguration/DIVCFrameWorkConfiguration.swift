//
//  DIVCFrameWorkConfiguration.swift
//  DITPVisualComponents
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import Foundation
public class DITPVisualComponentsBundleManager {
    public class func bundle() -> Bundle? {
         return Bundle(for: DITPVisualComponentsBundleManager.self)
    }
}
