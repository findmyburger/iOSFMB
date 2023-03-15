//
//  RestaurantHeaderView.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 6/2/23.
//

import SwiftUI

struct RestaurantHeaderView: View {
    var item: RestaurantPresentationModel
    @ObservedObject var restaurantData = RestaurantsViewModel()
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10){
            
            HStack(spacing: 0){
                Button(action: {}, label: {
                    
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20 , weight: .bold))
                        .frame(width: getSize(), height: getSize())
                        .foregroundColor(Color("Naranja"))
                })
                Text(item.name)
                    .font(.custom("Inter-Bold", size: 22))
                
                Spacer()
                
                Button (action: {}, label: {
                    
                    Image("heart")
                        .resizable()
                        .frame(width: 32,height: 32)
                        .padding(.top)
                })
                .padding(.horizontal,20)
            }
            
            ZStack{
                
                VStack(alignment: .leading,spacing: 10, content: {
                    HStack{
                        Text(item.address)
                            .fontWeight(.semibold)
                        Image("ubication")
 
                    }
                    HStack (spacing: 8){
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .font(.custom("Inter-Regular", size: 18))
                        Text("\(item.rate)".trimmingCharacters(in: ["0"]))
                            .fontWeight(.semibold)
                            .lineLimit(1)
                    }
                    .frame(maxWidth: .infinity , alignment: .leading)
                })
                    
            }
            .padding(.horizontal,20)
            
            .frame(height: 60)
            
            if restaurantData.offset > 250{
                
                Divider()
                
            }
        }
        
        .frame(height: 130)
        .background(Color.white)
        
        
    }
    func getSize()-> CGFloat{
        
        if restaurantData.offset > 200{
            
            let progress = (restaurantData.offset - 200) / 50
            
            if progress <= 1.0 {
                
                return progress * 40
            }
            else{
                return 40
            }
            
        } else {
            
            return 0
        }
    }
    
}


