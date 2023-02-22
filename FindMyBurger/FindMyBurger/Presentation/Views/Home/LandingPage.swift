//
//  LandingPage.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 15/2/23.
//

import SwiftUI

struct LandingPage: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State var searchText = ""
    @Binding var selectedCategory: Category
    var imageNames: [String] = ["1","2","3","4"]
    
    var body: some View {
        
        ZStack{
            BackgroundColorView()
            
            VStack {
                navBar
                    .padding(.horizontal)
                CustomLinearGradient()
                    .padding(.bottom, 10)
                
                searchView
                
                ScrollView(.vertical, showsIndicators: false,content: {
                    tabView
                        .padding(.top, 10)
                    Categorys
                        .padding(.vertical)
                    Recommended
                    RecentlyAdded
                    .padding(.leading)
                    .padding(.horizontal,10)
                    
                })
            }
            .background(Color.black.opacity(0.03).ignoresSafeArea())
        }
    }
    
    
    // MARK: - Accessory Views
    
    private var searchView: some View {
        HStack{
            TextField("Buscar restaurantes",text: $searchText)
                .frame(height: 50)
                .padding(.leading, 44)
                .foregroundColor(Color("Texto"))
                .background(Color("Gray2"))
                .cornerRadius(20)
        }
        .padding(.horizontal)
        .overlay(
            HStack {
                Image(systemName: "magnifyingglass")
                Spacer()
                Image("filtro")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
                .padding(.horizontal, 32)
                .foregroundColor(.gray)
        )
    }
    
    private var navBar: some View {
        HStack {
            Image("Logo2")
                .resizable()
                .frame(width: 45, height: 35)
            
            Spacer()
            
            Button(action: {
                // TODO: - config action
            } , label: {
                Image("configuracion")
                    .resizable()
                    .frame(width: 20,height: 20)
                    .opacity(0.5)
            })
        }
    }
    
    private var tabView: some View {
        TabView {
            ForEach (imageNames, id:\.self ){ imageNames in
                Image(imageNames)
                    .resizable()
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .frame(height: 250)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 250)
    }
    
    private var Categorys: some View{
        VStack(alignment: .leading , spacing: 15){
            Text("Categorias")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.bottom)
                .foregroundColor(Color("Black"))
            
            ScrollView(.horizontal, showsIndicators:  false, content: {
                
                HStack(spacing: 15){
                    
                    ForEach(categories){ Category in
                        
                        HStack(spacing: 12){
                            
                            Image(Category.image)
                                .resizable()
                            
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 18, height: 18)
                                .padding(6)
                                .background(selectedCategory.id == Category.id ? Color.white : Color.clear)
                                .clipShape(Circle())
                            
                            Text(Category.title)
                                .fontWeight(.bold)
                                .foregroundColor(selectedCategory.id == Category.id ? .white: .black)
                        }
                        .padding(.vertical,12)
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
            
            
            
        }
        
    }
    
    private var Recommended: some View {
        VStack(alignment: .leading , spacing: 15){
            HStack{
                
                Text("Recomendado")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .foregroundColor(Color("Black"))
                
                Spacer()
                
                Button(action: {}, label:{
                    
                    HStack( spacing: 6){
                        
                        Text("Ver todo")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Naranja"))
                            .padding(.horizontal)
                    }
                })
            }
            .padding(.top,10)
            //.padding(.horizontal,10)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                
                HStack (spacing: 25){
                    
                    ForEach(viewModel.restaurants) { item in
                        HStack {
                            
                            RecommendedItemsView(item: item)
                            
                        }
                    }
                }
                .padding(.leading)
            })
        }
    }
    
    private var RecentlyAdded: some View{
        VStack(alignment: .leading , spacing: 15){
            HStack{
                
                Text("Agregado recientemente")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom)
                    .foregroundColor(Color("Black"))
                
                Spacer()
            }
            .padding(.top,10)
            VStack(spacing:15){
                ForEach(recentlyAdded_items){ item in
                    
                    RecentlyAddedView(item: item)
                }
                
            }
        }
    }
    
    var restaurantformat: some View {
        LazyVStack(spacing: 1) {
            ForEach(viewModel.restaurants) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    
                }
                .padding(.horizontal, 10)
                .frame(height: 60)
                .background(Color.white)
                .padding(.horizontal, 20)
            }
        }
    }
    
    
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage(selectedCategory: .constant(Category(image: "Ternera", title: "Burguer")))    }
}
