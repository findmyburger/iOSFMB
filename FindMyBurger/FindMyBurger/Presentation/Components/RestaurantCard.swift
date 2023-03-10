//
//  RestaurantCard.swift
//  FindMyBurger
//
//  Created by Apps2T on 20/2/23.
//

import Foundation
import SwiftUI
import Kingfisher

struct RestaurantCard: View {
    var item: RestaurantPresentationModel
    var width: CGFloat
    var height: CGFloat
    @State var favourite = false
    @ObservedObject var viewModel = RestaurantsViewModel()

    
    var body: some View {

        VStack(spacing:5) {
            
            Button {
                favourite.toggle()
                if favourite{
                    viewModel.addRestaurantToFavourite()
                }else{
                    viewModel.deleteFavouriteRestaurant()
                }
                
            } label: {
                HStack{
                    Spacer()
                    Image(self.favourite ? "RedHearth" : "WhiteHearth")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                    }
            }
            
            KFImage(URL(string: item.image))
                .resizable()
                .frame(width: width, height: height)
                .cornerRadius(20)
                .padding(.top,6)
            
            HStack{
                VStack{
                    HStack{
                        Text(item.name)
                            .font(.custom("Inter-Bold", size: 20))
                            .frame(alignment: .leading)
                        Spacer()
                    }
                    HStack{
                        Text(item.address)
                            .font(.custom("Inter-Regular", size: 16))
                            .frame(alignment: .leading)
                        Spacer()
                    }
                }
                Spacer()
                    
                Image("Stars")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .padding(.horizontal,4)
                
                Text("\(item.rate)".trimmingCharacters(in: ["0"]))
                    .fontWeight(.semibold)
                    
                
            }
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(25)
        .shadow(color: Color.black.opacity(0.25), radius: 3, x: 5 , y: 7)
    }
}
