//
//  LoginView.swift
//  FindMyBurger
//
//  Created by Apps2T on 6/2/23.
//

import SwiftUI


struct LoginView: View {
    
    @ObservedObject var viewModel = LoginViewModel()
    
    @State var email = ""
    @State var pass = ""
    @State var visible = false
    @State private var shouldShowRegister: Bool = false
    @State private var shouldShowRecoverPass: Bool = false
    @State var shouldShowAlert = false
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView{
            ZStack {
                BackgroundColorView()
                
                VStack(spacing: 10){
                    Logo2()
                    
                    CustomTitle(title: "Iniciar Sesión")
                        .padding(.bottom, 45)
                    
                    TextFields(title: "Email", binding: $email, text: email)
                    
                    SecureFields(title: "Contraseña", binding: $pass, text: pass)
                    
                    HStack{
                        forgotPass()
                        Spacer()
                    }
                    .padding(.horizontal, 7)
                    .padding(.bottom, 60)
                    
                    btnLogin()
                    
                    btnGoogle()
                    
                    goRegist()
                }
                .padding(.bottom, 70)
            }
            .padding(.horizontal, 25)
        }
        .navigationBarHidden(true)
    }
    
    // MARK: - Accessory Views
    
    func forgotPass() -> some View {
        
        Button(action: {
            shouldShowRecoverPass = true
            dismiss()
        }){
            Text("¿Has olvidado tu contraseña?")
                .fontWeight(.bold)
                .foregroundColor(Color("Black"))
        }.background(
            NavigationLink(destination: SendEmailView(), isActive: $shouldShowRecoverPass) {
                EmptyView()
            }
        )
        
    }
    
    func btnLogin() -> some View {
        Button {
            viewModel.login(email: email, pass: pass)
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
        .background(
            NavigationLink(destination: HomeView(), isActive: $viewModel.shouldShowHome) {
                EmptyView()
            }
        )
        .alert("Error al Iniciar Sesión", isPresented: $viewModel.shouldShowError, actions: {
            
            Button{
                
            } label: {
                Text("Cerrar")
            }
        }){
            Text(viewModel.alertText)
        }
    }
    
    func btnGoogle() -> some View {
        Button {
            shouldShowAlert = true
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
        .alert("En este preciso instante estamos en la fase de desarrollo de este apartado en concreto. Disculpe las molestias.", isPresented: $shouldShowAlert){
                Button("Cerrar", role: .cancel, action:{})
            
        }
    }
    
    func goRegist() -> some View {
        
        HStack {
            Text("¿Aún no tienes una cuenta? ")
                .font(.custom("Inter-Regular", size: 18))
                .padding(.top, 25)
                .foregroundColor(.black)
            
            Spacer()
            
            Button(action: {
                shouldShowRegister = true
                dismiss()
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
    func dismiss(){
        mode.wrappedValue.dismiss()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

