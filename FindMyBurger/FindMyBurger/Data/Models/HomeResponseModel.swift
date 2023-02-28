//
//  HomeResponseModel.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 16/2/23.
//

import Foundation
struct HomeResponseModel: Decodable{
    let status: Int?
    let message: String?
    let data: DataHomeResponseModel?
}

struct DataHomeResponseModel: Decodable{
    let id: UUID?
    let name: String?
    let image: String?
    let address: String
    let lattitude: Float?
    let longitude: Float?
    let rate: Float?
}
