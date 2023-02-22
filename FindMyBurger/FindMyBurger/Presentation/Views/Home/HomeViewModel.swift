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
    
    func getRecommended (recommended: String){
        
    }
    
    @Published var restaurants: [RestaurantPresentationModel] = []
    @Published var shouldShowRestaurants = false
    
    func getRestaurants() {
        
        //baseUrl + endpoint
        let url = "http://127.0.0.1:8000/api/restaurants/list"
        
        // petición
        NetworkHelper.shared.requestProvider(url: url, type: .GET) { data, response, error in
            if let error = error {
                self.onError(error: error.localizedDescription)
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 { // esto daria ok
                    self.onSuccess(data: data)
                } else { // esto daria error
                    self.onError(error: error?.localizedDescription ?? "Request Error")
                }
            }
        }
    }
    
    func onSuccess(data: Data) {
        do {
            // Convertimos a modelo de Data los datos que nos llegan
            let restaurantsNotFiltered = try JSONDecoder().decode([HomeResponseModel?].self, from: data)
            
            // Recogemos únicamente los que no son nil y además lo convertimos a modelo de vista
            restaurants = restaurantsNotFiltered.compactMap({ restaurantsNotFiltered in
                return RestaurantPresentationModel(name: restaurantsNotFiltered?.data?.name ?? "", image: restaurantsNotFiltered?.data?.image ?? "", address: restaurantsNotFiltered?.data?.address ?? "", rate: restaurantsNotFiltered?.data?.rate ?? 0)
            })
        } catch {
            self.onError(error: error.localizedDescription)
        }
        
    }
    
    func onError(error: String) {
        print(error)
    }
    
}






