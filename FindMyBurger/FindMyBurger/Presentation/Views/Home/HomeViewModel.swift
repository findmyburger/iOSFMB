//
//  HomeViewModel.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 16/2/23.
//

import Foundation

class HomeViewModel: ObservableObject{
    
    @Published var shouldShowRestaurant: Bool = false
    @Published var shouldShowError: Bool = false
    @Published var alertText: String = ""
    
    let userDefaults = UserDefaults.standard
    
    func getRestaurants(burgerType: String){
        if burgerType.isEmpty{
            
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
            
            
        } catch {
            self.onError(error: error.localizedDescription)
        }
    }
    func onError(error: String) {
        shouldShowError = true
        alertText = error
    }
}



