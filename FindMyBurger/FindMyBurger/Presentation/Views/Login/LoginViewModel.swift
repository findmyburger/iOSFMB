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
    @Published var shouldShowRegister: Bool = false
    @Published var shouldShowRecoverPass: Bool = false
    
    @Published var alertText: String = ""
    
    func login (email: String, pass: String){
        
        let url = "http://127.0.0.1:8000/api/users/login"
        
        if email.isEmpty || pass.isEmpty {
            shouldShowError = true
            alertText = "Rellena todos los campos."
        }else{
            let dictionary: [String: Any] = [
                "email": email,
                "password" : pass
            ]
            
            NetworkHelper.shared.requestProvider(url: url, params: dictionary) { data, response, error in
                if let error = error {
                    self.onError(error: error.localizedDescription)
                } else if let data = data, let response = response as? HTTPURLResponse {
                    if response.statusCode == 200 {
                        self.onSuccess()
                    } else {
                        self.onError(error: error?.localizedDescription ?? "Request Error")
                    }
                }
            }
        }
        
    }
    func goRegister(){
        
    }
    
    func onSuccess() {
        // Navegación al home
        shouldShowHome = true
    }
    
    func onError(error: String) {
        shouldShowError = true
        alertText = error
    }
    
    
}

