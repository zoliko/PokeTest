//
//  DIVCCarouselPokemon.swift
//  DITPVisualComponents
//
//  Created by Marcelo Aguilar Bravo on 20/03/23.
//

import UIKit

public class DIVCCarouselPokemon: UIView {
   
    private(set) lazy var elements: [DIVCCarouselPokemonCellModel] = {
        return []
    }()
    
    public lazy var carousel: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 48
        layout.minimumInteritemSpacing = 48
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let carousel = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        carousel.backgroundColor = UIColor.black
        carousel.translatesAutoresizingMaskIntoConstraints = false
        //carousel.delegate = self
        //carousel.dataSource = self
        carousel.showsHorizontalScrollIndicator = false
        carousel.showsVerticalScrollIndicator = false
        carousel.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        carousel.register(DIVCPokemonCell.self, forCellWithReuseIdentifier: DIVCPokemonCell.reuseIdentifier)
        return carousel
    }()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    public func commonInit() {
        setupUI()
    }
    private func setupUI() {
        addSubview(carousel)
        NSLayoutConstraint.activate([heightAnchor.constraint(equalToConstant: self.layer.frame.height ),
                                     widthAnchor.constraint(equalToConstant: self.layer.frame.width),
                                     carousel.topAnchor.constraint(equalTo: self.topAnchor),
                                     carousel.leftAnchor.constraint(equalTo: self.leftAnchor),
                                     carousel.rightAnchor.constraint(equalTo: self.rightAnchor),
                                     carousel.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
        let contentOffset = carousel.contentOffset
        carousel.setContentOffset(contentOffset, animated: false)
    }
    private func clearCarouselData()  {
        self.elements = []
        carousel.reloadData()
    }
    public func configureCarousel(datInfo: DIVCCarouselPokemonModel) {
        self.elements = datInfo.results
        //carousel.reloadData()
    }
}
