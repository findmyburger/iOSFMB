//
//  AboutUsView.swift
//  FindMyBurger
//
//  Created by Apps2T on 16/2/23.
//

import SwiftUI

struct AboutUsView: View {
    var body: some View {
        ScrollView{
            ZStack{
                BackgroundColorView()
                VStack(spacing: 10){
                    VStack(spacing: 15){
                        aboutUsHeader()
                        CustomLinearGradient()
                    }
                    VStack(spacing: 20){
                        Text("Esta aplicación es para los amantes de las hamburguesas. ¿Alguna vez has querido ir a comer una buena hamburguesa pero no sabías donde?. ¿No sabías si había una buena hamburguesería cerca de tu zona?. ¿O donde podrías encontrar la mejor hamburguesa calidad-precio?, o simplemente andas buscando probar nuevos sabores,  experiencias y un buen plan para pasar con tus amigos, familia o tu pareja ?")
                            .font(.custom("Inter-Regular", size: 16))
                            .multilineTextAlignment(.center)
                            .lineSpacing(3)
                        
                        Logo4()
                        
                        Text("Find my Burguer es una app en la cual ahorrarás tiempo para encontrar una hamburguesa en específico , en la zona que quieras de madrid , con variedad de precios y podrás ver las reseñas de otros visitantes para ver su experiencia en el restaurante , la atención que te han dado en el restaurante y todos los detalles de la hamburguesa que deseas.")
                            .font(.custom("Inter-Regular", size: 16))
                            .multilineTextAlignment(.center)
                            .lineSpacing(3)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 15)
                }
                
            }
        }
    }
    func aboutUsHeader() -> some View{
        ZStack{
            CustomTitle(title: "SOBRE NOSOTROS")
        }
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
