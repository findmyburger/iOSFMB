//
//  HomeView.swift
//  FindMyBurger
//
//  Created by Apps2T on 6/2/23.
//

import SwiftUI

struct HomeView: View {
    
    init(){
        UITabBar.appearance().isHidden = true
        
    }
    
    @StateObject var sharedData: SharedDataModel = SharedDataModel()
    @State var selectedCategory : Category = categories.first!
    @State var selectedTab: String = "home"
    @State var searchText = ""
    @State private  var  selection = 0
    @Namespace var animation
    var imageNames: [String] = ["1","2","3","4"]
    
    
    var body: some View {
        
        ZStack{
            
            BackgroundColorView()
            tabBarView
                .background(Color.black.opacity(0.03).ignoresSafeArea())
                .overlay(
                    ZStack{
                        //Detail Page
                        if let restaurant = sharedData.detailRestaurant,sharedData.showDetailProduct{
                            
                            RestaurantsView(item: restaurant, animation: animation)
                                .environmentObject(sharedData)
                        }
                    }
                )
        }
    }
    
    //MARK Accesory Views
    private var tabBarView: some View{
        
        VStack(spacing: 0){
            
            TabView(selection: $selectedTab){
                LandingPage()
                    .environmentObject(sharedData)
                    .tag("home")
                
                FavouritesView()
                    .tag("heart")
                //MapView()
                    .tag("mapmarker")
                ProfileView()
                    .tag("person")
                
            }
            
            CustomTabBar(selectedTab: $selectedTab)
        }
        
    }
    
    
}
struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension View{
    
    func getRect()->CGRect{
        return UIScreen.main.bounds
        
    }
    
}
