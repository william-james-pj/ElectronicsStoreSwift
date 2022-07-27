//
//  CartViewController.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 19/07/22.
//

import UIKit
import RxSwift

class CartViewController: UIViewController {
    // MARK: - Constrants
    fileprivate let disposeBag = DisposeBag()
    private let reuseIdentifierHeader = "UIViewCartHeader"
    // MARK: - Variables
    fileprivate var viewModel: CartViewModel = {
        return CartViewModel()
    }()
    fileprivate var cartData: [CartModel] = []
    
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let topBar: ScreenHeader = {
        let screenHeader = ScreenHeader()
        screenHeader.title = "My Cart"
        return screenHeader
    }()
    
    fileprivate let emptyView: EmptyView = {
        let view = EmptyView()
        view.isHidden = true
        return view
    }()
        
    fileprivate let collectionViewCart: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.bounces = false
        return collectionView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.getData()
    }
    
    // MARK: - Setup
    fileprivate func setupVC() {
        view.backgroundColor = UIColor(named: "Backgroud")
        
        self.viewModel.cartData.subscribe(onNext: { data in
            self.cartData = data
            self.collectionViewCart.reloadData()
            self.setView()
        }).disposed(by: disposeBag)
        
        setView()        
        buildHierarchy()
        buildConstraints()
        setupCollection()
    }
    
    fileprivate func setupCollection() {
        collectionViewCart.dataSource = self
        collectionViewCart.delegate = self
        
        collectionViewCart.register(CartItemCollectionViewCell.self, forCellWithReuseIdentifier: CartItemCollectionViewCell.resuseIdentifier)
        collectionViewCart.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseIdentifierHeader)
        collectionViewCart.register(CartFooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CartFooterCollectionReusableView.resuseIdentifier)
    }

    // MARK: - Methods
    fileprivate func setView() {
        if self.cartData.count == 0 {
            self.collectionViewCart.isHidden = true
            self.emptyView.isHidden = false
            return
        }
        self.collectionViewCart.isHidden = false
        self.emptyView.isHidden = true
    }
    
    fileprivate func buildHierarchy() {
        view.addSubview(stackBase)
        stackBase.addArrangedSubview(topBar)
        stackBase.addArrangedSubview(collectionViewCart)
        stackBase.addArrangedSubview(emptyView)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackBase.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackBase.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

}

// MARK: - extension UICollectionViewDelegate
extension CartViewController: UICollectionViewDelegate {
}

// MARK: - extension CollectionViewDataSource
extension CartViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cartData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CartItemCollectionViewCell.resuseIdentifier, for: indexPath) as! CartItemCollectionViewCell
        cell.settingCell(self.cartData[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    // Header & Footer
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseIdentifierHeader, for: indexPath)
                return header
            
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CartFooterCollectionReusableView.resuseIdentifier, for: indexPath) as! CartFooterCollectionReusableView
            footer.settingCell(subtotal: self.viewModel.getTotalValue())
            return footer
        default:
            assert(false, "Unexpected element kind")
        }
    }
}

// MARK: - extension CollectionViewDelegateFlowLayout
extension CartViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
//        let height = collectionView.frame.height
        return CGSize(width: width, height: 97)
    }
    
    // Header
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width, height: 16)
    }
    
    // Footer
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let width = collectionView.frame.width
        
        if self.cartData.count == 0 {
            return CGSize(width: width, height: 0)
        }
        
        return CGSize(width: width, height: 350)
    }
}

// MARK: - extension CartItemCollectionViewCellDelegate
extension CartViewController: CartItemCollectionViewCellDelegate {
    func updateQtd(_ cartItem: CartModel) {
        self.viewModel.updateQtdCartItem(cartItem)
    }
    
}
