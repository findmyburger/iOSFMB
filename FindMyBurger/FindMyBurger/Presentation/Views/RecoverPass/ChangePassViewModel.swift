//
//  ChangePassViewModel.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 14/2/23.
//

import Foundation

class ChangePassViewModel: ObservableObject{
    
    @Published var shouldShowLogin: Bool = false
    @Published var shouldShowError: Bool = false
    
    let userDefaults = UserDefaults.standard
    
    @Published var alertText: String = ""
    
    func changePass(pass: String, pass2: String, code: String){
        if pass.isEmpty || pass2.isEmpty {
            shouldShowError = true
            alertText = "Rellena todos los campos."
        }else{
            if pass != pass2 {
                shouldShowError = true
                alertText = "Las contraseñas no coinciden."
            }else{
                let apiCode = userDefaults.string(forKey: "code")
                
                if apiCode != code {
                    shouldShowError = true
                    alertText = "El código no es correcto."
                }else{
                    let url = "http://127.0.0.1:8000/api/users/updateData"
                    
                    let dictionary: [String: Any] = [
                        "password": pass
                    ]
                    connectToAPI(dictionary: dictionary, url: url)
                }
                
            }
            
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
        do {
            let updatePassResponse = try JSONDecoder().decode(UpdateDataResponseModel?.self, from: data)
            
            if updatePassResponse?.status == 200 {
                shouldShowLogin = true
            }else{
                shouldShowError = true
                alertText = updatePassResponse?.message ?? "Algo ha salido mal al cambiar la contraseña."
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
