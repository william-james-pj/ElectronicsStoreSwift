//
//  CouponBox.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 21/07/22.
//

import UIKit

class CouponBox: UIView {

    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let labelCoupon: UILabel = {
        let label = UILabel()
        label.text = "Have a coupon code? enter here 👇"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor(named: "Disabled")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let textFieldCoupon: UITextField = {
        let field = UITextField()
        field.placeholder = "Coupon"
        field.layer.borderColor = UIColor(red: 0.96, green: 0.97, blue: 0.97, alpha: 1.00).cgColor
        field.layer.borderWidth = 1
        field.clipsToBounds = true
        field.layer.cornerRadius = 8
        field.font = .systemFont(ofSize: 12, weight: .bold)
        field.textColor = UIColor(named: "Text")
        field.setLeftPaddingPoints(16)
        field.setRightPaddingPoints(16)
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
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
        stackBase.addArrangedSubview(labelCoupon)
        stackBase.addArrangedSubview(textFieldCoupon)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: self.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackBase.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackBase.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            textFieldCoupon.heightAnchor.constraint(equalToConstant: 40),
        ])
    }

}
