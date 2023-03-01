//
//  EditProfileViewModel.swift
//  FindMyBurger
//
//  Created by Apps2T on 17/2/23.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    
    @Published var shouldShowEditProfile: Bool = false
    @Published var shouldShowSettings: Bool = false
    @Published var shouldShowError: Bool = false
    @Published var shouldShowProfile : Bool = false
    @State var isPresented: Bool = false
    @Published var shouldShowName: Bool = false
    
    @Published var name = ""
    @Published var pass = ""
    @Published var newPass = ""
    @Published var newPass_confirmation = ""
    

    let userDefaults = UserDefaults.standard
//
    @Published var alertText: String = ""

    func editProfile(){
        //Comprobar si se ha elegido nombre o contraseña y rellenar el dictinary con eso.
        if name.isEmpty || pass.isEmpty || newPass.isEmpty || newPass_confirmation.isEmpty{
            shouldShowError = true
            alertText = "Rellena todos los campos."
            
        }else{
            
        let url = "http://127.0.0.1:8000/api/users/updateData"
        
        let dictionary: [String: Any] = [
            "name": name,
            "password" : pass,
            "newPass": newPass,
            "newPass" : newPass_confirmation
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

        do{
            let editResponse = try JSONDecoder().decode(LoginResponseModel?.self, from: data)

            if editResponse?.status == 200 {
                
                shouldShowProfile = true

            }else{
                shouldShowError = true
                alertText = editResponse?.message ?? "No se pudo actualizar."
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

