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
    
    fileprivate func getData() {
        
        let data = GetPublication().getPublication()

        productData.accept(data)
    }
}
