//
//  ContentView.swift
//  Appetizers
//
//  Created by Kanwar Sandhu on 2024-08-03.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order : Order
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView() 
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
                .badge(order.items.count)
        }
        .accentColor(Color("brandPrimary"))
        

    }
}

#Preview {
    AppetizerTabView()
}
