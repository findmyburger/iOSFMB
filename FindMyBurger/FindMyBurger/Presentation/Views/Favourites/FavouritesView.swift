//
//  FavouritesView.swift
//  FindMyBurger
//
//  Created by Apps2T on 20/2/23.
//

import SwiftUI

struct FavouritesView: View {
    var body: some View {
        ZStack{
            BackgroundColorView()
            VStack{
                CustomTitle(title: "Favoritos")
                
                ScrollView{
                    ForEach(recomendado_items){ item in
                        
                        RestaurantCard(item: item, width: 327, height: 275)
                            .padding(40)
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
