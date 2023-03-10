//
//  FavouritesViewModel.swift
//  FindMyBurger
//
//  Created by Apps2T on 2/3/23.
//

import Foundation
import SwiftUI

class FavouritesViewModel: ObservableObject{
    
    @Published var restaurants: [RestaurantPresentationModel] = []
    
    func getFavourites() {
        //baseUrl + endpoint
        let url = "http://127.0.0.1:8000/api/restaurants/favouriteList"
        
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
            let restaurantsNotFiltered = try JSONDecoder().decode(HomeResponseModel?.self, from: data)
            
            // Recogemos únicamente los que no son nil y además lo convertimos a modelo de vista
            guard let restaurantsNotNil = restaurantsNotFiltered?.data else { return }
            restaurants = restaurantsNotNil.compactMap({ restaurantsNotFiltered in
                return RestaurantPresentationModel(id: restaurantsNotFiltered.id ?? 0, name: restaurantsNotFiltered.name ?? "", image: restaurantsNotFiltered.image ?? "", address: restaurantsNotFiltered.address ?? "", rate: restaurantsNotFiltered.rate ?? 0)
            })
        } catch {
            self.onError(error: error.localizedDescription)
        }
        
    }
    
    func onError(error: String) {
        print(error)
    }
    
}
