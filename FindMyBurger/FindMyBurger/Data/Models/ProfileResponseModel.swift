//
//  ProfileResponseModel.swift
//  FindMyBurger
//
//  Created by Apps2T on 20/2/23.
//

import SwiftUI

struct ProfileResponseModel: Decodable {
    
    let status: Int?
    let message: String?
    let data: DataProfileResponseModel?
}

struct DataProfileResponseModel: Decodable{
    let id: Int?
    let name: String?
    let email: String?
    let image: String?
}

