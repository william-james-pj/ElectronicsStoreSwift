//
//  DataHome.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 22/07/22.
//

import Foundation

// MARK: - DataHome
struct DataHome: Codable {
    let sections: [Section]
}

// MARK: - Section
struct Section: Codable {
    let sectionTitle: String
    var products: [Product]
}

// MARK: - Product
struct Product: Codable {
    let id: String
    let name: String
    let price: Float
    let description: String
    let imagesName: [String]
    let isSaved: Bool
    let colors: [String]
}

struct CartModel: Codable {
    var qtd: Int
    let product: Product
}
