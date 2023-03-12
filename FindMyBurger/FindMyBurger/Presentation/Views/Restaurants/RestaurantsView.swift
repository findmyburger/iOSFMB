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
    @ObservedObject var viewModel = RestaurantsViewModel()
    
    var body: some View {
        VStack {
            
            //Title bar and Restaurant Image
            VStack{
               itemNav
                //Adding Matched Geometry Effect
                imageRestaurant
            }
            .frame(height: getRect().height / 2.7)
            
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
    private var itemNav: some View{
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
                
                //addTofavorite()
                viewModel.favourite.toggle()
                if viewModel.favourite{
                    viewModel.addRestaurantToFavourite(from: item.id)
                }else{
                    viewModel.deleteFavouriteRestaurant(from: item.id)
                }
            } label: {
                Image(viewModel.favourite ? "RedHeart" : "WhiteHeart")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding()
                
            }
        }
        .padding()
    }
    private var imageRestaurant: some View{
        KFImage(URL(string: item.image ))
            .resizable()
            .aspectRatio( contentMode: .fit)
            .matchedGeometryEffect(id: "\(item.id) IMAGE", in: animation)
            .cornerRadius(10)
            .frame(width: 404,height: 242)
    }
    private var dishesOfRestaurant: some View{
        VStack(alignment: .leading , spacing: 15){
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 25) {
                    ForEach(viewModel.dishes) { restaurant in
                        NavigationLink(destination: DetailDishesView(item: restaurant), label: {
                            DishesItemView(item: restaurant)
                        })
                    }
                }
                .padding(.leading)
            })
        }
        
    }
}
struct RestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}


