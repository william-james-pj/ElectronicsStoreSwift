//
//  HeaderCollectionViewCell.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 19/07/22.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    // MARK: - Constants
    static let resuseIdentifier: String = "HeaderCollectionViewCell"
    
    // MARK: - Components
    fileprivate let viewBase: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Primary")
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let viewShadow: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let labelSale: UILabel = {
        let label = UILabel()
        label.text = "SALE"
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let labelUp: UILabel = {
        let label = UILabel()
        label.text = "UP TO"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let labelOff: UILabel = {
        let label = UILabel()
        label.text = "60% OFF"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
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
        self.addSubview(viewBase)
        viewBase.addSubview(viewShadow)
        
        viewBase.addSubview(labelSale)
        viewBase.addSubview(labelUp)
        viewBase.addSubview(labelOff)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            viewBase.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            viewBase.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewBase.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewBase.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            viewShadow.topAnchor.constraint(equalTo: viewBase.topAnchor),
            viewShadow.leadingAnchor.constraint(equalTo: viewBase.leadingAnchor),
            viewShadow.trailingAnchor.constraint(equalTo: viewBase.trailingAnchor),
            viewShadow.bottomAnchor.constraint(equalTo: viewBase.bottomAnchor),
            
            labelSale.topAnchor.constraint(equalTo: viewBase.topAnchor, constant: 40),
            labelSale.leadingAnchor.constraint(equalTo: viewBase.leadingAnchor, constant: 24),
            
            labelUp.topAnchor.constraint(equalTo: labelSale.bottomAnchor, constant: 0),
            labelUp.leadingAnchor.constraint(equalTo: viewBase.leadingAnchor, constant: 24),
            
            labelOff.topAnchor.constraint(equalTo: labelUp.bottomAnchor, constant: 0),
            labelOff.leadingAnchor.constraint(equalTo: viewBase.leadingAnchor, constant: 24),
        ])
    }
}
