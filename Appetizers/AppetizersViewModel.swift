//
//  AppetizersViewModel.swift
//  Appetizers
//
//  Created by Kanwar Sandhu on 2024-08-04.
//

import SwiftUI

final class AppetizersViewModel : ObservableObject {
    @Published var appetizers : [Appetizer] = []
    @Published var alert : AlertItem?
    @Published var isLoading = false
    func getAppetizers ()  {
        self.isLoading = true
        NetworkManager.shared.getAppetizers { response in
            DispatchQueue.main.sync {
                self.isLoading = false
                switch response {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error{
                    case .invalidData:
                        self.alert = AlertContext.invalidData
                    case .invalidResponse:
                        self.alert = AlertContext.invalidResponse
                    case .invalidURL:
                        self.alert = AlertContext.invalidURL
                    case .unableToComplete:
                        self.alert = AlertContext.unableToComplete
                    }
                }
            }
        }
        }
}
