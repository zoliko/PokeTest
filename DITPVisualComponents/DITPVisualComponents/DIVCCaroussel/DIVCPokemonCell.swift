//
//  DIVCPokemonCell.swift
//  DITPVisualComponents
//
//  Created by Marcelo Aguilar Bravo on 20/03/23.
//

import UIKit


fileprivate let PADDING_SCREEN_PIXEL: CGFloat = 16

class DIVCPokemonCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: DIVCPokemonCell.self)
    
    public lazy var pokemonTitle: UILabel = {
        let pokemonTitle = UILabel(frame: .zero)
        pokemonTitle.translatesAutoresizingMaskIntoConstraints = false
        pokemonTitle.text = "movieTitle"
        pokemonTitle.numberOfLines = 0
        pokemonTitle.adjustsFontSizeToFitWidth = true
        pokemonTitle.sizeToFit()
        pokemonTitle.textColor = UIColor.primaryWhite
        pokemonTitle.textAlignment = .left
        return pokemonTitle
    }()
    private lazy var pokemonImage: UIImageView = {
        let pokemonImage = UIImageView(frame: contentView.bounds)
        pokemonImage.layer.cornerRadius = 13.5
        //pokemonImage.rounderCorners()
        return pokemonImage
    }()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    func setupUI() {
        contentView.addSubview(pokemonImage)
        contentView.addSubview(pokemonTitle)
        NSLayoutConstraint.activate([ pokemonTitle.centerXAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerXAnchor),
                                      pokemonTitle.centerYAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerYAnchor)])
    }
    func configuration(dataInfo: [String : Any] ) {
        pokemonImage.loadExternalImage(from: "")
        pokemonTitle.text = "dataInfo.getMovieTitleString()"
    }
}
