//
//  LoginViewModel.swift
//  FindMyBurger
//
//  Created by Apps2T on 6/2/23.
//

import Foundation

class LoginViewModel: ObservableObject{
    
    @Published var shouldShowHome: Bool = false
    @Published var shouldShowError: Bool = false
    @Published var alertText: String = ""
    
    func login (email: String, pass: String){
        
        if email.isEmpty || pass.isEmpty {
            shouldShowError = true
            alertText = "Rellena todos los campos."
        }else{
            let request: [String: Any] = [
                "email": email,
                "password" : pass
            ]
        }
        
    }
    
    func onSuccess() {
        // Navegación al home
        shouldShowHome = true
    }
    
    func onError(error: String) {
        shouldShowError = true
    }
    
    
}

