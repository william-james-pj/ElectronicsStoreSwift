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
    let products: [Product]
}

// MARK: - Product
struct Product: Codable {
    let id: String
    let name: String
    let price: Int
    let description: String
    let imageName: String
    let isSaved: Bool
}
