//
//  editProfile.swift
//  FindMyBurger
//
//  Created by Apps2T on 13/2/23.
//

import SwiftUI

enum EditState {
    case name
    case passwords
}

struct EditProfileView: View {
    
    @ObservedObject private var viewModel = EditProfileViewModel()
    

    
    var editSelectedState: EditState = .passwords
    
    var body: some View {
        ZStack {
            BackgroundColorView()
            VStack(spacing: 0) {
                
                CustomTitle(title: "Editar perfil")
                    .padding(.top, 20)
                    .padding(.bottom, 15)
                
                ZStack(alignment: .bottomTrailing) {
                    Image("imgProfile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                    
                    Button {
                        // Action
                    } label: {
                        Image(systemName: "camera.circle.fill")
                            .foregroundColor(.gray)
                            .font(.system(size: 30))
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                }
                
                VStack(spacing: 30) {
                    switch editSelectedState {
                    case .name:
                        TextFields(title: "Nombre", binding: $name, text: name)
                    case .passwords:
                        SecureFields(title: "Contraseña", binding: $pass, text: pass)
                        
                        SecureFields(title: "Nueva Contraseña", binding: $newPass, text: newPass)
                        
                        SecureFields(title: "Repetir contraseña", binding: $newPass2, text: newPass2)
                    }
                }
                .padding(.top, 50)
                .padding(.horizontal, 25)
                
                Spacer()
                
                editProfileButton
                    .padding(.horizontal, 25)
                    .padding(.bottom, 20)
                
            }
        }
        .navigationBarHidden(true)
    }
    
    var editProfileButton: some View {
        Button(
            action: {
                viewModel.editProfile(name: name, pass: pass, newPass: newPass, newPass2: newPass2)
            }){
                
                Text("Actualizar")
                    .font(.custom("Inter-Regular", size: 20))
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                
            }
            .padding(.horizontal, 25)
            .background(Color("Amarillo"))
            .cornerRadius(25)
            .background(
                NavigationLink(destination: ProfileView(), isActive: $viewModel.shouldShowProfile) {
                    EmptyView()
                }
            )
            .alert("Error al actualizar", isPresented: $viewModel.shouldShowError, actions: {
                
                Button{
                    
                } label: {
                    Text("Ok")
                }
            }){
                Text(viewModel.alertText)
            }
    }
}







struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
