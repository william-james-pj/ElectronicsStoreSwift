//
//  CartItemCollectionViewCell.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 21/07/22.
//

import UIKit

protocol CartItemCollectionViewCellDelegate {
    func updateQtd(_ cartItem: CartModel)
}

class CartItemCollectionViewCell: UICollectionViewCell {
    // MARK: - Constants
    static let resuseIdentifier: String = "CartItemCollectionViewCell"
    
    // MARK: - Variable
    var cartData : CartModel?
    var delegate : CartItemCollectionViewCellDelegate?
    
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let viewImageContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let imageViewItem: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    fileprivate let viewContentContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let stackContent: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let stackText: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let labelItemName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor(named: "Text")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let labelItemDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 8, weight: .regular)
        label.textColor = UIColor(named: "Disabled")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let labelItemValue: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(named: "Text")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let stackFooter: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let buttonsQtd: ButtonsQtd = {
        let view = ButtonsQtd()
        return view
    }()
    
    fileprivate let viewBorderBottom: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.97, alpha: 1.00)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        self.buttonsQtd.delegate = self
        
        buildHierarchy()
        buildConstraints()
    }
    
    // MARK: - Methods
    func settingCell(_ item: CartModel) {
        self.labelItemName.text = item.product.name
        self.labelItemValue.text = "$\(item.product.price)"
        self.labelItemDescription.text = item.product.description
        self.imageViewItem.image = UIImage(named: item.product.imagesName[0])
        
        self.buttonsQtd.setQtd(item.qtd)
        self.cartData = item
    }
    
    fileprivate func buildHierarchy() {
        self.addSubview(stackBase)
        stackBase.addArrangedSubview(viewImageContainer)
        viewImageContainer.addSubview(imageViewItem)
        stackBase.addArrangedSubview(viewContentContainer)
        
        viewContentContainer.addSubview(stackContent)
        
        stackContent.addArrangedSubview(stackText)
        stackText.addArrangedSubview(labelItemName)
        stackText.addArrangedSubview(labelItemDescription)
        
        stackContent.addArrangedSubview(stackFooter)
        stackFooter.addArrangedSubview(labelItemValue)
        stackFooter.addArrangedSubview(buttonsQtd)
        
        self.addSubview(viewBorderBottom)
        
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: self.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackBase.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackBase.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            viewImageContainer.widthAnchor.constraint(equalToConstant: 80),
            
            imageViewItem.topAnchor.constraint(equalTo: viewImageContainer.topAnchor, constant: 16),
            imageViewItem.leadingAnchor.constraint(equalTo: viewImageContainer.leadingAnchor, constant: 16),
            imageViewItem.trailingAnchor.constraint(equalTo: viewImageContainer.trailingAnchor, constant: -16),
            imageViewItem.bottomAnchor.constraint(equalTo: viewImageContainer.bottomAnchor, constant: -16),
            
            stackContent.topAnchor.constraint(equalTo: viewContentContainer.topAnchor, constant: 8),
            stackContent.leadingAnchor.constraint(equalTo: viewContentContainer.leadingAnchor),
            stackContent.trailingAnchor.constraint(equalTo: viewContentContainer.trailingAnchor),
            stackContent.bottomAnchor.constraint(equalTo: viewContentContainer.bottomAnchor, constant: -8),
            
            viewBorderBottom.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewBorderBottom.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewBorderBottom.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            viewBorderBottom.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
}

// MARK: - extension ButtonsQtdDelegate
extension CartItemCollectionViewCell: ButtonsQtdDelegate {
    func updateQtd(_ qtd: Int) {
        guard var cartData = self.cartData else { return }
        
        cartData.qtd = qtd
        
        self.delegate?.updateQtd(cartData)
    }
}
