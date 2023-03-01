//
//  RegisterResponseModel.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 10/2/23.
//

import Foundation

struct RegisterResponseModel: Decodable{
    let status: Int?
    let message: String?
    let data: [String]?
}
