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
    let userDefaults = UserDefaultsManagemen()
    var productData = BehaviorRelay<[Section]>(value: [])
    
    // MARK: - Init
    public init() {
        settingData()
    }
    
    // MARK: - Methods
    func updateProductViewed() {
        var data = productData.value
        
        let productViewed = userDefaults.getProductViewed()
        
        data[1].products = productViewed
        
        productData.accept(data)
    }
    
    func updateProductSaved(_ id: String, isSaved: Bool) {
        var data = productData.value
        
        data[0].products = updateDataWithIsSaved(products: data[0].products, savedID: [id], value: isSaved)
        data[1].products = updateDataWithIsSaved(products: data[1].products, savedID: [id], value: isSaved)
        data[2].products = updateDataWithIsSaved(products: data[2].products, savedID: [id], value: isSaved)

        userDefaults.setProductViewed(data[1].products)
        
        productData.accept(data)
    }
    
    fileprivate func settingData() {
        var data = getData()
        
        data = settingProductViewed(data)
        data = settingProductSaved(data)
        
        productData.accept(data)
    }
    
    fileprivate func settingProductViewed(_ data: [Section]) -> [Section] {
        let productViewed = userDefaults.getProductViewed()
        var dataAux = data
        
        if productViewed.count != 0 {
            dataAux[1].products += productViewed
        }
        
        return dataAux
    }
    
    fileprivate func settingProductSaved(_ data: [Section]) -> [Section] {
        let productSaved = userDefaults.getSaved()
        var dataAux = data
        
        if productSaved.count == 0 {
            return dataAux
        }
        
        let savedID = productSaved.map { $0.id }
        
        dataAux[0].products = updateDataWithIsSaved(products: dataAux[0].products, savedID: savedID, value: true)
        dataAux[1].products = updateDataWithIsSaved(products: dataAux[1].products, savedID: savedID, value: true)
        dataAux[2].products = updateDataWithIsSaved(products: dataAux[2].products, savedID: savedID, value: true)
        
        return dataAux
    }
    
    fileprivate func updateDataWithIsSaved(products: [Product], savedID: [String], value: Bool) -> [Product] {
        var productsAux = products
        
        for id in savedID {
            let index = productsAux.firstIndex(where: { $0.id == id })
            
            guard let index = index else {
                continue
            }

            productsAux[index].isSaved = value
        }
        
        return productsAux
    }
    
    fileprivate func getData() -> [Section] {
        return GetPublication().getPublication()
    }
}
