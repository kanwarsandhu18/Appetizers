//
//  LoadingView.swift
//  Appetizers
//
//  Created by Kanwar Sandhu on 2024-08-04.
//

import SwiftUI

struct LoadingView : View {
    var body : some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(.circular)
                .scaleEffect(2)
        }
    }
}
