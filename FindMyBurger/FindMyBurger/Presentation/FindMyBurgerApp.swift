//
//  FindMyBurgerApp.swift
//  FindMyBurger
//
//  Created by Apps2T on 13/1/23.
//

import SwiftUI

@main
struct FindMyBurgerApp: App {
    @StateObject var locationViewModel = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
