//
//  CarouselDetailsProductCollectionViewCell.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 25/07/22.
//

import UIKit

class CarouselDetailsProductCollectionViewCell: UICollectionViewCell {
    // MARK: - Constants
    static let resuseIdentifier: String = "CarouselDetailsProductCollectionViewCell"
    
    // MARK: - Components
    fileprivate let viewBase: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let imageViewItem: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupVC()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    fileprivate func setupVC() {        
        buildHierarchy()
        buildConstraints()
    }
    
    // MARK: - Methods
    func settingCell(_ item: String) {
        self.imageViewItem.image = UIImage(named: item)
    }
    
    fileprivate func buildHierarchy() {
        self.addSubview(viewBase)
        viewBase.addSubview(imageViewItem)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            viewBase.topAnchor.constraint(equalTo: self.topAnchor),
            viewBase.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewBase.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewBase.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            imageViewItem.centerXAnchor.constraint(equalTo: viewBase.centerXAnchor),
            imageViewItem.centerYAnchor.constraint(equalTo: viewBase.centerYAnchor),
            imageViewItem.widthAnchor.constraint(equalToConstant: 250),
            imageViewItem.heightAnchor.constraint(equalToConstant: 250),
        ])
    }
}
