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
    
    @State var selectedCategory : Category = categories.first!
    @State var selectedTab: String = "home"
    @State var searchText = ""
    
    var body: some View {
        
        ZStack{
            
            BackgroundColorView()
            
           tabBarView
        }

    }
    //MARK Accesory Views
    private var tabBarView: some View{
      VStack(spacing: 0){
          
          TabView(selection: $selectedTab){
              LandingPage(selectedCategory: $selectedCategory)
                  .tag("home")
              
             //RestaurantView()
                  .tag("heart")
              //MapView()
                  .tag("mapmarker")
              //ProfileView()
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
