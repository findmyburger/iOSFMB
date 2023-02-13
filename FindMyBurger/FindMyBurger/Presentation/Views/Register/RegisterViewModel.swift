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
            let url = "http://127.0.0.1:8000/api/users/register"
            
            let dictionary: [String: Any] = [
                "name" : name,
                "email": email,
                "password" : pass,
                "password_confirm": pass2
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
        shouldShowLogin = true
        
        do {
            let registerResponse = try JSONDecoder().decode(RegisterResponseModel?.self, from: data)
            
            if registerResponse?.status == 200 {
                shouldShowLogin = true
            }else{
                shouldShowError = true
                alertText = registerResponse?.data?[0] ?? "Campo/s incorrectos."
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



