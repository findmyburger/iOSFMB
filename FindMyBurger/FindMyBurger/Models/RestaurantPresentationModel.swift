//
//  RestaurantPresentationModel.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 20/2/23.
//

import Foundation

struct RestaurantPresentationModel: Identifiable {
    
    let id: Int
    let name: String
    let image: String
    let address: String
    let rate: Float
}

