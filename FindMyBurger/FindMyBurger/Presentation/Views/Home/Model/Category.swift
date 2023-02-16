//
//  Category.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 15/2/23.
//

import SwiftUI

struct Category: Identifiable {
    var id: String = UUID().uuidString
    var image: String
    var title: String
}

var categories = [
    
    
    Category(image: "Ternera", title: "Ternera"),
    Category(image: "Pollo", title: "Pollo"),
    Category(image: "Cerdo", title: "Cerdo"),
    Category(image: "Vegetariana", title: "Vegetariana"),
    Category(image: "Vegana", title: "Vegana"),
    Category(image: "Buey", title: "BUEY"),
    Category(image: "Pescado", title: "Pescado"),
    Category(image: "", title: "")
   

]

