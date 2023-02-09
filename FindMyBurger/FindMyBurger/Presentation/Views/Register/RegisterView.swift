//
//  RegisterView.swift
//  FindMyBurger
//  Soy un explotador de niños sirios
//  Created by Apps2T on 6/2/23.
//

import SwiftUI



struct RegisterView: View {
    
    
    @ObservedObject var viewModel = RegisterViewModel()
    
    @State var email = ""
    @State var name = ""
    @State var pass = ""
    @State var pass2 = ""
    
    @State private var shouldShowLogin: Bool = false
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View{
        ZStack {
            BackgroundColorView()
            
            VStack(spacing: 10){
                Logo2()
                
                TitleView(title: "Registro")
                    .padding(.bottom, 20)
                
                VStack{
                    TextFields(title: "Nombre", binding: $name, text: name)
                    
                    TextFields(title: "Email", binding: $email, text: email)
                    
                    SecureFields(title: "Contraseña", binding: $pass, text: pass)
                    
                    SecureFields(title: "Repetir contraseña", binding: $pass2, text: pass2)
                }
                
                registerButton()
                
                HStack{
                    goLogin()
                }
                .padding(.horizontal,20)
            }
            
        }
        .padding(.horizontal, 25)
        .navigationBarHidden(true)
        
    }
    func goLogin() -> some View {
        Button(action: {
            shouldShowLogin = true
            dismiss()
        }){
            Text("Ya tienes una cuenta? ")
                .padding(.top, 25)
                .foregroundColor(.black)
            
            Spacer()
            
            Text("Inicia Sesión")
                .fontWeight(.bold)
                .foregroundColor(.orange)
                .padding(.top, 25)
            
        }.background(
            NavigationLink(destination: LoginView(), isActive: $shouldShowLogin) {
                EmptyView()
            }
        )
    }
    
    func registerButton() -> some View {
        Button(action: {
            viewModel.regist(name: name, email: email, pass: pass, pass2: pass2)
        }){
            
            Text("Registrarse")
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .font(.custom("Inter-Regular", size: 20))
            
        }
        .padding(.horizontal, 25)
        .background(Color("Amarillo"))
        .cornerRadius(25)
        .padding(.top,20)
        .padding(.bottom,20)
        .background(
            NavigationLink(destination: LoginView(), isActive: $viewModel.shouldShowLogin) {
                EmptyView()
            }
        )
        .alert("Error al registrarte", isPresented: $viewModel.shouldShowError, actions: {
            
            Button{
                
            } label: {
                Text("Ok")
            }
        }){
            Text(viewModel.alertText)
        }
    }
    
    func dismiss(){
        mode.wrappedValue.dismiss()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

