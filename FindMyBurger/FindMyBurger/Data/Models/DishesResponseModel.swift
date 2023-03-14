//
//  DishesResponseModel.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 2/3/23.
//

import Foundation

struct DishesResponseModel: Decodable{
    let status: Int?
    let message: String?
    let data: [DataDishesResponseModel]?
}

struct DataDishesResponseModel: Decodable{
    let id: Int?
    let name: String?
    let image: String?
    let price: Float?
    let ingredients: String?
    let burgerType: String?
    let restaurant_id: Int?
}
