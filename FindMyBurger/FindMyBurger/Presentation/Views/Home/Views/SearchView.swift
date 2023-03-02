//
//  SearchView.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 22/2/23.
//

import Foundation
import SwiftUI

struct SearchView: View{
    var animation: Namespace.ID
    
    @EnvironmentObject var viewModel: HomeViewModel
    @FocusState var startTF: Bool
    
    var body: some View {
        
        VStack(spacing: 0 ){
            
            //SearchBar
            HStack(spacing:20){
                
                //Close Button
                Button{
                    
                    withAnimation{
                        viewModel.searchActivated = false
                    }
                    viewModel.searchText = ""
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(.black.opacity(0.7))
                        .padding(.horizontal,5)
                }
                HStack(spacing: 15){
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Buscar Restaurantes",text: $viewModel.searchText)
                        .focused($startTF)
                        .font(.custom("Inter-Regular", size: 18))
                        .foregroundColor(Color("Black"))
                        .disableAutocorrection(true)
                    Image("filtro")
                        .resizable()
                        .frame(width: 20, height: 20)
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
            .padding([.horizontal])
            .padding(.bottom)
            
            //Filter Results
            
            if let items = viewModel.searchedProducts {
                
                if items.isEmpty {
                    
                    // No results Found
                    
                    VStack(spacing:10){
                        
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
                        VStack(spacing:25){
                            Text("Se han encontrado \(items.count) restaurantes ")
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                                .foregroundColor(Color("Black"))
                                .padding(.top , 20)
                            ForEach(items) { item in
                                ItemSearchView(item: item)
                            }
                        }
                    }
                }
                
            } else {
                
                ProgressView()
                    .padding(.top , 30)
                    .opacity(viewModel.searchText == "" ? 0 : 1)
            }
        }
        .frame(maxWidth: .infinity , maxHeight: .infinity, alignment: .top)
        .background(
        Color("Home")
            .ignoresSafeArea()
        )
        .onAppear{
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                
                startTF = true
            }
        }
    }
}

struct SearchView_Provider: PreviewProvider {
    static var previews: some View {
       HomeView()
    }
}
