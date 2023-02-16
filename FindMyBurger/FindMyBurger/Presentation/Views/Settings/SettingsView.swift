//
//  SettingsView.swift
//  FindMyBurger
//
//  Created by Apps2T on 16/2/23.
//

import SwiftUI

struct SettingsView: View {
    
    @State var shouldShowLogin: Bool = false
    @State var shouldShowAboutUs: Bool = false
    
    var body: some View {
        ZStack{
            BackgroundColorView()
            VStack(spacing: 15){
                
                settingHeader()
               
                Spacer()
                
                btnAboutUs()
                    
                btnSignOut()
                
                contactText()
                
                Spacer()
            }
            .padding(.horizontal, 25)
        }
    }
    func btnAboutUs() -> some View {
        Button {
            shouldShowAboutUs = true
        } label: {
            HStack {
                Text("Sobre Nostros")
                    .foregroundColor(.white)
                    .padding(.vertical)
            }
            .padding(.horizontal, 15)
        }
        .frame(height: 45)
        .font(.custom("Inter-Regular", size: 20))
        .frame(maxWidth: .infinity)
        .background(Color("Amarillo"))
        .cornerRadius(25)
        .padding(.bottom, 10)
        .padding(.top, 40)
        .background(
            NavigationLink(destination: AboutUsView(), isActive: $shouldShowAboutUs) {
                EmptyView()
            }
        )
//        .alert("Error al Cerrar Sesión", isPresented: $viewModel.shouldShowError, actions: {
//
//            Button{
//
//            } label: {
//                Text("Cerrar")
//            }
//        }){
//            Text(viewModel.alertText)
//        }
    }
    func btnSignOut() -> some View {
        Button {
            //viewModel.login(email: email, pass: pass)
        } label: {
            HStack {
                Text("Cerrar Sesión")
                    .foregroundColor(.white)
                    .padding(.vertical)
            }
            .padding(.horizontal, 15)
        }
        .frame(height: 45)
        .font(.custom("Inter-Regular", size: 20))
        .frame(maxWidth: .infinity)
        .background(Color("Amarillo"))
        .cornerRadius(25)
        .padding(.bottom, 10)
        .background(
            NavigationLink(destination: LoginView(), isActive: $shouldShowLogin) {
                EmptyView()
            }
        )
//        .alert("Error al Cerrar Sesión", isPresented: $viewModel.shouldShowError, actions: {
//
//            Button{
//
//            } label: {
//                Text("Cerrar")
//            }
//        }){
//            Text(viewModel.alertText)
//        }
    }
    func contactText() -> some View{
        VStack(spacing: 15){
            Text("CONTACTO")
                .font(.custom("Inter-Regular", size: 24))
            HStack(spacing: 20){
                Text("Findmyburguer@gmail.com")
                    .font(.custom("Inter-Regular", size: 20))
                Image("mensaje")
                    .resizable()
                    .frame(width: 29, height: 19)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
    func settingHeader() -> some View{
        ZStack{
            TitleView(title: "AJUSTES")
            HStack{
                Spacer()
                Image("configuracion")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .opacity(0.5)
                    .padding(.bottom, 5)
            }
        }
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}