//
//  DetailDishesView.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 5/3/23.
//

import SwiftUI
import Kingfisher

struct DetailDishesView: View {
    
    var item: DishesPresentationModel
    var body: some View {
        
        ScrollView(.vertical ,showsIndicators: false){
            
            VStack{
                headerDish
                CustomLinearGradient()
                descriptionCard
                mapsButton
            }
        }
    }
    
    private var headerDish: some View{
        VStack{
           
            KFImage(URL(string: item.image))
                .resizable()
                .frame(width: 395, height: 243)
                .ignoresSafeArea(.all,edges: .top)
            
            Text(item.name)
                .padding(.top,10)
                .font(.custom( "Inter-SemiBold", size: 22))
                
        }
        
        
    }
    private var descriptionCard: some View{
        VStack{
            Text("Ingredientes:")
                .font(.custom("Inter-Bold", size: 22))
                .fontWeight(.bold)
            
            Text(item.ingredients)
                .font(.custom("Inter-Regular", size: 20))
                .padding(.top,20)
                .multilineTextAlignment(.center)
                .frame(alignment: .leading)
                .lineLimit(nil)
            
            HStack{
                Text("Precio")
                
                Text("\(item.price)".trimmingCharacters(in: ["0"]))
                
            }
            .padding(.top)
            
        }
        .frame(width: 300, height: 367)
        .padding(.horizontal,20)
        .background(Color.white)
        .cornerRadius(25)
        .shadow(color: Color.black.opacity(0.30), radius: 5, x: 5 , y: 5)
        .padding(.top,20)
    }
    private var mapsButton: some View{
        Button{
            
        }label: {
            Image("direction")
        }
        .padding(.top , 20)
    }
}

struct DetailDishesView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
