//
//  LocationsPresentationModel.swift
//  FindMyBurger
//
//  Created by Apps2T on 3/3/23.
//

import Foundation

struct LocationsPresentationModel: Identifiable {
    
    let id: Int
    let name: String
    let image: String
    let address: String
    let latitude: Float
    let longitude: Float
    let rate: Float
}
