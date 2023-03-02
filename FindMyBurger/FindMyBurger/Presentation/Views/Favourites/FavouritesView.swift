//
//  FavouritesView.swift
//  FindMyBurger
//
//  Created by Apps2T on 20/2/23.
//

import SwiftUI

struct FavouritesView: View {
    @ObservedObject var viewModel = FavouritesViewModel()
    
    var body: some View {
        ZStack{
            BackgroundColorView()
            VStack{
                CustomTitle(title: "Favoritos")
                
                ScrollView{
                    VStack(spacing:10){
                        
                        if viewModel.restaurants.isEmpty{
                            Image("nodata")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .aspectRatio( contentMode: .fit)
                                .padding(.top,60)
                            
                            Text("No tienes ningún restaurante como favorito")
                                .font(.custom("Inter-SemiBold", size: 17))
                            
                            Text("Añade algun restaurante a tu lista!")
                                .font(.custom("Inter-Regular", size: 15))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal,30)
                        }else{
                            ForEach(viewModel.restaurants){ item in
                                
                                RestaurantCard(item: item, width: 350, height: 300, favourite: true)
                                    .padding(40)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
