//
//  SearchView.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 22/2/23.
//

import Foundation
import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: ViewModel
    var animation: Namespace.ID
    @Binding var searchActivated: Bool
    @FocusState var startTF: Bool
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            //SearchBar
            searchTextField
                .padding(.horizontal)
                .padding(.bottom)
            
            //Filter Results
            
            filterResults
            Spacer()
        }
        .background(
            Color("Home")
                .ignoresSafeArea()
        )
        .onDisappear {
            searchActivated = false
        }
    }
    
    
    // MARK Accesory Views
    
    @ViewBuilder private var filterResults: some View {
        
        if viewModel.filteredRestaurants.isEmpty {
            
            // No results Found
            
            VStack(spacing:10) {
                Image("nodata")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .aspectRatio( contentMode: .fit)
                    .padding(.top,60)
                
                Text("No se han encontrado resultados con tu busqueda")
                    .font(.custom("Inter-SemiBold", size: 17))
                
                Text("Intenta buscar otra hamburgueseria")
                    .font(.custom("Inter-Regular", size: 15))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,30)
            }
            .padding()
        } else {
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(spacing:25){
                    Text("Se han encontrado \(viewModel.filteredRestaurants.count) restaurantes ")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .foregroundColor(Color("Black"))
                        .padding(.top , 20)
                    ForEach(viewModel.filteredRestaurants) { restaurant in
                        NavigationLink(destination: RestaurantsView(item: restaurant, animation: animation), label: {
                            RecommendedItemsView(item: restaurant)
                        })
                    }
                }
            }
        }
        
    }
    
    private var searchTextField: some View{
        HStack{
            Button{
                withAnimation(.easeInOut){
                    searchActivated = false
                }
            } label: {
                
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundColor(Color.black.opacity(0.7))
            }
            .padding(.horizontal)
            HStack(spacing: 15){
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Buscar Restaurantes", text: $viewModel.searchText)
                    .onChange(of: viewModel.searchText, perform: { newValue in
                        viewModel.filterRestaurants()
                    })
                    .focused($startTF)
                    .font(.custom("Inter-Regular", size: 18))
                    .foregroundColor(Color("Black"))
                    .disableAutocorrection(true)
                
                Button(action: {
                    viewModel.showFilters = true
                }){
                    Image("filtro")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
            .sheet(isPresented: $viewModel.showFilters) {
                //FiltersView()
            }
            .padding(.vertical,12)
            .padding(.horizontal,20)
            .background(
                Capsule()
                    .strokeBorder( Color ("Gris"), lineWidth: 1.5)
                    .background(Color("Gray"))
                    .cornerRadius(25)
            )
            .matchedGeometryEffect(id: "SearchBar", in: animation)
            .padding(.trailing,20)
        }
    }
    
    
}

struct SearchView_Provider: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
