//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Kanwar Sandhu on 2024-08-05.
//

import SwiftUI

struct AppetizerDetailView: View {
    let appetizer : Appetizer
    var body: some View {
        VStack{
            Image("steak")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300,height: 225)
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack(spacing:40){
                    VStack(spacing:5){
                        Text("Carbs")
                            .font(.caption)
                            .fontWeight(.bold)
                    
                        Text("\(appetizer.carbs)")
                            .foregroundStyle(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                        
                    }
                    VStack(spacing:5){
                        Text("Carbs")
                            .font(.caption)
                            .fontWeight(.bold)
                    
                        Text("\(appetizer.carbs)")
                            .foregroundStyle(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                        
                    }
                    VStack(spacing:5){
                        Text("Carbs")
                            .font(.caption)
                            .fontWeight(.bold)
                    
                        Text("\(appetizer.carbs)")
                            .foregroundStyle(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                        
                    }
                }
            }
            Spacer()
            Button{
                print("")
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add to order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260 , height: 50)
                    .foregroundStyle(.white)
                    .background(Color("brandPrimary"))
                    .clipShape(.capsule)
            }
            .padding(.bottom,30)
        }
        .frame(width: 300 , height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 35)
        .overlay( Button {
            print("Dismiss")
        } label: {
            ZStack{
                Circle()
                    .frame(width: 30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                Image(systemName: "xmark")
                    .frame(width: 44 , height: 44)
            }} , alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer)
}
