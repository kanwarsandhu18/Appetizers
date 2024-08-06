//
//  Appetizer.swift
//  Appetizers
//
//  Created by Kanwar Sandhu on 2024-08-03.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 1, name: "Test", description: "just some", price: 100.0, imageURL: "", calories: 300, protein: 99, carbs: 99)
    static let appetizers = [sampleAppetizer , sampleAppetizer,sampleAppetizer]
}
