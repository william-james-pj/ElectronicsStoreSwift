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
    let setViewedBehavior = BehaviorRelay<Int>(value: 0)
    
    // MARK: - Init
    public init() {
    }
    
    // MARK: - Variables
    func setProductViewed(_ product: Product) {
        var arrayAux = getProductViewedFromUserDefaults()
        
        let isViewed = arrayAux.first { item in
            item.id == product.id
        }
        
        if isViewed != nil {
            return
        }
        
        arrayAux.insert(product, at: 0)
        setProductViewedInUserDefault(arrayAux)
        self.setViewedBehavior.accept(1)
    }
    
    fileprivate func getProductViewedFromUserDefaults() -> [Product]{
        let userDefaults = UserDefaults.standard
        do {
            let arrayUserDefault = try userDefaults.getObject(forKey: "productViewed", castTo: [Product].self)

            return arrayUserDefault
        } catch {
            return []
        }
    }
    
    fileprivate func setProductViewedInUserDefault(_ products: [Product]) {
        let userDefaults = UserDefaults.standard
        do {
            try userDefaults.setObject(products, forKey: "productViewed")
        } catch {
        }
    }
}
