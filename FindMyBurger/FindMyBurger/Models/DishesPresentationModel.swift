//
//  DishesPresentationModel.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 1/3/23.
//

import Foundation
import SwiftUI

struct DishesPresentationModel: Identifiable {
    
    let id: Int
    let name: String
    let image: String
    let price: Float
    let ingredients: String
    let burgerType: String
}
