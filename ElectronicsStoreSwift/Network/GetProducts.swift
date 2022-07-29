//
//  GetProducts.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 22/07/22.
//

import Foundation

class GetPublication {
    
    // MARK: - Init
    public init() {
    }
    
    // MARK: - Methods
    func getPublication() -> [Section] {
        let url = Bundle.main.url(forResource: "products", withExtension: "json")
        
        guard let url = url else {
            return []
        }
        
        guard let data = try? Data(contentsOf: url) else {
            return []
        }
        
        let decoder = JSONDecoder()
        if let jsonPetitions = try? decoder.decode(DataHome.self, from: data) {
            return jsonPetitions.sections
        }
        
        return []
    }
}
