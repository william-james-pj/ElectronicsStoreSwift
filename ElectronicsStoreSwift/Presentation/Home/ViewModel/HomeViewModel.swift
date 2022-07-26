//
//  HomeViewModel.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 22/07/22.
//

import Foundation
import RxSwift
import RxRelay

class HomeViewModel {
    // MARK: - Variables
    var productData = BehaviorRelay<[Section]>(value: [])
    
    // MARK: - Init
    public init() {
        getData()
    }
    
    // MARK: - Methods
    func updateProductViewed() {
        var data = productData.value
        
        let productViewed = getProductViewedFromUserDefaults()
        
        data[1].products = productViewed
        
        productData.accept(data)
    }
    
    fileprivate func getData() {
        var data = GetPublication().getPublication()
        
        let productViewed = getProductViewedFromUserDefaults()
        
        if productViewed.count != 0 {
            data[1].products += productViewed
        }

        productData.accept(data)
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
}
