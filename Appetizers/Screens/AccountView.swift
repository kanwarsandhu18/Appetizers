//
//  AccountView.swift
//  Appetizers
//
//  Created by Kanwar Sandhu on 2024-08-03.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    var body: some View {
        NavigationStack{
            Form{
                Section(header:Text("Personal Info")){
                    TextField("First Name" , text: $viewModel.user.firstName)
                    TextField("Last Name" , text: $viewModel.user.lastName)
                    TextField("Email" , text: $viewModel.user.email)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                    DatePicker("Birthday",selection: $viewModel.user.birthDate , displayedComponents: .date)
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                Section(header: Text("Requests")){
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNap)
                    Toggle("Frequent Refills", isOn: $viewModel.user.freqRefills)
                }
                
                .navigationTitle("Account")
            }

            
        }
        .onAppear{
            viewModel.retrieveUser()
        }
        .alert(item : $viewModel.alert) { alertITem in
            Alert(title: alertITem.title , message: alertITem.message , dismissButton: alertITem.dismissButton)
            }
    }
}

#Preview {
    AccountView()
}
