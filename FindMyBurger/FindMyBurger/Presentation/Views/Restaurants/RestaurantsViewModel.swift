//
//  RestaurantsViewModel.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 2/3/23.
//

import Foundation
import SwiftUI

class RestaurantsViewModel: ObservableObject{
    
    @Published var offset: CGFloat = 0
    @Published var detailRestaurant: RestaurantPresentationModel?
    @Published var showDetailProduct: Bool = false
    @Published var dishes: [DishesPresentationModel] = []
    
    
    func getRestaurants() {

        //baseUrl + endpoint
        let url = "http://127.0.0.1:8000/api/restaurants/show"
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
    
    func onSuccess(data: Data) {
        do {
            // Convertimos a modelo de Data los datos que nos llegan
            let restaurantsNotFiltered = try JSONDecoder().decode(DishesResponseModel?.self, from: data)
            // Recogemos únicamente los que no son nil y además lo convertimos a modelo de vista
            guard let restaurantsNotNil = restaurantsNotFiltered?.data else { return }
            dishes = restaurantsNotNil.compactMap({ restaurantsNotFiltered in
                return DishesPresentationModel(id: restaurantsNotFiltered.id ?? 0, name: restaurantsNotFiltered.name ?? "", image: restaurantsNotFiltered.image ?? "", price: Float(restaurantsNotFiltered.price ?? 0), ingredients: restaurantsNotFiltered.ingredients ?? "", burgerType: restaurantsNotFiltered.burgerType ?? "")
            })
        } catch {
            self.onError(error: error.localizedDescription)
        }

    }
    func addRestaurantToFavourite() {

        //baseUrl + endpoint
        let url = "http://127.0.0.1:8000/api/users/addRestaurantToFavourite"
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
    func addToFavouriteOnSuccess(data: Data) {
        do {
            // Convertimos a modelo de Data los datos que nos llegan
            let restaurantsNotFiltered = try JSONDecoder().decode(DishesResponseModel?.self, from: data)
            // Recogemos únicamente los que no son nil y además lo convertimos a modelo de vista
            guard let restaurantsNotNil = restaurantsNotFiltered?.data else { return }
            dishes = restaurantsNotNil.compactMap({ restaurantsNotFiltered in
                return DishesPresentationModel(id: restaurantsNotFiltered.id ?? 0, name: restaurantsNotFiltered.name ?? "", image: restaurantsNotFiltered.image ?? "", price: Float(restaurantsNotFiltered.price ?? 0), ingredients: restaurantsNotFiltered.ingredients ?? "", burgerType: restaurantsNotFiltered.burgerType ?? "")
            })
        } catch {
            self.onError(error: error.localizedDescription)
        }

    }
    
    func onError(error: String) {
        print(error)
    }
}
