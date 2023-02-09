//
//  RegisterViewModel.swift
//  FindMyBurger
//
//  Created by Apps2T on 6/2/23.
//

import Foundation

class RegisterViewModel: ObservableObject{
    
    @Published var shouldShowLogin: Bool = false
    @Published var shouldShowError: Bool = false
    @Published var alertText: String = ""
    
    func regist (name: String, email: String, pass: String, pass2: String){
        
        if name.isEmpty || email.isEmpty || pass.isEmpty || pass2.isEmpty {
            shouldShowError = true
            alertText = "Rellena todos los campos."
        }else{
            if pass != pass2 {
                shouldShowError = true
                alertText = "Las contraseñas no coinciden."
            }else{
                let request: [String: Any] = [
                    "name" : name,
                    "email": email,
                    "password" : pass,
                    "confirm_password": pass2
                ]
            }
            
        }
        
        func onSuccess() {
            // Navegación hacia la vista de Agenda
            shouldShowLogin = true
        }
        
        func onError(error: String) {
            shouldShowError = true
        }
        
        
    }
    
    
}
