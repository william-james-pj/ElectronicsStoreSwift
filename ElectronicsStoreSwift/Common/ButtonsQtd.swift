//
//  ButtonsQtd.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 25/07/22.
//

import UIKit

class ButtonsQtd: UIView {

    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let buttonMinus: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
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
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(named: "Primary")
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        self.translatesAutoresizingMaskIntoConstraints = false
        
        buildHierarchy()
        buildConstraints()
    }
    
    // MARK: - Methods
    fileprivate func buildHierarchy() {
        self.addSubview(stackBase)
        stackBase.addArrangedSubview(buttonMinus)
        stackBase.addArrangedSubview(labelQtd)
        stackBase.addArrangedSubview(buttonPlus)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackBase.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackBase.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            buttonMinus.widthAnchor.constraint(equalToConstant: 25),
            buttonMinus.heightAnchor.constraint(equalToConstant: 25),
            
            labelQtd.widthAnchor.constraint(equalToConstant: 30),
            
            buttonPlus.widthAnchor.constraint(equalToConstant: 25),
            buttonPlus.heightAnchor.constraint(equalToConstant: 25),
        ])
    }

}
