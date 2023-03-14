//
//  DishesItemView.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 12/3/23.
//

import SwiftUI
import Kingfisher

struct DishesItemView: View {
    
    var item: DishesPresentationModel
    var body: some View {
        
        
        dishCard
        
        
    }
    
    private var dishCard: some View{
        HStack{
            
            KFImage(URL(string: item.image))
                .resizable()
                .frame(width: 96, height: 89)
                .cornerRadius(20)
                .padding(.top,6)
                .padding(.horizontal,20)
                .padding(.bottom,6)
            
            Text(item.name)
                .font(.custom("Inter-Bold", size: 15))
                .frame(alignment: .leading)
                .foregroundColor(Color.black)
            Spacer()
            
            Text("\(item.price)".trimmingCharacters(in: ["0"]) + "€")
                .foregroundColor(Color.black)
                .padding(.horizontal)
        }
        .background(Color.white)
        .cornerRadius(20)
        .frame(width: 331, height: 89)
        .padding(.top,10)
        .padding(.horizontal)
        .shadow(color: Color.black.opacity(0.25), radius: 3, x: 5 , y: 7)
    }
}

struct DishesItemView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
