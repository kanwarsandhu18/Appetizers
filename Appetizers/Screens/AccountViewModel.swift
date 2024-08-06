//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Kanwar Sandhu on 2024-08-05.
//

import SwiftUI

final class AccountViewModel : ObservableObject {
    @Published var user = User()
    @Published var alert : AlertItem?
    @AppStorage("user") private var userData: Data?
    
    func saveChanges(){
        guard isValidForm else {return}
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alert = AlertContext.userSaveSuccess
        }
        catch{
            alert = AlertContext.invalidData
        }
        
        return
    }
    
    func retrieveUser(){
        guard let userData = userData else {return}
        do {
            user = try JSONDecoder().decode(User.self , from: userData)
            
        }catch{
            alert = AlertContext.invalidData
        }
    }
    
    var isValidForm : Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else{
            alert = AlertContext.invalidForm
            return false
        }
        return true
    }
    
    
}
