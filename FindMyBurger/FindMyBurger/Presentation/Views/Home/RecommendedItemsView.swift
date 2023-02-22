//
//  RecommendedItemsView.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 15/2/23.
//

import SwiftUI

struct RecommendedItemsView: View {
    var item: RestaurantPresentationModel
    
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: "flame")
                .font(.footnote)
                .foregroundColor(.red)
                .padding(8)
                .background(Color.orange.opacity(0.1))
                .clipShape(Circle())
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(-10)
            
            Image(item.image)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: getRect().width / 2.5)
                .cornerRadius(20)
                .padding(.top, 6)
            
            
            Text(item.name)
                .fontWeight(.bold)
            
            HStack{
                Text(item.address)
                    .foregroundColor(.black.opacity(0.40))
                    .font(.system(size: 12))
                
                Image("Stars")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .padding(.horizontal,4)
                
//                Text(item.rate)
//                    .fontWeight(.semibold)
                
            }
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(25)
        .shadow(color: Color.black.opacity(0.25), radius: 3, x: 5 , y: 7)
    }
}

struct RecommendedItemsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
