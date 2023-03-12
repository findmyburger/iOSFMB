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
        @Published var searchedProducts: [RestaurantPresentationModel]?
        @Published var showFilters: Bool = false
        @Published var searchText: String = ""
        @Published var disposables = Set<AnyCancellable>()
        var restaurants: [RestaurantPresentationModel]
        
        init(restaurants: [RestaurantPresentationModel]) {
            self.restaurants = restaurants
        }
        
        func filterProductsBySearch() {
            DispatchQueue.global(qos: .userInteractive).async {
                let results = self.restaurants
                    .lazy
                    .filter { item in
                        return item.name.lowercased().contains(self.searchText.lowercased())
                    }

                DispatchQueue.main.async {
                    self.searchedProducts = results.compactMap({ item in
                        return item
                    })
                }
            }
        }

        func handleSearchText() {
            $searchText
                .dropFirst()
                .removeDuplicates()
                .debounce(for: 0.5, scheduler: RunLoop.main)
                .sink(receiveValue: { str in
                    if str != ""{
                        self.filterProductsBySearch()
                    } else {
                        self.searchedProducts = nil
                    }
                })
                .store(in: &disposables)
        }
    }
}
