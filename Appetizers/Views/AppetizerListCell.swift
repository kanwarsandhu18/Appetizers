//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Kanwar Sandhu on 2024-08-04.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer : Appetizer
    var body: some View {
        HStack{
            AppetizerImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width:120 , height: 100)
                .cornerRadius(8)
            VStack (alignment: .leading , spacing: 9){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price,specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
