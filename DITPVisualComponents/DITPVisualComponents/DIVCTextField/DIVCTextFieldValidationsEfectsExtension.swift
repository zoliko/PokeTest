//
//  DIVCTextFieldValidationsEfectsExtension.swift
//  DITPVisualComponents
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import UIKit

public extension DIVCTextField {
    
    func changeColorBorderByValidation(validationCase: DIVCValidationCase) {
        switch validationCase {
        case .success:
            self.layer.borderColor = UIColor.primarySuccess.cgColor
        case .error:
            self.layer.borderColor = UIColor.primaryError.cgColor
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.loadStyle()
            self?.placeholder = self?.placeHolderTextField
        }
    }
}
