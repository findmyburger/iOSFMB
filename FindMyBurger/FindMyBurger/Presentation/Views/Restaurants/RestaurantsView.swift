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
            
            //Restaurant Details
                
            header
            dishesOfRestaurant
            mapsButton
            
            .frame(maxWidth: .infinity,maxHeight:.infinity)
            .background(
                Color("White")
                //Corner Radius for only Top side
                    .clipShape(CustomCorners(corners: [.topLeft,.topRight], radius: 25))
                    .ignoresSafeArea()
            )
        }
        .navigationBarBackButtonHidden(true)
        .background(Color.white.ignoresSafeArea())
        .onAppear {
            viewModel.getDishesOfRestaurants(id: item.id)
        }
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
            .aspectRatio( contentMode: .fill)
            .matchedGeometryEffect(id: "\(item.id) IMAGE", in: animation)
            .cornerRadius(10)
            .frame(width: 324,height: 262)
            .padding(.bottom)
            .padding(.top,20)
        
    }
    private var dishesOfRestaurant: some View{
            
            ScrollView(.vertical) {
                VStack(spacing: 25) {
                    ForEach(viewModel.dishes) { dish in
                        NavigationLink(destination: DetailDishesView(item: dish), label: {
                            DishesItemView(item: dish)
                        })
                    }
                }
            }
    }
    
    private var mapsButton: some View{
        
        Button(){
            
        } label: {
            
            Image("direction")
                .resizable()
        }
        .padding(.top,20)
        .padding(.bottom,20)
        //.frame(width: 285, height: 40)
    }
    
}
struct RestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}


