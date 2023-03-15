//
//  FiltersViewModel.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 13/3/23.
//

import Foundation
import SwiftUI


class FiltersViewModel: ObservableObject{
    
    @Published var burgerType = ""
    @Published var location = 0
    @Published var price = 0

    
    
    func filterRestaurants() {
        
//        var dictionary: [String:Any]
//
//        if !burgerType.isEmpty {
//            dictionary =
//                [
//                    "burgerType" = burgerType
//                ]
//        }
//        if price != 0{
//            dictionary =
//                [
//                    "price" = price
//                ]
//        }
////        if location != 0 {
////            dictionary =
////                [
////                    "radius" = burgerType
////                ]
////        }
        

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
