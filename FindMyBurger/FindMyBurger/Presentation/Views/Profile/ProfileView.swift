//
//  ProfileView.swift
//  FindMyBurger
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 0){

            ZStack(){
                CustomTitle(title: "Mi perfil")
                    .padding(.top,20)
                    .padding(.bottom, 15)
                    //.padding(.horizontal, 80)
                HStack(){
                Spacer()
                Image("configuracion")
                     .resizable()
                     .frame(width: 30, height: 30)
                     .opacity(0.5)
                     .padding()
                }
            }
            Image("imgProfile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipShape(Circle())
            
            Text("JuanJo Morales")
                .font(.custom("Inter-Regular", size: 20))
                .padding(.top, 15)
            
            CustomLinearGradient()
                .padding(.top, 15)
                
            VStack(alignment: .leading) {
                HStack(alignment: .top, spacing: 10){
                    Image(systemName: "envelope.fill")
                        .foregroundColor(.gray)
                    Text("Juanjosemr@gmail.com")
                        .font(.custom("Inter-Regular", size: 18))
                }
                .padding(.top, 25)
                
                HStack(alignment: .top, spacing: 10){
                    Image(systemName: "lock.fill")
                        .foregroundColor(.gray)
                    Text("**********")
                        .font(.custom("Inter-Regular", size: 18))
                }
                .padding(.top, 20)
                
            }

            Spacer()
            Spacer()
            
            profileButton()
                .padding(.horizontal, 25)
                .padding(.top,30)
                .padding(.bottom, 20)
            Spacer()
            
        }
        .navigationBarHidden(true)
    }
        
}


func profileButton() -> some View {
    Button(action: {
        //viewModel.regist(name: name, email: email, pass: pass, pass2: pass2)
    }){
        
        Text("Editar perfil")
            .font(.custom("Inter-Regular", size: 20))
            .foregroundColor(.white)
            .padding(.vertical)
            .frame(maxWidth: .infinity)
        
    }
    .padding(.horizontal, 25)
    .background(Color("Amarillo"))
    .cornerRadius(25)
    .background(
//        NavigationLink(destination: LoginView(), isActive: $viewModel.shouldShowLogin) {
//            EmptyView()
//        }
    )
//    .alert("Error al registrarte", isPresented: $viewModel.shouldShowError, actions: {
//
//        Button{
//
//        } label: {
//            Text("Ok")
//        }
//    }){
//        Text(viewModel.alertText)
//    }
}




struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
