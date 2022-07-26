//
//  DetailsProductViewModel.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 26/07/22.
//

import Foundation
import RxSwift
import RxRelay

class DetailsProductViewModel {
    // MARK: - Constants
    let userDefaults = UserDefaultsManagemen()
    let setViewedBehavior = BehaviorRelay<Int>(value: 0)
    
    // MARK: - Init
    public init() {
    }
    
    // MARK: - Variables
    func setProductViewed(_ product: Product) {
        var arrayAux = userDefaults.getProductViewed()
        
        let isViewed = arrayAux.first { item in
            item.id == product.id
        }
        
        if isViewed != nil {
            return
        }
        
        arrayAux.insert(product, at: 0)
        userDefaults.setProductViewed(arrayAux)
        self.setViewedBehavior.accept(1)
    }
    
    func addProductInCart(_ product: Product, qtd: Int) {
        let newCart = CartModel(qtd: qtd, product: product)
        var carts = userDefaults.getCart()
        carts.append(newCart)
        userDefaults.setCart(carts)
    }
}
