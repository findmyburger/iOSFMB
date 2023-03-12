//
//  HomeViewModel.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 16/2/23.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject{
    
    @Published var searchText: String = ""
    @Published var searchActivated: Bool = false
    @Published var restaurants: [RestaurantPresentationModel] = []
    @Published var restaurantsRecentlyAdded: [RestaurantPresentationModel] = []
    @Published var restaurantsRecommended: [RestaurantPresentationModel] = []
    @Published var shouldShowRestaurants = false
    @Published var alertText: String = ""
    @Published var shouldShowError: Bool = false
    let userDefaults = UserDefaults.standard
    @Published var selectedIndex = 0
    
    
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { timer in
            self.selectedIndex = (self.selectedIndex + 1) % 4
        }
    }
    
    func getRecentlyAdded(){
        let url = "http://127.0.0.1:8000/api/restaurants/getRecentlyAdded"
        
        // petición
        NetworkHelper.shared.requestProvider(url: url, type: .GET) { data, response, error in
            if let error = error {
                self.onError(error: error.localizedDescription)
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 { // esto daria ok
                    self.recentlyAddedOnSuccess(data: data)
                } else { // esto daria error
                    self.onError(error: error?.localizedDescription ?? "Request Error")
                }
            }
        }
    }
    func getAllRestaurants() {
        
        //baseUrl + endpoint
        let url = "http://127.0.0.1:8000/api/restaurants/getAllRestaurants"
        
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
    
    func getRecommended() {
        
        //baseUrl + endpoint
        let url = "http://127.0.0.1:8000/api/restaurants/getRecommended"
        
        // petición
        NetworkHelper.shared.requestProvider(url: url, type: .GET) { data, response, error in
            if let error = error {
                self.onError(error: error.localizedDescription)
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 { // esto daria ok
                    self.recommendedOnSuccess(data: data)
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
            
            //            userDefaults.set(restaurantsNotFiltered, forKey: "restaurants")
            //
            //            let savedRestaurants = userDefaults.array(forKey: "restaurants")
            
            // Recogemos únicamente los que no son nil y además lo convertimos a modelo de vista
            guard let restaurantsNotNil = restaurantsNotFiltered?.data else { return }
            restaurants = restaurantsNotNil.compactMap({ restaurantsNotFiltered in
                return RestaurantPresentationModel(id: restaurantsNotFiltered.id ?? 0, name: restaurantsNotFiltered.name ?? "", image: restaurantsNotFiltered.image ?? "", address: restaurantsNotFiltered.address ?? "", rate: restaurantsNotFiltered.rate ?? 0)
            })
        } catch {
            self.onError(error: error.localizedDescription)
        }
        
    }
    func recommendedOnSuccess(data: Data) {
        do {
            // Convertimos a modelo de Data los datos que nos llegan
            let restaurantsNotFiltered = try JSONDecoder().decode(HomeResponseModel?.self, from: data)
            // Recogemos únicamente los que no son nil y además lo convertimos a modelo de vista
            guard let restaurantsNotNil = restaurantsNotFiltered?.data else { return }
            restaurantsRecommended = restaurantsNotNil.compactMap({ restaurantsNotFiltered in
                return RestaurantPresentationModel(id: restaurantsNotFiltered.id ?? 0, name: restaurantsNotFiltered.name ?? "", image: restaurantsNotFiltered.image ?? "", address: restaurantsNotFiltered.address ?? "", rate: restaurantsNotFiltered.rate ?? 0)
            })
        } catch {
            self.onError(error: error.localizedDescription)
        }
        
    }
    func recentlyAddedOnSuccess(data: Data) {
        do {
            // Convertimos a modelo de Data los datos que nos llegan
            let restaurantsNotFiltered = try JSONDecoder().decode(RecentlyAddedResponseModel?.self, from: data)
            
            
            // Recogemos únicamente los que no son nil y además lo convertimos a modelo de vista
            guard let restaurantsNotNil = restaurantsNotFiltered?.data else { return }
            restaurantsRecentlyAdded = restaurantsNotNil.flatMap({
                $0.compactMap({ restaurantsNotFiltered in
                    return RestaurantPresentationModel(id: restaurantsNotFiltered.id ?? 0, name: restaurantsNotFiltered.name ?? "", image: restaurantsNotFiltered.image ?? "", address: restaurantsNotFiltered.address ?? "", rate: restaurantsNotFiltered.rate ?? 0)
                })
            })
            
        } catch {
            self.onError(error: error.localizedDescription)
        }
        
    }
    
    func onError(error: String) {
        print(error)
    }
    
    
}






