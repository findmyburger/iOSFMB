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
                    //connectToAPI(dictionary: dictionary, url: url)
                }
               
            }
            
        }
    }
}
