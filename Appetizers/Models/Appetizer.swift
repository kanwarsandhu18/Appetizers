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
    static let sampleAppetizer1 = Appetizer(id: 1, name: "Test one", description: "just some", price: 100.0, imageURL: "", calories: 300, protein: 99, carbs: 99)
    static let sampleAppetizer2 = Appetizer(id: 2, name: "Test two", description: "just some", price: 100.0, imageURL: "", calories: 300, protein: 99, carbs: 99)
    static let sampleAppetizer3 = Appetizer(id: 3, name: "Test three", description: "just some", price: 100.0, imageURL: "", calories: 300, protein: 99, carbs: 99)
    static let sampleOrders = [sampleAppetizer1,sampleAppetizer2,sampleAppetizer3]
}
