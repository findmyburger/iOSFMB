//
//  SendEmailViewModel.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 14/2/23.
//

import Foundation

class SendEmailViewModel: ObservableObject{
    
    @Published var shouldShowChangePass: Bool = false
    @Published var shouldShowError: Bool = false
    
    let userDefaults = UserDefaults.standard

    @Published var alertText: String = ""
    
    func sendEmail(email: String){
        if email.isEmpty {
            shouldShowError = true
            alertText = "Rellena todos los campos."
        }else{
            let url = "http://127.0.0.1:8000/api/users/sendEmail"

            let dictionary: [String: Any] = [
                "email": email
            ]
            //connectToAPI(dictionary: dictionary, url: url)
        }
    }
}

