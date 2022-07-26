//
//  CartViewModel.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 26/07/22.
//

import Foundation
import RxRelay

class CartViewModel {
    // MARK: - Variables
    let userDefaults = UserDefaultsManagemen()
    var cartData = BehaviorRelay<[CartModel]>(value: [])
    
    // MARK: - Init
    public init() {
    }
    
    func getData() {
        let cartUD = userDefaults.getCart()
        cartData.accept(cartUD)
    }
}
