//
//  LocationViewModel.swift
//  FindMyBurger
//
//  Created by Apps2T on 3/3/23.
//

import Foundation
import MapKit

class LocationViewModel: NSObject, ObservableObject{
    
    @Published var selectedLocation: String?
    @Published var restaurants: [LocationsPresentationModel] = []
    
    func selectLocation(_ location: String){
        self.selectedLocation = location
    }
    
    func getAllRestaurants(completion: @escaping () -> ()) {
        
        //baseUrl + endpoint
        let url = "http://127.0.0.1:8000/api/restaurants/getAllRestaurants"
        
        // petición
        NetworkHelper.shared.requestProvider(url: url, type: .GET) { data, response, error in
            if let error = error {
                self.onError(error: error.localizedDescription)
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 { // esto daria ok
                    self.onSuccess(data: data) {
                        completion()
                    }
                } else { // esto daria error
                    self.onError(error: error?.localizedDescription ?? "Request Error")
                }
            }
        }
    }
    
    func onSuccess(data: Data, completion: @escaping () -> ()) {
        do {
            let restaurantsNotFiltered = try JSONDecoder().decode(HomeResponseModel?.self, from: data)

            guard let restaurantsNotNil = restaurantsNotFiltered?.data else { return }
            restaurants = restaurantsNotNil.compactMap({ restaurantsNotFiltered in
                return LocationsPresentationModel(id: restaurantsNotFiltered.id ?? 0,name: restaurantsNotFiltered.name ?? "",latitude: restaurantsNotFiltered.latitude ?? 0,longitude: restaurantsNotFiltered.longitude ?? 0)
            })
            completion()
        } catch {
            self.onError(error: error.localizedDescription)
        }
    }
    
    
    
    func onError(error: String) {
        print(error)
    }
}
