//
//  SettingViewModel.swift
//  FindMyBurger
//
//  Created by Apps2T on 17/2/23.
//

import Foundation

class SettingViewModel: ObservableObject{
    
    
    @Published var shouldShowLogin: Bool = false
    @Published var shouldShowError: Bool = false
    
    let userDefaults = UserDefaults.standard
    @Published var alertText: String = ""
    
    func signOut(){
        let url = "http://127.0.0.1:8000/api/users/signOut"
        
        
        connectToAPI(url: url)
    }
    func connectToAPI(url: String){
        NetworkHelper.shared.requestProvider(url: url, type: .DELETE) { data, response, error in
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
            let signOutResponse = try JSONDecoder().decode(SignOutResponseModel?.self, from: data)
            
            if signOutResponse?.status == 200 {
                shouldShowLogin = true
                userDefaults.removeObject(forKey: "token")
                userDefaults.removeObject(forKey: "userName")
            }else{
                shouldShowError = true
                alertText = signOutResponse?.message ?? "Fallo al cerrar sesión."
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
