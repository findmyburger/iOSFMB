//
//  RestaurantsView.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 2/3/23.
//

import SwiftUI
import Kingfisher

struct RestaurantsView: View {
    
    
    var item: RestaurantPresentationModel
    @EnvironmentObject var sharedData: SharedDataModel
    var animation: Namespace.ID
    var body: some View {
        
        VStack{
            
            //Title bar and Restaurant Image
            VStack{
                
                HStack{
                    
                    Button{
                        
                        withAnimation(.easeInOut){
                            
                            sharedData.showDetailProduct = false
                        }
                    } label: {
                        
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image("heart")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                }
                .padding()
                //Adding Matched Geometry Effect
                KFImage(URL(string: item.image ))
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .matchedGeometryEffect(id: "\(item.id) IMAGE", in: animation)
                    .padding(.horizontal)
                    .offset(y: -12)
                    .cornerRadius(10)
                    .frame(maxHeight: .infinity)
                
            }
            .frame(height: getRect().height / 2.7)
            
            //Restaurant Details
            ScrollView(.vertical,showsIndicators: false){
                
                VStack(alignment: .leading, spacing: 15){
                    
                    Text(item.name)
                        .font(.custom("Inter-Bold", size: 22))
                    
                    HStack(spacing: 8){
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
                
            }
            .frame(maxWidth: .infinity,maxHeight:.infinity)
            .background(
                Color.white
                //Corner Radius for only Top side
                
                    .clipShape(CustomCorners(corners: [.topLeft,.topRight], radius: 25))
                    .ignoresSafeArea()
                
                
            )
        }
        .background(Color("Gray").ignoresSafeArea())
        
    }
}
struct RestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        //        RestaurantsView(item: HomeViewModel().restaurants[0])
        //            .environmentObject(RestaurantsViewModel())
        
       LandingPage()
    }
}


