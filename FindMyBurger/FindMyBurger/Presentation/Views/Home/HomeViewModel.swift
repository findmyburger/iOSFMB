//
//  HomeViewModel.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 16/2/23.
//

import Foundation
class HomeViewModel: ObservableObject{
    
    @Published var alertText: String = ""
    @Published var shouldShowError: Bool = false
    
    let userDefaults = UserDefaults.standard
    
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
    func getRecommended (recommended: String){
        
        
        
        
    }
    func onSuccess(_ data: Data) {
        // Navegación al home
        //shouldShowHome = true
        do {
            let homeResponse = try JSONDecoder().decode(HomeResponseModel?.self, from: data)
            
            if homeResponse?.status == 200 {
                //shouldShowHome = true
                
               
                
            }else{
                
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
