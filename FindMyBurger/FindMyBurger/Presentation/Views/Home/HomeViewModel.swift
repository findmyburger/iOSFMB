//
//  HomeViewModel.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 16/2/23.
//

import Foundation
import SwiftUI
import Combine
class HomeViewModel: ObservableObject{
    
    @Published var searchText: String = ""
    @Published var searchActivated: Bool = false
    @Published var restaurants: [RestaurantPresentationModel] = []
    @Published var shouldShowRestaurants = false
    @Published var alertText: String = ""
    @Published var shouldShowError: Bool = false
    let userDefaults = UserDefaults.standard
    @Published var selectedIndex = 0
    @Published var searchedProducts: [RestaurantPresentationModel]?
    
    var searchCancellable: AnyCancellable?
    
    init(){
        
        searchCancellable = $searchText.removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                
                if str != ""{
                    
                    self.filterProductsBySearch()
                }
                else {
                    self.searchedProducts = nil
                }
            })
    }
    
        func startTimer() {
            Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
                self.selectedIndex = (self.selectedIndex + 1) % 3
            }
        }
    
    func getRecommended (recommended: String){
        
    }

    
    func getRestaurants() {
        
        //baseUrl + endpoint
        let url = "http://127.0.0.1:8000/api/restaurants/list"
        
        // petición
        NetworkHelper.shared.requestProvider(url: url, type: .POST) { data, response, error in
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
            
            //userDefaults.set(restaurantsNotFiltered, forKey: "restaurants")
            
            //let saveRestaurants = userDefaults.array(forKey: "restaurants")
            
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
    
    func filterProductsBySearch(){

        DispatchQueue.global( qos: .userInteractive).async {

            let results = self.restaurants

                .lazy
                .filter{ item in
                    return item.name.lowercased().contains(self.searchText.lowercased())

                }

            DispatchQueue.main.async {
                
                self.searchedProducts = results.compactMap({ item in
                    
                    return item
                    
                })
            }
        }
    }
    
}






