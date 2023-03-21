//
//  DIVCCarouselPokemonExtension.swift
//  DITPVisualComponents
//
//  Created by Marcelo Aguilar Bravo on 20/03/23.
//

import UIKit
import DITPFunctionalities
extension DIVCCarouselPokemon: UICollectionViewDelegate {
    
}

extension DIVCCarouselPokemon: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  elements.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = indexPath.row
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: DIVCPokemonCell.reuseIdentifier), for: indexPath) as? DIVCPokemonCell
        else {
            return UICollectionViewCell()
        }
        let element = elements[row]
        cell.configuration(dataInfo: element)
        return cell
    }
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var indexRow = 0
        var pos = (CGFloat(elements.count) * (scrollView.contentOffset.x)) / (scrollView.contentSize.width - 30)
        pos.round()
        if pos <= CGFloat(elements.count ) && pos >= 0{ indexRow = Int(pos)  } else { indexRow = 0 }
        if actualItem != indexRow {
            actualItem = indexRow
        }
        
    }
}

extension DIVCCarouselPokemon: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(200).densityPixel, height: CGFloat(200).densityPixel)
    }
    
}
