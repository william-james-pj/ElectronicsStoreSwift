//
//  UserDefaultsManagement.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 26/07/22.
//

import Foundation

class UserDefaultsManagemen {
    
    // MARK: - Product
    func getProductViewed() -> [Product]{
        let userDefaults = UserDefaults.standard
        do {
            let arrayUserDefault = try userDefaults.getObject(forKey: "productViewed", castTo: [Product].self)

            return arrayUserDefault
        } catch {
            return []
        }
    }
    
    func setProductViewed(_ products: [Product]) {
        let userDefaults = UserDefaults.standard
        do {
            try userDefaults.setObject(products, forKey: "productViewed")
        } catch {
        }
    }
    
    // MARK: - Cart
    func getCart() -> [CartModel]{
        let userDefaults = UserDefaults.standard
        do {
            let arrayUserDefault = try userDefaults.getObject(forKey: "cart", castTo: [CartModel].self)

            return arrayUserDefault
        } catch {
            return []
        }
    }
    
    func setCart(_ carts: [CartModel]) {
        let userDefaults = UserDefaults.standard
        do {
            try userDefaults.setObject(carts, forKey: "cart")
        } catch {
        }
    }
    
    // MARK: - Saved
    func getSaved() -> [Product]{
        let userDefaults = UserDefaults.standard
        do {
            let arrayUserDefault = try userDefaults.getObject(forKey: "saved", castTo: [Product].self)

            return arrayUserDefault
        } catch {
            return []
        }
    }
    
    func setSaved(_ carts: [Product]) {
        let userDefaults = UserDefaults.standard
        do {
            try userDefaults.setObject(carts, forKey: "saved")
        } catch {
        }
    }
    
}
