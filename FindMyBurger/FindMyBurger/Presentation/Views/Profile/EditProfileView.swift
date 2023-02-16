//
//  editProfile.swift
//  FindMyBurger
//
//  Created by Apps2T on 13/2/23.
//

import SwiftUI

struct EditProfileView: View {
    
    @State var email = ""
    @State var name = ""
    @State var pass = ""
    @State var pass2 = ""
    
    var body: some View {
        VStack(spacing: 0){
            
            ZStack(){
                
                CustomTitle(title: "Editar perfil")
                    .padding(.top,20)
                    .padding(.bottom, 15)
            }
            ZStack(){
                Image("imgProfile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                
                HStack(){
                    Spacer()
                    Spacer()
                    VStack(){
                    Spacer()
                    Image(systemName: "camera.circle.fill")
                            .foregroundColor(.gray)
                            .font(.system(size: 30))
                            //.imageScale(.large)
                    }
                    Spacer()
                }.frame(height: 150)
            }

            
            VStack(spacing: 20) {
                    Spacer()
                
                    //textFields()
                    TextFields(title: "Nombre", text: name)
                    
                    TextFields(title: "Email", text: email)
                    
                    SecureFields(title: "Contraseña", text: pass)
                    
                    SecureFields(title: "Repetir contraseña", text: pass2)
                
                Spacer()
            }
            .padding(.horizontal, 25)
            
            
            Spacer()
            
            editProfileButton()
                .padding(.horizontal, 25)
                .padding(.top,30)
                .padding(.bottom, 20)
            
        }
        .navigationBarHidden(true)
    }
    
}


func editProfileButton() -> some View {
    Button(action: {
        //viewModel.regist(name: name, email: email, pass: pass, pass2: pass2)
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




struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
