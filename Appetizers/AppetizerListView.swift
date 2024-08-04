//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Kanwar Sandhu on 2024-08-03.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationStack{
            List(MockData.appetizers ,id: \.id){ appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            
                .navigationTitle("Appetizers")
        }
    }
}

#Preview {
    AppetizerListView()
}
