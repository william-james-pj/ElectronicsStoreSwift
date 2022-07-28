//
//  DetailsProductViewModel.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 26/07/22.
//

import Foundation

class DetailsProductViewModel {
    // MARK: - Constants
    let userDefaults = UserDefaultsManagemen()
    
    // MARK: - Init
    public init() {
    }
    
    // MARK: - Variables
    func setProductViewed(_ product: Product) -> Bool {
        var viewed = userDefaults.getProductViewed()
        
        let isViewed = viewed.first { $0.id == product.id }
        
        if isViewed != nil {
            return false
        }
        
        viewed.insert(product, at: 0)
        userDefaults.setProductViewed(viewed)
        return true
    }
    
    func addProductInCart(_ product: Product, qtd: Int) {
        let newCart = CartModel(qtd: qtd, product: product)
        var carts = userDefaults.getCart()
        carts.append(newCart)
        userDefaults.setCart(carts)
    }
    
    func addSavedProduct(_ product: Product) -> Bool {
        var saved = userDefaults.getSaved()
        
        let index = saved.firstIndex(where: { $0.id == product.id })
        
        if let index = index {
            saved.remove(at: index)
            userDefaults.setSaved(saved)
            return false
        }
        
        var aux = product
        aux.isSaved = true
        saved.append(aux)
        
        userDefaults.setSaved(saved)
        return true
    }
}
