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
    @Namespace var animation
    //@Binding var selectedCategory: Category
    @State var showDetailProduct: Bool = false
    
    // MARK: - Accessory Views
    
    var body: some View {
        ZStack {
            BackgroundColorView()
            
            if !viewModel.searchActivated {
                mainView
            } else {
                SearchView(viewModel: .init(restaurants: viewModel.restaurants),
                           animation: animation,
                           searchActivated: $viewModel.searchActivated)
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            viewModel.getRecommended()
            viewModel.getRecentlyAdded()
            viewModel.getAllRestaurants()
        }
        //.padding(.horizontal)
    }
    
    // MARK: - Accessory Views
    
    private var mainView: some View {
        VStack {
            navBar
                .padding(.horizontal)
            CustomLinearGradient()
                .padding(.bottom, 10)
            
            VStack {
                Group {
                    if viewModel.searchActivated {
                        SearchBar()
                    } else{
                        SearchBar()
                            .matchedGeometryEffect(id: "SearchBar", in: animation)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture{
                    withAnimation(.easeInOut){
                        viewModel.searchActivated = true
                    }
                }
                ScrollView(.vertical, showsIndicators: false){
                    
                    tabView
                        .padding(.top, 10)
                    //Categorys
                        .padding(.vertical)
                    
                    recommended
                    RecentlyAdded
                        .padding(.horizontal)
                    
                }
            }
        }
        //.padding(.horizontal)
        .background(Color.black.opacity(0.03).ignoresSafeArea())
    }
    
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
            
            Button(action:  {
                
                
            })
            {
                Image("configuracion")
                    .resizable()
                    .frame(width: 20,height: 20)
                    .opacity(0.5)
            }
            NavigationLink(destination: SettingsView()) {
                EmptyView()
            }
        }
    }
    
    private var tabView: some View {
        
        TabView(selection: $viewModel.selectedIndex) {
            Image("1")
                .resizable()
                .cornerRadius(10)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .frame(height: 250)
                .tag(0)
            
            Image("2")
                .resizable()
                .cornerRadius(10)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .frame(height: 250)
                .tag(1)
            Image("3")
                .resizable()
                .cornerRadius(10)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .frame(height: 250)
                .tag(2)
            Image("4")
                .resizable()
                .cornerRadius(10)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .frame(height: 250)
                .tag(3)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .frame(height: 250)
        .animation(.easeInOut)
        .onAppear {
            //viewModel.startTimer()
        }
    }
    
    //    private var Categorys: some View{
    //        VStack(alignment: .leading , spacing: 15){
    //            Text("Categorias")
    //                .font(.title)
    //                .fontWeight(.bold)
    //                .padding(.horizontal)
    //                .padding(.bottom)
    //                .foregroundColor(Color("Black"))
    //
    //            ScrollView(.horizontal, showsIndicators:  false, content: {
    //
    //                HStack(spacing: 15){
    //
    //                    ForEach(categories){ Category in
    //
    //                        HStack(spacing: 12){
    //
    //                            Image(Category.image)
    //                                .resizable()
    //                                .aspectRatio( contentMode: .fit)
    //                                .frame(width: 18, height: 18)
    //                                .padding(6)
    //                                .background(selectedCategory.id == Category.id ? Color.white : Color.clear)
    //                                .clipShape(Circle())
    //
    //                            Text(Category.title)
    //                                .fontWeight(.bold)
    //                                .foregroundColor(selectedCategory.id == Category.id ? .white: .black)
    //                        }
    //                        .padding(.vertical,12)
    //                        .padding(.horizontal)
    //                        .background(selectedCategory.id == Category.id ? Color("Naranja") : Color.gray.opacity(0.06))
    //                        .clipShape(Capsule())
    //                        .shadow(color: Color.black.opacity(0.05) , radius: 5, x: 5, y: 5)
    //                        .onTapGesture {
    //                            withAnimation(.spring()){
    //                                selectedCategory = Category
    //                            }
    //                        }
    //                    }
    //                }
    //                .padding(.horizontal)
    //            })
    //        }
    //    }
    @ViewBuilder
    var recommended: some View {
        VStack(alignment: .leading , spacing: 15){
            HStack{
                Text("Recomendado")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .foregroundColor(Color("Black"))
                
            }
            .padding(.top, 10)
            .padding(.horizontal,10)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 25) {
                    ForEach(viewModel.restaurantsRecommended) { restaurant in
                        NavigationLink(destination: RestaurantsView(item: restaurant, animation: animation), label: {
                            RecommendedItemsView(item: restaurant)
                        })
                    }
                }
                .padding(.leading)
            })
        }
    }
    
    @ViewBuilder
    func SearchBar() -> some View{
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
                ForEach(viewModel.restaurantsRecentlyAdded){ item in
                    
                    RecentlyAddedView(item: .init(name: item.name, image: item.image))
                }
                
            }
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        
        LandingPage()
    }
}

//extension View {
//
//    func getRect()->CGRect{
//
//        return UIScreen.main.bounds
//    }
//}
