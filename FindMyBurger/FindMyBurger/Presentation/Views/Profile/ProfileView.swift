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
            KFImage(URL(string: viewModel.user.imageUrl))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipShape(Circle())
            
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
        .alert(isPresented: $viewModel.isPresented, content: {
            Alert(title: Text("¿Qué quieres editar?"), message: Text("Elige una opción"),
                  primaryButton: .default(Text("Nombre"),
                                          action: {
                viewModel.editSelectedState = .name
            }),
                  secondaryButton: .default(Text("Contraseña"),
                                            action: {
                viewModel.editSelectedState = .passwords
            }))
            
        })
        .onAppear {
            //viewModel.connectToAPI()
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
        .background(
            NavigationLink(destination: EditProfileView(editSelectedState: viewModel.editSelectedState), isActive: $viewModel.shouldShowEditProfile) {
                EmptyView()
            }
        )
        .alert("Error en el Perfil", isPresented: $viewModel.shouldShowError, actions: {
            
            Button{
                
            } label: {
                Text("Ok")
            }
        }){
            Text(viewModel.alertText)
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
