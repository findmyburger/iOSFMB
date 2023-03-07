//
//  DetailDishesView.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 5/3/23.
//

import SwiftUI

struct DetailDishesView: View {
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
            Image("H1")
                .resizable()
                .frame(width: 395, height: 243)
                .ignoresSafeArea(.all,edges: .top)
            
            Text("BACON COFEE DELIGHT")
                .padding(.top,10)
                .font(.custom( "Inter-Bold", size: 20))
                
        }
        
        
    }
    private var descriptionCard: some View{
        VStack{
            Text("Ingredientes:")
                .font(.custom("Inter-Bold", size: 22))
                .fontWeight(.bold)
            
            Text("-Doble patty de 125g de Carne-Doble cheddar ahumado -Pepinillos encurtidos- Bacon al Coffee Delight -Mayonesa Burmet. -Brioche de mantequilla")
                .font(.custom("Inter-Regular", size: 20))
                .padding(.top,20)
                .multilineTextAlignment(.center)
                .frame(alignment: .leading)
                .lineLimit(nil)
            
            HStack{
                Text("Precio")
                
                Text("$")
                
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
        DetailDishesView()
    }
}
