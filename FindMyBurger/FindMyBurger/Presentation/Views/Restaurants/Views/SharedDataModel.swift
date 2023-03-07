//
//  SharedDataModel.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 4/3/23.
//

import Foundation

class SharedDataModel: ObservableObject {
    
    //Detail Product Data
    
    @Published var detailRestaurant: RestaurantPresentationModel?
    @Published var showDetailProduct: Bool = false
    
    
    
}
