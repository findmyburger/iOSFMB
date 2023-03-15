//
//  FavouriteItemView.swift
//  FindMyBurger
//
//  Created by Apps2T on 2/3/23.
//

import SwiftUI
import Kingfisher

struct FavouriteItemView: View {
    
    var item: RestaurantPresentationModel
    
    var body: some View {
        VStack(spacing: 5) {
            Button(action: {
                //code
            } , label: {
                Image("RedHeart")
                    .resizable()
                    .frame(width: 20,height: 20)
                    .opacity(0.5)
            })
            .font(.footnote)
            .foregroundColor(.red)
            .padding(8)
            .background(Color.orange.opacity(0.1))
            .clipShape(Circle())
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(-10)
            
            KFImage(URL(string: item.image))
                .resizable()
                .frame(width: 280 , height: 220)
                .cornerRadius(20)
            
            Text(item.name)
                .font(.custom("Inter-Regular", size: 13))
                .fontWeight(.bold)
                .padding(.top, 6)
            HStack{
                Text(item.address)
                    .foregroundColor(.black.opacity(0.40))
                    .font(.system(size: 12))
                    .padding(.top, 6)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                Image("Stars")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .padding(.horizontal,4)
                
                Text("\(item.rate)".trimmingCharacters(in: ["0"]))
                    .fontWeight(.semibold)
            }
            
        }
        .padding()
        .frame(width: 320 ,height: 250)
        .background(Color.white)
        .cornerRadius(25)
        .shadow(color: Color.black.opacity(0.25), radius: 3, x: 5 , y: 7)
        .padding(.top , 50)
        .padding(.bottom)
    }
}

