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
        do {
            let sendEmailResponse = try JSONDecoder().decode(SendEmailResponseModel?.self, from: data)
            
            if sendEmailResponse?.status == 200 {
                shouldShowChangePass = true
                userDefaults.set(sendEmailResponse?.data?.code, forKey: "code")
                userDefaults.set(sendEmailResponse?.data?.email, forKey: "email")
            }else{
                shouldShowError = true
                alertText = sendEmailResponse?.message ?? "Algo ha salido mal al enviar el email."
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

