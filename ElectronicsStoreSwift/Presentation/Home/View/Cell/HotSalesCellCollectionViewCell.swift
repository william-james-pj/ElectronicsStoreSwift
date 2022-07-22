//
//  HotSalesCellCollectionViewCell.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 19/07/22.
//

import UIKit

class HotSalesCellCollectionViewCell: UICollectionViewCell {
    // MARK: - Constants
    static let resuseIdentifier: String = "HotSalesCellCollectionViewCell"
    
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let viewImageContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor(red: 0.88, green: 0.94, blue: 0.98, alpha: 1.00)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let imageViewItem: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "macbookProM1")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    fileprivate let stackContent: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let stackText: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let labelItemName: UILabel = {
        let label = UILabel()
        label.text = "Macbook Pro M1"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor(named: "Text")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let labelItemValue: UILabel = {
        let label = UILabel()
        label.text = "$160"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor(named: "Text")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let labelDescription: UILabel = {
        let label = UILabel()
        label.text = "The intuitive and intelligent Wi-1000XM4 headshones"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor(named: "Disabled")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    fileprivate func buildHierarchy() {
        self.addSubview(stackBase)
        stackBase.addArrangedSubview(viewImageContainer)
        viewImageContainer.addSubview(imageViewItem)
        
        stackBase.addArrangedSubview(stackContent)
        
        stackContent.addArrangedSubview(stackText)
        stackText.addArrangedSubview(labelItemName)
        stackText.addArrangedSubview(labelItemValue)
        stackContent.addArrangedSubview(labelDescription)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: self.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackBase.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackBase.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            viewImageContainer.heightAnchor.constraint(equalToConstant: 150),
            
            imageViewItem.topAnchor.constraint(equalTo: viewImageContainer.topAnchor, constant: 16),
            imageViewItem.leadingAnchor.constraint(equalTo: viewImageContainer.leadingAnchor, constant: 16),
            imageViewItem.trailingAnchor.constraint(equalTo: viewImageContainer.trailingAnchor, constant: -16),
            imageViewItem.bottomAnchor.constraint(equalTo: viewImageContainer.bottomAnchor, constant: -16),
        ])
    }
}
