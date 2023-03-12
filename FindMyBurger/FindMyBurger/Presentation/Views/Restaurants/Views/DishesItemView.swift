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
        
        VStack{
            dishCard
        }
        
    }

    private var dishCard: some View{
        VStack{
            
            KFImage(URL(string: item.image))
                .resizable()
                .frame(width: 96, height: 89)
                .cornerRadius(20)
                .padding(.top,6)
            
            HStack{
                
                HStack{
                    Text(item.name)
                        .font(.custom("Inter-Bold", size: 20))
                        .frame(alignment: .leading)
                    Spacer()
                }
            }
            
        }
        
    }
}

struct DishesItemView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
