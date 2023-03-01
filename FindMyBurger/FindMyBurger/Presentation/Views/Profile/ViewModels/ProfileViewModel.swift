//
//  ProfileViewModel.swift
//  FindMyBurger
//
//  Created by Apps2T on 17/2/23.
//

import SwiftUI
import Kingfisher

class ProfileViewModel: ObservableObject {
    
    @Published var editSelectedState: EditState = .name
    @Published var shouldShowEditProfile: Bool = false
    @Published var shouldShowSettings: Bool = false
    @Published var shouldShowAlert: Bool = false
    @Published var shouldShowError: Bool = false
    @Published var isPresented: Bool = false
    
    @Published var user: ProfilePresentationModel = .init()
    
    let userDefaults = UserDefaults.standard
    @Published var alertText: String = ""

    

    func editName(){
        
    }
    
    func connectToAPI(){
        let url = "http://127.0.0.1:8000/api/users/getData"
        
        NetworkHelper.shared.requestProvider(url: url, type: .GET) { data, response, error in
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
            let profileResponse = try JSONDecoder().decode(ProfileResponseModel?.self, from: data)

            if profileResponse?.status == 200 {
                user = ProfilePresentationModel(name: profileResponse?.data?.name ?? "",
                                                email: profileResponse?.data?.email ?? "",
                                                imageUrl: profileResponse?.data?.image ?? "")
                

            }else{
                shouldShowError = true
                alertText = profileResponse?.message ?? "No se han podido traer los datos."
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


