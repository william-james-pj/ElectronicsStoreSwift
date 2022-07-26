//
//  DetailsProductViewController.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 25/07/22.
//

import UIKit

class DetailsProductViewController: UIViewController {
    // MARK: - Constrants
    // MARK: - Variables
    var viewModel: DetailsProductViewModel = {
        return DetailsProductViewModel()
    }()
    var productSelected: Product?
    
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 32
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let viewStackAux: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let viewImageContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "ImageBackgroud")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let carouselDetailsProduct: CarouselDetailsProduct = {
        let view = CarouselDetailsProduct()
        return view
    }()
    
    fileprivate let viewContentContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let stackContent: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let stackNameAndSaved: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let buttonSaved: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 12.5
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.96, green: 0.97, blue: 0.97, alpha: 1.00).cgColor
        button.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        button.tintColor = UIColor(named: "Disabled")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    fileprivate let labelItemName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor(named: "Text")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let labelItemDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 11, weight: .bold)
        label.textColor = UIColor(named: "Disabled")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let stackValueAndColor: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let labelItemValue: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(named: "Text")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let viewChooseColor: ChooseColor = {
        let view = ChooseColor()
        return view
    }()
    
    fileprivate let separationLineFooter = SeparationLine()
        
    fileprivate let viewFooterContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let stackFooter: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 32
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let buttonsQtd: ButtonsQtd = {
        let view = ButtonsQtd()
        return view
    }()
    
    fileprivate let buttonAddCart: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(named: "Primary")
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitle("Add Cart", for: .normal)
        button.addTarget(self, action: #selector(buttonAddCartTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Actions
    @IBAction func buttonAddCartTapped(sender: UIButton) {
        guard let productSelected = productSelected else {
            return
        }
        
        let qtd = self.buttonsQtd.qtdSelected
        
        viewModel.addProductInCart(productSelected, qtd: qtd)
        self.navigationController?.popViewController(animated: true)
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    
    // MARK: - Setup
    fileprivate func setupVC() {
        self.title = "Details Product"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .bold)]
        
        view.backgroundColor = UIColor(named: "Backgroud")
        buildHierarchy()
        buildConstraints()
    }

    // MARK: - Methods
    func settingScreen(_ item: Product) {
        self.labelItemName.text = item.name
        self.labelItemValue.text = "$ \(item.price)"
        self.labelItemDescription.text = item.description
        
        let colors = item.colors.map { self.hexStringToUIColor(hex: $0)}
        self.viewChooseColor.setButtonColors(colors)
        self.carouselDetailsProduct.settingCell(item.imagesName)
        
        self.viewModel.setProductViewed(item)
        self.productSelected = item
    }
    
    fileprivate func buildHierarchy() {
        view.addSubview(stackBase)
        stackBase.addArrangedSubview(viewImageContainer)
        viewImageContainer.addSubview(carouselDetailsProduct)
        
        stackBase.addArrangedSubview(viewContentContainer)
        viewContentContainer.addSubview(stackContent)
            stackContent.addArrangedSubview(stackNameAndSaved)
                stackNameAndSaved.addArrangedSubview(labelItemName)
                stackNameAndSaved.addArrangedSubview(buttonSaved)
            stackContent.addArrangedSubview(labelItemDescription)
        
            stackContent.addArrangedSubview(stackValueAndColor)
                stackValueAndColor.addArrangedSubview(labelItemValue)
                stackValueAndColor.addArrangedSubview(viewChooseColor)
            
        stackBase.addArrangedSubview(separationLineFooter)
        
        stackBase.addArrangedSubview(viewFooterContainer)
        viewFooterContainer.addSubview(stackFooter)
                stackFooter.addArrangedSubview(buttonsQtd)
                stackFooter.addArrangedSubview(buttonAddCart)
        
        stackBase.addArrangedSubview(viewStackAux)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackBase.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackBase.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            viewImageContainer.heightAnchor.constraint(equalToConstant: 300),
            
            carouselDetailsProduct.topAnchor.constraint(equalTo: viewImageContainer.topAnchor),
            carouselDetailsProduct.leadingAnchor.constraint(equalTo: viewImageContainer.leadingAnchor),
            carouselDetailsProduct.trailingAnchor.constraint(equalTo: viewImageContainer.trailingAnchor),
            carouselDetailsProduct.bottomAnchor.constraint(equalTo: viewImageContainer.bottomAnchor),
            
            stackContent.topAnchor.constraint(equalTo: viewContentContainer.topAnchor),
            stackContent.leadingAnchor.constraint(equalTo: viewContentContainer.leadingAnchor, constant: 16),
            stackContent.trailingAnchor.constraint(equalTo: viewContentContainer.trailingAnchor, constant: -16),
            stackContent.bottomAnchor.constraint(equalTo: viewContentContainer.bottomAnchor),
            
            buttonSaved.widthAnchor.constraint(equalToConstant: 25),
            buttonSaved.heightAnchor.constraint(equalToConstant: 25),
            
            stackFooter.topAnchor.constraint(equalTo: viewFooterContainer.topAnchor),
            stackFooter.leadingAnchor.constraint(equalTo: viewFooterContainer.leadingAnchor, constant: 16),
            stackFooter.trailingAnchor.constraint(equalTo: viewFooterContainer.trailingAnchor, constant: -16),
            stackFooter.bottomAnchor.constraint(equalTo: viewFooterContainer.bottomAnchor),
            
            buttonAddCart.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}

extension DetailsProductViewController {
    func hexStringToUIColor(hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
