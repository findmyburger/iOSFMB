//
//  LoginView.swift
//  FindMyBurger
//
//  Created by Apps2T on 6/2/23.
//

import SwiftUI


struct LoginView: View {
    @State var email = ""
    @State var pass = ""
    @State var visible = false
    @State private var shouldShowRegister: Bool = false
    @State private var shouldShowAgenda: Bool = false
    @State private var shouldShowError: Bool = false
    @State var textalert = ""
    var body: some View {
        ScrollView{
            ZStack {
                BackgroundColorView()
                
                VStack(spacing: 20){
                    Logo2()
                    
                    TitleView(title: "Iniciar Sesión")
                    
                    TextFields(title: "Email", text: email)
                    
                    SecureFields(title: "Contraseña", text: pass)
                    
                    
                    HStack{
                        forgetPass()
                        Spacer()
                    }
                    .padding(.horizontal, 7)
                    .padding(.bottom, 60)
                    
                    
                    btnLogin()
                    
                    
                    btnGoogle()

                    goRegist()
                }
                
            }
            .padding(.horizontal, 25)
        }
    }
    
    // MARK: - Accessory Views

    func forgetPass() -> some View {
        
        Button(action: {
            // goToRecoverPass
        }){
            Text("¿Has olvidado tu contraseña?")
                .fontWeight(.bold)
                .foregroundColor(Color("Black"))
        }
        
    }
    
    func btnLogin() -> some View {
        Button {
            // TODO: - Login
        } label: {
            HStack {
                Text("Iniciar Sesión")
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
    }
    
    func btnGoogle() -> some View {
        Button {
            // TODO: - Google Login
        } label: {
            HStack {
                Image("Google")
                    .resizable()
                    .frame(width: 24, height: 24)
                
                Spacer()
                
                Text("Iniciar Sesión con Google")
                    .foregroundColor(Color("Gris"))
                Spacer()
            }
            .padding(.horizontal, 15)
        }
        .frame(height: 50)
        .font(.custom("Inter-Regular", size: 20))
        .background(Color("Gray"))
        .cornerRadius(25)
        .padding(.bottom, 5)
    }
    
    func goRegist() -> some View {
        Button(action: {
            
        }){
            HStack {
                Text("¿Aún no tienes una cuenta? ")
                    .font(.custom("Inter-Regular", size: 18))
                    .padding(.top, 25)
                    .foregroundColor(.black)
                    
                Spacer()
                
                Button(action: {
                    shouldShowRegister = true
                }){
                    Text("Registrate")
                        .font(.custom("Inter-Bold", size: 18))
                        .foregroundColor(Color("Black"))
                        .padding(.top, 25)
                        
                    
                }.background(
                    NavigationLink(destination: RegisterView(), isActive: $shouldShowRegister) {
                        EmptyView()
                    }
                )
            }
            
        }
    }
    
    func onSuccess() {
        
        shouldShowAgenda = true
    }
    
    func onError(error: String) {
        print(error)
        shouldShowError = true
        textalert = "No existe este usuario"
        
        
    }
}





struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension LoginView {
    
    func loginButton(title: String) -> some View {
        Button {
            if email.isEmpty || pass.isEmpty{
                shouldShowError = true
                textalert = "Fields are empty"
            }else{
                //login(email: email, pass: pass)
            }
            
        } label: {
            Text(title)
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 50)
                .padding(.horizontal, 2)
                .background(Color("Color"))
                .cornerRadius(10)
                .padding(.top,25)
            
        }
        .background(
            NavigationLink(destination: HomeView(), isActive: $shouldShowAgenda) {
                EmptyView()
            }
        )
        .alert("Error al logearse", isPresented: $shouldShowError, actions: {
            
            Button{
                
            } label: {
                Text("Ok")
            }
        }){
            Text(textalert)
        }
    }
}

