//
//  RestaurantsView.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 2/3/23.
//

import SwiftUI

struct RestaurantsView: View {
    
    @State var selectedCategory : Category = categories.first!
    @State var selectedTab: String = "home"
    @ObservedObject var restaurantData = RestaurantsViewModel()
    var body: some View {
        ScrollView{
            LazyVStack(alignment: .leading,spacing: 15,pinnedViews: [.sectionHeaders], content: {
                //Parallax header
                GeometryReader{ reader -> AnyView in
                    
                    let offset = reader.frame(in: .global).minY
                    if -offset >= 0{
                        DispatchQueue.main.async {
                            self.restaurantData.offset = -offset
                        }
                    }
                    return AnyView (
                        
                        Image("1")
                            .resizable()
                            .aspectRatio( contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: 250 + (offset > 0 ? offset : 0))
                            .cornerRadius(10)
                            .offset( y: (offset > 0 ? -offset : 0))
                    )
                }
                .frame(height: 250)
                //Cards
                Section(header: RestaurantHeaderView()){
                    
                    ScrollView(.horizontal, showsIndicators:  false, content: {
                        HStack(spacing: 15){
                            ForEach(categories){ Category in
                                
                                HStack(spacing: 12){
                                    
                                    Image(Category.image)
                                        .resizable()
                                    
                                        .aspectRatio( contentMode: .fit)
                                        .frame(width: 15, height: 15)
                                        .padding(6)
                                        .background(selectedCategory.id == Category.id ? Color.white : Color.clear)
                                        .clipShape(Circle())
                                    
                                    Text(Category.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(selectedCategory.id == Category.id ? .white: .black)
                                }
                                .padding(.vertical,8)
                                .padding(.horizontal)
                                .background(selectedCategory.id == Category.id ? Color("Naranja") : Color.gray.opacity(0.06))
                                .clipShape(Capsule())
                                .shadow(color: Color.black.opacity(0.05) , radius: 5, x: 5, y: 5)
                                .onTapGesture {
                                    withAnimation(.spring()){
                                        selectedCategory = Category
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    })
                    .padding(.top,20)
//                    ForEach(tabsItems){ tab in
//
//                        VStack(alignment: .leading,spacing: 15, content:{
//
//                            Text(tab.tab)
//                                .font(.title2)
//                                .fontWeight(.bold)
//                                .padding(.bottom)
//                                .padding(.leading)
//
//                            ForEach(tab.restaurants){ Restaurant in
//
//                                DishesCardView(restaurant: Restaurant)
//                            }
//
//                            Divider()
//                                .padding(.top)
//                        })
//                    }
                }
            })
        }
        .overlay(
            
            Color.white
                .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
                .ignoresSafeArea(.all ,edges: .top)
                .opacity(restaurantData.offset > 250 ? 1: 0)
            ,alignment: .top
        )
        .environmentObject(restaurantData)
    }
}

struct RestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView()
    }
}


