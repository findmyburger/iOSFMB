//
//  FiltersViewModel.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 13/3/23.
//

import Foundation
import SwiftUI


class FiltersViewModel: ObservableObject{
    
    @Published  var terneraIsOn = false
    @Published  var chikenIsOn = false
    @Published  var bueyIsOn = false
    @Published  var porkIsOn = false
    @Published  var fishIsOn = false
    @Published  var vegetarianaIsOn = false
    @Published  var veganaIsOn = false
    @Published  var lessThan5 = false
    @Published  var lessThan10 = false
    @Published  var lessThan20 = false
    @Published  var selectedButton: Int? = nil
    
    // MARK: - Public Methods
    
    func filterRestaurants() {

        //baseUrl + endpoint
        let url = "http://127.0.0.1:8000/api/restaurants/filterRestaurants"
        // petición
        NetworkHelper.shared.requestProvider(url: url, type: .POST) { data, response, error in
            if let error = error {
                self.onError(error: error.localizedDescription)
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 { // esto daria ok
                    //self.onSuccess(data: data)
                } else { // esto daria error
                    self.onError(error: error?.localizedDescription ?? "Request Error")
                }
            }
        }
    }
    
    
    func onError(error: String) {
        print(error)
    }
}
