//
//  DIVCCarouselChipsExtension.swift
//  DITPVisualComponents
//
//  Created by Marcelo Aguilar Bravo on 21/03/23.
//

import UIKit

fileprivate let PADDING_SCREEN_PIXEL: CGFloat = 16
fileprivate let FONT_PONTSIZE_PIXEL: Int = 8
fileprivate let ARRAY_HELPER_SIZE: Int = 1

extension DIVCCarouselChips: UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        optionSelected = indexPath.row
        delegate?.DIVCCarouselChips(self, selectedOption: indexPath)
    }
}
extension DIVCCarouselChips: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuOptions.count
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: DIVCCarouselChipsCell.reuseIdentifier), for: indexPath) as? DIVCCarouselChipsCell else {  return UICollectionViewCell() }
        
        let setupModel: DIVCCarouselChipsCellConfiguration
        if optionSelected ==  indexPath.row {
            setupModel = DIVCCarouselChipsCellConfiguration(itemBackgroundColor: itemBackgroundColor,
                                                         itemBorderBackgroundColor: itemBorderBackgroundColor,
                                                         titleText: "\(menuOptions[indexPath.row])")
        }
        else{
            setupModel = DIVCCarouselChipsCellConfiguration(itemBackgroundColor: itemSelectedBackgroundColor,
                           itemBorderBackgroundColor: itemSelectedBorderBackgroundColor,
                           titleText: "\(menuOptions[indexPath.row])")
        }
        cell.setUpView(with: setupModel)
        return cell
    }
}
extension DIVCCarouselChips: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let newWidth = CGFloat((menuOptions[indexPath.row].lengthOfBytes(using: .utf8) + ARRAY_HELPER_SIZE) * FONT_PONTSIZE_PIXEL) + PADDING_SCREEN_PIXEL
        return CGSize(width: newWidth, height: collectionView.frame.height)
    }
}

