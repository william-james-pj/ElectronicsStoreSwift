//
//  CartItemCollectionViewCell.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 21/07/22.
//

import UIKit

class CartItemCollectionViewCell: UICollectionViewCell {
    // MARK: - Constants
    static let resuseIdentifier: String = "CartItemCollectionViewCell"
    
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
    
    fileprivate let viewContentContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let stackContent: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let stackText: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
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
    
    fileprivate let labelItemDescription: UILabel = {
        let label = UILabel()
        label.text = "The intuitive and intelligent Wi-1000XM4 headshones"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 8, weight: .regular)
        label.textColor = UIColor(named: "Disabled")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let labelItemValue: UILabel = {
        let label = UILabel()
        label.text = "$160"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(named: "Text")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let stackButtonContainer: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let viewStackButtonAux: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let stackButtons: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let buttonMinus: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: "Primary")?.cgColor
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.tintColor = UIColor(named: "Primary")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    fileprivate let labelQtd: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor(named: "Text")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let buttonPlus: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 4
        button.backgroundColor = UIColor(named: "Primary")
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        buildHierarchy()
        buildConstraints()
    }
    
    // MARK: - Methods
    fileprivate func buildHierarchy() {
        self.addSubview(stackBase)
        stackBase.addArrangedSubview(viewImageContainer)
        stackBase.addArrangedSubview(viewContentContainer)
        
        viewContentContainer.addSubview(stackContent)
        stackContent.addArrangedSubview(stackText)
        stackText.addArrangedSubview(labelItemName)
        stackText.addArrangedSubview(labelItemDescription)
        stackText.addArrangedSubview(labelItemValue)
        
        stackContent.addArrangedSubview(stackButtonContainer)
        stackButtonContainer.addArrangedSubview(viewStackButtonAux)
        stackButtonContainer.addArrangedSubview(stackButtons)
        stackButtons.addArrangedSubview(buttonMinus)
        stackButtons.addArrangedSubview(labelQtd)
        stackButtons.addArrangedSubview(buttonPlus)
        
        self.addSubview(viewBorderBottom)
        
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: self.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackBase.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackBase.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            viewImageContainer.widthAnchor.constraint(equalToConstant: 80),
            
            stackContent.topAnchor.constraint(equalTo: viewContentContainer.topAnchor, constant: 8),
            stackContent.leadingAnchor.constraint(equalTo: viewContentContainer.leadingAnchor),
            stackContent.trailingAnchor.constraint(equalTo: viewContentContainer.trailingAnchor),
            stackContent.bottomAnchor.constraint(equalTo: viewContentContainer.bottomAnchor, constant: -8),
            
            stackButtonContainer.widthAnchor.constraint(equalToConstant: 70),
            
            buttonMinus.widthAnchor.constraint(equalToConstant: 20),
            buttonMinus.heightAnchor.constraint(equalToConstant: 20),
            
            buttonPlus.widthAnchor.constraint(equalToConstant: 20),
            buttonPlus.heightAnchor.constraint(equalToConstant: 20),
            
            viewBorderBottom.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewBorderBottom.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewBorderBottom.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            viewBorderBottom.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
}
