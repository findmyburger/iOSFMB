//
//  SearchView-ViewModel.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 7/3/23.
//

import SwiftUI
import Combine

extension SearchView {
    class ViewModel: ObservableObject {
        @Published var showFilters: Bool = false
        @Published var searchText: String = ""
        @Published var disposables = Set<AnyCancellable>()
        var restaurants: [RestaurantPresentationModel]
        @Published var filteredRestaurants: [RestaurantPresentationModel]
        
        
        // MARK: - init
        
        init(restaurants: [RestaurantPresentationModel]) {
            self.restaurants = restaurants
            self.filteredRestaurants = restaurants
        }
        
        
        // MARK: - Public Methods
        
        func filterRestaurants() {
            filteredRestaurants = searchText == "" ? restaurants : restaurants.filter({ $0.name.contains(searchText) })
        }
    }
}
