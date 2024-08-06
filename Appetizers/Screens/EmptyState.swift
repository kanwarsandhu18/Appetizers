//
//  EmptyState.swift
//  Appetizers
//
//  Created by Kanwar Sandhu on 2024-08-05.
//

import SwiftUI

struct EmptyState: View {
    let imageName : String
    let message : String
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack{
                
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .padding()
                
                Text(message)
                    .font(.title3)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            .offset(y:-20)
        }
    }
}

#Preview {
    EmptyState(imageName: "empty-cart", message: "Yout cart is empty. \n Add Items to you cart to place order.")
}
