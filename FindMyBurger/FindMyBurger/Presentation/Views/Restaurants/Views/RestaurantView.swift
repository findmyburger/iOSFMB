//
//  RestaurantView.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 3/3/23.
//

import SwiftUI
import Kingfisher
struct RestaurantView: View {
    
    @EnvironmentObject var restaurantsViewModel: RestaurantsViewModel
    var item: RestaurantPresentationModel
    var body: some View {
    
        VStack{
            
            VStack{
                
                //Title bar
                HStack{
                    Button{
                        withAnimation(.easeInOut){
                            
                            restaurantsViewModel.showDetailProduct = false
                        }
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                    Spacer()
                    
                    Button{
                        
                    } label: {
                        Image("hearth")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 22, height: 22)
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                }
                .padding()
                
                //Product Image
                KFImage(URL(string: item.image ))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                    .offset(y: -12)
                    .frame(maxHeight: .infinity)
                
            }
            .frame(height: getRect().height / 2.7)
            
            //Product Details
            
            ScrollView(.vertical, showsIndicators: false){
                
                
                //ProductData
                
                VStack(alignment: .leading, spacing: 15){
                    
                    Text(item.name)
                        .font(.custom("Inter-Bold", size: 22))
                    
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
                }
                .padding([.horizontal, .bottom], 25)
                .padding(.top , 25)
                .frame(maxWidth: .infinity,alignment: .leading)
                
                CustomLinearGradient()
                
            }
            .frame(maxWidth: .infinity, maxHeight:  .infinity)
            .background(Color.white
            
                .clipShape(CustomCorners(corners: [.topLeft,.topRight], radius: 25))
                .ignoresSafeArea()
            )
            
        }
        .background(Color("Gray").ignoresSafeArea())

    }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantView(item: HomeViewModel().restaurants[0])
            .environmentObject(RestaurantsViewModel())
    }
}
