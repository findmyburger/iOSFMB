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
    var animation: Namespace.ID
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            
            //Title bar and Restaurant Image
            VStack{
                HStack{
                    Button{
                        withAnimation(.easeInOut){
                            mode.wrappedValue.dismiss()
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
                //                    .padding(.horizontal)
                //  .offset(y: -12)
                    .cornerRadius(10)
                    .frame(width: 404,height: 242)
                
            }
            //.frame(height: getRect().height / 2.7)
            
            //Restaurant Details
            ScrollView(.vertical,showsIndicators: false){
                
                header
                
            }
            .frame(maxWidth: .infinity,maxHeight:.infinity)
            .background(
                Color.white
                //Corner Radius for only Top side
                
                    .clipShape(CustomCorners(corners: [.topLeft,.topRight], radius: 25))
                    .ignoresSafeArea()
                
                
            )
        }
        .navigationBarBackButtonHidden(true)
        .background(Color("Gray").ignoresSafeArea())
        
    }
    
    private var header: some View{
        VStack(alignment: .leading, spacing: 15){
            
            Text(item.name)
                .font(.custom("Inter-Bold", size: 22))
                .padding(.top,20)
                .padding(.horizontal,20)
            
            HStack(spacing: 8){
                Text(item.address)
                    .fontWeight(.semibold)
                    .padding(.horizontal,20)
                    .foregroundColor(Color.gray)
                Image("ubication")
                    .foregroundColor(Color.gray)
                
            }
            HStack (spacing: 8){
                Image(systemName: "star.fill")
                    .font(.caption)
                    .font(.custom("Inter-Regular", size: 18))
                    .foregroundColor(Color.gray)
                Text("\(item.rate)".trimmingCharacters(in: ["0"]))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.gray)
                    .lineLimit(1)
            }
            .padding(.horizontal,20)
            
            CustomLinearGradient()
            
        }
    }
}
struct RestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}


