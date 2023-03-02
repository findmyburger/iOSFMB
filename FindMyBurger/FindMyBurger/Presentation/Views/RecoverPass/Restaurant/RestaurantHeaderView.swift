//
//  RestaurantHeaderView.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 6/2/23.
//

import SwiftUI

struct RestaurantHeaderView: View {
    
    @EnvironmentObject var restaurantData : RestaurantViewModel
    //@Binding var selectedCategory: Category
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10){
            
            HStack(spacing: 0){
                Button(action: {}, label: {
                    
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20 , weight: .bold))
                        .frame(width: getSize(), height: getSize())
                        .foregroundColor(Color("Naranja"))
                })
                Text("Restaurante X")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal,20)
                
                Spacer()
                
                Button (action: {}, label: {
                    
                    Image("heart2")
                        .resizable()
                        .frame(width: 32,height: 32)
                        .padding(.top)
                })
                .padding(.horizontal,20)
            }
            
            ZStack{
                
                VStack(alignment: .leading,spacing: 10, content: {
                    HStack{
                        Text("Av llaod")
                            .fontWeight(.semibold)
                        
                        Image("ubication")
                    }

                    HStack (spacing: 8){
                        
                        Text("4.3")
                        
                        Image(systemName: "star.fill")
                            .font(.caption)
                        
                        
                            
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

struct RestaurantHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantView()
    }
}
