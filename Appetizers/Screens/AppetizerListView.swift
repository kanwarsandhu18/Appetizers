//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Kanwar Sandhu on 2024-08-03.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizersViewModel()
    var body: some View {
        ZStack{
            NavigationStack{
                List(viewModel.appetizers ,id: \.id){ appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
                
                .navigationTitle("Appetizers")
            }
            if (viewModel.isLoading){
                LoadingView()
            }
        }
        .task{
            viewModel.getAppetizers()
        }
        .alert(item: $viewModel.alert){ alert in
            Alert(title: alert.title , message: alert.message , dismissButton: alert.dismissButton)
        }
    }
        
    }


#Preview {
    AppetizerListView()
}
