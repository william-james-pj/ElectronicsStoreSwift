//
//  CartFooterCollectionReusableView.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 21/07/22.
//

import UIKit

class CartFooterCollectionReusableView: UICollectionReusableView {
    // MARK: - Constants
    static let resuseIdentifier: String = "CartFooterCollectionReusableView"
    
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 24
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let viewStackBaseAux: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let couponBox: CouponBox = {
        let view = CouponBox()
        return view
    }()
    
    fileprivate let stackSpent: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let subtotal: CartSpentDescription = {
        let spent = CartSpentDescription()
        spent.text = "Subtotal:"
        spent.value = "$160"
        return spent
    }()
    
    fileprivate let delivery: CartSpentDescription = {
        let spent = CartSpentDescription()
        spent.text = "Delivery Fee:"
        spent.value = "$10"
        return spent
    }()
    
    fileprivate let discount: CartSpentDescription = {
        let spent = CartSpentDescription()
        spent.text = "Discount:"
        spent.value = "15%"
        return spent
    }()
    
    fileprivate let stackPay: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let viewLine: UIView = {
        let view = UIView()
//        view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.97, alpha: 1.00)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let total: CartSpentDescription = {
        let spent = CartSpentDescription()
        spent.text = "Total:"
        spent.value = "$170"
        spent.isFeaturedValue = true
        return spent
    }()
    
    fileprivate let buttonPay: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(named: "Primary")
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        viewLine.makeDashedBorderLine()
    }
    
    // MARK: - Setup
    fileprivate func setupVC() {
        buildHierarchy()
        buildConstraints()
    }
    
    // MARK: - Methods
    fileprivate func buildHierarchy() {
        self.addSubview(stackBase)
        stackBase.addArrangedSubview(couponBox)
        
        stackBase.addArrangedSubview(stackSpent)
        stackSpent.addArrangedSubview(subtotal)
        stackSpent.addArrangedSubview(delivery)
        stackSpent.addArrangedSubview(discount)
        
        stackBase.addArrangedSubview(viewLine)
        
        stackBase.addArrangedSubview(stackPay)
        stackPay.addArrangedSubview(total)
        stackPay.addArrangedSubview(buttonPay)
        stackBase.addArrangedSubview(viewStackBaseAux)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            stackBase.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackBase.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackBase.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            buttonPay.heightAnchor.constraint(equalToConstant: 45),
            
            viewLine.heightAnchor.constraint(equalToConstant: 2),
        ])
    }
}
