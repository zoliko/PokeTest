//
//  DIVCCarouselChips.swift
//  DITPVisualComponents
//
//  Created by Marcelo Aguilar Bravo on 21/03/23.
//

import UIKit
//MARK: - DIVCCarouselChipsConfiguration
public struct DIVCCarouselChipsConfiguration {
    let frame: CGRect
    let optionsTitles: [String]
    let itemBackgroundColor: UIColor
    let itemBorderBackgroundColor: UIColor
    let itemSelectedBackgroundColor: UIColor
    let itemSelectedBorderBackgroundColor: UIColor
    let itemBorder: Double
    
    public init(frame:CGRect,
         optionsTitles:[String] = [],
         itemBackgroundColor: UIColor = .clear,
         itemBorderBackgroundColor: UIColor = .clear,
         itemSelectedBackgroundColor: UIColor = .clear,
         itemSelectedBorderBackgroundColor: UIColor = .clear,
         itemBorder: Double = 10.0) {
        
        self.frame = frame
        self.optionsTitles = optionsTitles
        self.itemBackgroundColor = itemBackgroundColor
        self.itemBorderBackgroundColor = itemBorderBackgroundColor
        self.itemSelectedBackgroundColor = itemSelectedBackgroundColor
        self.itemSelectedBorderBackgroundColor = itemSelectedBorderBackgroundColor
        self.itemBorder = itemBorder
    }
}
//MARK: - DIVCCarouselChipsDelegate
public protocol DIVCCarouselChipsDelegate: AnyObject {
    func DIVCCarouselChips(_ carouselChips: DIVCCarouselChips,selectedOption index: IndexPath)
}

//MARK: - DIVCCarouselChips
public class DIVCCarouselChips: UIView {
    public weak var delegate: DIVCCarouselChipsDelegate?
    private(set) var itemBackgroundColor: UIColor = .clear
    private(set) var itemBorderBackgroundColor: UIColor = .clear
    private(set) var itemSelectedBackgroundColor: UIColor = .clear
    private(set) var itemSelectedBorderBackgroundColor: UIColor = .clear
    private(set) var itemBorder: Double = 10.0
    private(set) lazy var menuOptions: [String] = {
        return []
    }()
    public var optionSelected: Int = 0{
        didSet{
            menu.reloadData()
        }
    }
    public lazy var menu: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 32
        layout.minimumInteritemSpacing = 32
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let menu = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        menu.backgroundColor = UIColor.clear
        menu.translatesAutoresizingMaskIntoConstraints = false
        menu.delegate = self
        menu.dataSource = self
        menu.showsHorizontalScrollIndicator = false
        menu.showsVerticalScrollIndicator = false
        menu.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        menu.register(DIVCCarouselChipsCell.self,forCellWithReuseIdentifier: DIVCCarouselChipsCell.reuseIdentifier)
        return menu
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    public convenience init(with model: DIVCCarouselChipsConfiguration){
        self.init(frame: model.frame)
        self.configure(with: model)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        addSubview(menu)
        NSLayoutConstraint.activate([heightAnchor.constraint(equalToConstant: self.layer.frame.height ),
                                     widthAnchor.constraint(equalToConstant: self.layer.frame.width),
                                     menu.heightAnchor.constraint(equalToConstant: self.layer.frame.height ),
                                     menu.widthAnchor.constraint(equalToConstant: self.layer.frame.width),
                                     menu.topAnchor.constraint(equalTo: self.topAnchor),
                                     menu.leftAnchor.constraint(equalTo: self.leftAnchor),
                                     menu.rightAnchor.constraint(equalTo: self.rightAnchor),
                                     menu.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
        let contentOffset = menu.contentOffset
        menu.setContentOffset(contentOffset, animated: false)
    }
    
    public func setDataInfo(infoMenu: [String]) {
        menuOptions = infoMenu
        optionSelected = 0
        menu.scrollToItem(at: IndexPath(row: 0, section: 0), at: .bottom, animated: true)
        menu.reloadData()
    }
    
    public func configure(with model: DIVCCarouselChipsConfiguration) {
        self.itemBackgroundColor = model.itemBackgroundColor
        self.itemBorderBackgroundColor = model.itemBorderBackgroundColor
        self.itemSelectedBackgroundColor = model.itemSelectedBackgroundColor
        self.itemSelectedBorderBackgroundColor = model.itemSelectedBorderBackgroundColor
        self.itemBorder = model.itemBorder
        self.setDataInfo(infoMenu: model.optionsTitles)
    }
}
