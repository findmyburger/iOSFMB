//
//  UpdateDataResponseModel.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 14/2/23.
//

import Foundation

struct UpdateDataResponseModel: Decodable{
    let status: Int?
    let message: String?
    let data: [String]?
}
