//
//  LoginResponseModel.swift
//  FindMyBurger
//
//  Created by Apps2T on 9/2/23.
//

import Foundation

struct LoginResponseModel: Decodable{
    let status: Int?
    let message: String?
    let data: DataLoginResponseModel?
}

struct DataLoginResponseModel: Decodable{
    let userName: String?
    let token: String?
}
