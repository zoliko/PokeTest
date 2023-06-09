//
//  DIVCCarouselChipsCell.swift
//  DITPVisualComponents
//
//  Created by Marcelo Aguilar Bravo on 21/03/23.
//
 import UIKit

struct DIVCCarouselChipsCellConfiguration {
   let itemBackgroundColor: UIColor
   let itemBorderBackgroundColor: UIColor
   let itemBorder: Double
   let titleText: String
   let titleTextColor: UIColor

    init(itemBackgroundColor: UIColor = .clear,
          itemBorderBackgroundColor: UIColor = .clear,
          itemBorder: Double = 10.0,
          titleText: String = "") {
        self.itemBackgroundColor = itemBackgroundColor
        self.itemBorderBackgroundColor = itemBorderBackgroundColor
        self.itemBorder = itemBorder
        self.titleText = titleText
        if itemBackgroundColor == UIColor.primaryWhite {
            titleTextColor = .gray
        } else {
            titleTextColor = itemBackgroundColor
        }
    }
}

class DIVCCarouselChipsCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: DIVCCarouselChipsCell.self)
    private var itemBackgroundColor: UIColor? = .clear
    private var itemBorderBackgroundColor: UIColor? = .clear
    private var itemBorder: Double?
    private var titleText: String?
    public lazy var title: UILabel = {
        let frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        let title = UILabel(frame: frame)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "titleText"
        title.numberOfLines = 0
        title.adjustsFontSizeToFitWidth = true
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayer()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayer() {
        title.text = titleText
        self.backgroundColor = itemBackgroundColor?.withAlphaComponent(0.1)
        self.layer.borderWidth = 1.0
        self.layer.borderColor = itemBorderBackgroundColor?.cgColor
        self.layer.cornerRadius = itemBorder ?? 10.0
    }
    
    private func setupUI() {
        self.addSubview(title)
        title.sizeToFit()
        NSLayoutConstraint.activate([title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     title.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    public func setUpView(with model: DIVCCarouselChipsCellConfiguration) {
        self.itemBackgroundColor = model.itemBackgroundColor
        self.itemBorderBackgroundColor = model.itemBorderBackgroundColor
        self.itemBorder = model.itemBorder
        self.titleText = model.titleText
        title.textColor = model.titleTextColor
        setupLayer()
        setupUI()
    }
}
