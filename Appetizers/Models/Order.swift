//
//  Order.swift
//  Appetizers
//
//  Created by Kanwar Sandhu on 2024-08-05.
//

import Foundation

final class Order : ObservableObject {
    @Published var items : [Appetizer] = []
    
    var totalPrice : Double {
        var t : Double = 0
        for i in items{
            t = t + i.price
        }
        return t
                    
    }
    
}
