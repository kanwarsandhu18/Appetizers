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
                        .listRowSeparator(.visible, edges: /*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            viewModel.isShowingDetail = true
                            viewModel.appetizerForDetail = appetizer
                        }
                }
                .disabled(viewModel.isShowingDetail)
                
                .navigationTitle("Appetizers")
            }
            .blur(radius: viewModel.isShowingDetail ? 10 : 0)
            if (viewModel.isShowingDetail){
                AppetizerDetailView(appetizer: viewModel.appetizerForDetail! , isShowingAppetizer: $viewModel.isShowingDetail)
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
