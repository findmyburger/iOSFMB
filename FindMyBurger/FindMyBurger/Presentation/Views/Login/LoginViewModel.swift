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
    
    let userDefaults = UserDefaults.standard
    
    @Published var alertText: String = ""
    
    func login (email: String, pass: String){
        
        
        if email.isEmpty || pass.isEmpty {
            shouldShowError = true
            alertText = "Rellena todos los campos."
        }else{
            
            let url = "http://127.0.0.1:8000/api/users/login"
            
            let dictionary: [String: Any] = [
                "email": email,
                "password" : pass
            ]
            connectToAPI(dictionary: dictionary, url: url)
            
        }
        
    }
    func connectToAPI(dictionary: [String: Any], url: String){
        NetworkHelper.shared.requestProvider(url: url, params: dictionary) { data, response, error in
            if let error = error {
                self.onError(error: error.localizedDescription)
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    self.onSuccess(data)
                } else {
                    self.onError(error: error?.localizedDescription ?? "Request Error")
                }
            }
        }
    }
    
    func onSuccess(_ data: Data) {
        // Navegación al home
        //shouldShowHome = true
        do {
            let loginResponse = try JSONDecoder().decode(LoginResponseModel?.self, from: data)
            
            if loginResponse?.status == 200 {
                shouldShowHome = true
                
                userDefaults.set(loginResponse?.data?.userName, forKey: "userName")
                userDefaults.set(loginResponse?.data?.token, forKey: "token")
                
            }else{
                shouldShowError = true
                alertText = loginResponse?.message ?? "No se ha encontrado un usuario con esos datos."
            }
            
        } catch {
            self.onError(error: error.localizedDescription)
        }
    }
    
    func onError(error: String) {
        shouldShowError = true
        alertText = error
    }
    
    
}

