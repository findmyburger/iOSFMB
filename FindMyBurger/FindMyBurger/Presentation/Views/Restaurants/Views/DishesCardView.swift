//
//  DishesCardView.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 2/3/23.
//

import SwiftUI
import Kingfisher

struct DishesCardView: View {
    
    var dishes: DishesPresentationModel
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 10, content: {
                
                Text(dishes.name)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(dishes.ingredients)
                    .font(.caption)
                    .lineLimit(3)
                
                Text("\(dishes.price)")
                    .fontWeight(.bold)
            })
            Spacer(minLength: 10)
            
            KFImage(URL(string: dishes.image))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 130)
                .cornerRadius(10)
        }
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(25)
        .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5 , y: 5)
        
    }
}


