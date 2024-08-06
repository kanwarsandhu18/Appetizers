//
//  OrderView.swift
//  Appetizers
//
//  Created by Kanwar Sandhu on 2024-08-03.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order : Order
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    List{
                        ForEach(order.items){ order in
                            AppetizerListCell(appetizer: order)
                        }
                        .onDelete(perform: { indexSet in
                            order.items.remove(atOffsets: indexSet)
                        })
                    }
                    Spacer()
                    Button{
                        
                    } label: {
                        Text("$\(order.totalPrice , specifier: "%.2f") Add to order")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(width: 260 , height: 50)
                            .foregroundStyle(.white)
                            .background(Color("brandPrimary"))
                            .clipShape(.capsule)
                            .padding()
                    }
                }
                if order.items.isEmpty{
                    EmptyState(imageName: "empty-cart", message: "Yout cart is empty. \n Add Items to you cart to place order.")
                }
            }
           
            
                .navigationTitle("Orders")
        }
    }
}

#Preview {
    OrderView()
}
