//
//  RecentlyAddedView.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 15/2/23.
//

import SwiftUI
import Kingfisher

struct RecentlyAddedView: View {
    var item: RestaurantPresentationModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 15){
                KFImage(URL(string: item.image))
                    .resizable()
                    .frame(width: 320, height: 200)
                    .cornerRadius(10)
                
                VStack {
                    Spacer()
                    Text(item.name)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
            }
            .padding(.bottom,30)
        }
    }
}

struct RecentlyAddedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
