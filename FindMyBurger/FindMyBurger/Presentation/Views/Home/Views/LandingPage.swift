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
    @State var showDetailProduct: Bool = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
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
                        .padding(.vertical)
                    
                    recommended
                    recentlyAdded
                        .padding(.horizontal)
                    
                }
            }
        }
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
                
                viewModel.shouldShowSettings = true
            })
            {
                Image("configuracion")
                    .resizable()
                    .frame(width: 20,height: 20)
                    .opacity(0.5)
            }
            .background(
                NavigationLink(destination: SettingsView(), isActive: $viewModel.shouldShowSettings) {
                    EmptyView()
                }
            )
        }
        .padding(.vertical)
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
    
    @ViewBuilder
    private var recentlyAdded: some View{
        VStack(alignment: .leading , spacing: 15){
            HStack{
                Text("Agregado recientemente")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom)
                    .foregroundColor(Color("Black"))
                
                Spacer()
            }
            .padding(.top, 10)
            
            ScrollView(.vertical) {
                VStack(spacing: 25) {
                    ForEach(viewModel.restaurantsRecentlyAdded) { restaurant in
                        NavigationLink(destination: RestaurantsView(item: restaurant, animation: animation), label: {
                            RecentlyAddedView(item: restaurant)
                                .frame(width: 350, height: 240)
                        })
                    }
                }
            }
        }
    }
    func dismiss(){
        mode.wrappedValue.dismiss()
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        
        LandingPage()
    }
}

