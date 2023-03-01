//
//  RecentlyAdded.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 15/2/23.
//

import Foundation
import SwiftUI

struct RecentlyAdded: Identifiable {
    
    var id = UUID().uuidString
    var name: String
    var image: String
     
}
var recentlyAdded_items = [
RecentlyAdded(name: "Porneat", image: "Porneat"),
RecentlyAdded(name: "Vicio", image: "Vicio")
]
