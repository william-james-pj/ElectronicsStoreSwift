//
//  CartViewModel.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 26/07/22.
//

import Foundation
import RxRelay

class CartViewModel {
    // MARK: - Constants
    let userDefaults = UserDefaultsManagemen()
    
    // MARK: - Variables
    var cartData = BehaviorRelay<[CartModel]>(value: [])
    
    // MARK: - Init
    public init() {
    }
    
    func getData() {
        let cartUD = userDefaults.getCart()
        cartData.accept(cartUD)
    }
    
    func getTotalValue() -> Float {
        let totalArray = cartData.value.map { Float($0.qtd) * $0.product.price }
        return totalArray.reduce(0) { $0 + $1 }
    }
    
    func updateQtdCartItem(_ cartItem: CartModel) {
        var carts = cartData.value
        
        let index = carts.firstIndex { $0.product.id == cartItem.product.id }

        guard let findIndex = index else {
            return
        }

        carts[findIndex].qtd = cartItem.qtd

        userDefaults.setCart(carts)
        self.cartData.accept(carts)
    }
    
}
