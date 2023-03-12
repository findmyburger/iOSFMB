//
//  RecentlyAddedView.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 15/2/23.
//

import SwiftUI

struct RecentlyAddedView: View {
    var item: RestaurantPresentationModel
    
    var body: some View {
        ZStack {
            Image(item.image)
                .resizable()
                .scaledToFill()
                .cornerRadius(10)
                .clipped()
            
            VStack {
                Spacer()
                Text(item.name)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
            .padding(.bottom, 20)
            
        }
        
    }
}

struct RecentlyAddedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
