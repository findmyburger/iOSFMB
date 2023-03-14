//
//  ChangePassView.swift
//  FindMyBurger
//  JUANJO WARRO.
//  Created by Juan jose Morales on 14/2/23.
//

import SwiftUI

struct ChangePassView: View {
    @ObservedObject var viewModel = ChangePassViewModel()
    
    @State var pass = ""
    @State var pass2 = ""
    @State var code = ""
    
    var body: some View {
        ZStack{
            BackgroundColorView()
            
            VStack(spacing: 15){
                Logo3()
                
                TextFields(title: "Código de Autentificación", binding: $code, text: code)
                
                TextFields(title: "Contraseña", binding: $pass, text: pass)
                
                TextFields(title: "Repetir Contraseña", binding: $pass2, text: pass2)
                
                changePass()
            }
            .padding(.horizontal,20)
            .padding(.bottom,30)
        }
    }
    func changePass() -> some View {
        Button(action: {
            viewModel.changePass(pass: pass, pass2: pass2, code: code)
        }){
            
            Text("Cambiar Contraseña")
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .font(.custom("Inter-Regular", size: 20))
            
        }
        .padding(.horizontal, 25)
        .background(Color("Amarillo"))
        .cornerRadius(25)
        .padding(.top,20)
        .background(
            NavigationLink(destination: LoginView(), isActive: $viewModel.shouldShowLogin) {
                EmptyView()
            }
        )
        .alert("Error al Cambiar la Contraseña", isPresented: $viewModel.shouldShowError, actions: {
            
            Button{
                
            } label: {
                Text("Cerrar")
            }
        }){
            Text(viewModel.alertText)
        }

    }
}

struct ChangePassView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePassView()
    }
}
