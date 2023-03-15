//
//  ProfileView.swift
//  FindMyBurger
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    
    @ObservedObject var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack(spacing: 0){
            
            ZStack{
                CustomTitle(title: "Mi perfil")
                    .padding(.top,20)
                    .padding(.bottom, 15)
                HStack(){
                    Spacer()
                    Image("configuracion")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .opacity(0.5)
                        .padding()
                }
            }

            if viewModel.user.imageUrl.isEmpty{
                Image(systemName: "person.fill")
                    .font(.system(size: 80))
                    .padding()
                    .foregroundColor(Color(.label))
            }else{
                KFImage(URL(string: viewModel.user.imageUrl))
                    .font(.system(size: 80))
                    .padding()
                    .foregroundColor(Color(.label))
            }
            
            
            Text(viewModel.user.name)
                .font(.custom("Inter-Regular", size: 20))
                .padding(.top, 15)
            
            CustomLinearGradient()
                .padding(.top, 15)
            
            VStack(alignment: .leading) {
                HStack(alignment: .top, spacing: 10){
                    Image(systemName: "envelope.fill")
                        .foregroundColor(.gray)
                    Text(viewModel.user.email)
                        .font(.custom("Inter-Regular", size: 18))
                }
                .padding(.top, 25)
                
                HStack(alignment: .top, spacing: 10){
                    Image(systemName: "lock.fill")
                        .foregroundColor(.gray)
                    Text("********")
                        .font(.custom("Inter-Regular", size: 18))
                }
                .padding(.top, 20)
                
            }
            
            Spacer()
            
            profileButton()
                .padding(.horizontal, 25)
                .padding(.top,30)
                .padding(.bottom, 20)
            
            
        }
        .navigationBarHidden(true)
        .alert("¿Qué quieres editar?", isPresented: $viewModel.isPresented) {
            Button("Nombre", action: {viewModel.editSelectedState = .name
                viewModel.shouldShowEditProfile = true})
            Button("Contraseña", action: {viewModel.editSelectedState = .passwords
                viewModel.shouldShowEditProfile = true})
            Button("Cerrar", role: .cancel, action:{})
        }
        .onAppear {
            viewModel.connectToAPI()
        }
    }
    
    func profileButton() -> some View {
        Button(action: {
            viewModel.isPresented = true
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
        
        .alert("Error en el Perfil", isPresented: $viewModel.shouldShowError, actions: {
            
            Button{
                
            } label: {
                Text("Ok")
            }
        }){
            Text(viewModel.alertText)
        }
        
        .background(
            NavigationLink(destination: EditProfileView(editSelectedState: viewModel.editSelectedState), isActive: $viewModel.shouldShowEditProfile) {
                EmptyView()
            }
        )
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
