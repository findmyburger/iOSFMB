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
        ZStack {
            BackgroundColorView()
            
            VStack(spacing: 0){
                Image("Logo2")
                    .resizable()
                    .frame(width: 115, height: 90)
                    .padding(.bottom, 5)
            
                Text("LOGIN")
                    .font(.custom("Khand-Semibold", size: 48))
                    .padding(.bottom, 15)
                
                
                TextField("Nombre", text: self.$email)
                    .font(.custom("Inter-VariableFont_slnt,wght", size: 20))
                    .foregroundColor(placeholederColor)
                    .frame(height: 55)
                    .padding(.horizontal, 18)
                    .background(RoundedRectangle(cornerRadius: 25).stroke(self.email != "" ? Color("Black") : strokeLineTF, lineWidth: 2))
                    .padding(.bottom, 15)
                
                
               
                HStack (spacing: 15){
                    
                    //Funcion en la cual se comprueba si es visible o no la contraseña , si es visible se le pasa un texfiel si no se le pasa un securityfield
                    if self.visible{
                        TextField("Password", text: self.$pass)
                        
                    }else{
                        SecureField("Password", text: self.$pass)
                            .foregroundColor(Color("Black"))
                    }
                    
                    Button(action: {
                        self.visible.toggle()
                    }) {
                        Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor((self.visible == true) ? Color.orange : Color.secondary)
                    }
                    
                }
                    
                    .font(.custom("Inter-VariableFont_slnt,wght", size: 20))
                    .foregroundColor(placeholederColor)
                    .frame(height: 55)
                    .padding(.horizontal, 18)
                    .background(RoundedRectangle(cornerRadius: 25).stroke(self.pass != "" ? Color("Black") : strokeLineTF, lineWidth: 2))
                    .padding(.bottom, 15)
                
                HStack{
                    Button(action: {
                        // TODO: -
                    }){
                        Text("Has olvidado tu contraseña?")
                            .fontWeight(.bold)
                            .foregroundColor(placeholederColor)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 18)
                .padding(.bottom, 45)
                
                
                Button {
                    // TODO: - Login
                } label: {
                    HStack {
                        Text("Iniciar Sesion")
                            .foregroundColor(.white)
                            .padding(.vertical)
                    }
                    .padding(.horizontal, 15)
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color("Amarillo"))
                .cornerRadius(25)
                .padding(.bottom, 10)
                
                
                Button {
                    // TODO: - Google Login
                } label: {
                    HStack {
                        Image("google")
                            .resizable()
                            .frame(width: 24, height: 24)
                        
                        Spacer()
                        
                        Text("Iniciar Sesion con Google")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.horizontal, 15)
                }
                .frame(height: 50)
                .background(Color("Gray"))
                .cornerRadius(25)
                .padding(.bottom, 5)

                Button(action: {
                    
                }){
                    HStack {
                        Text("Aun no tienes una cuenta? ")
                            .padding(.top, 25)
                            .foregroundColor(.black)
                            
                        Spacer()
                        
                        Button(action: {
                            shouldShowRegister = true
                        }){
                            Text("Registrate")
                                .fontWeight(.bold)
                                .foregroundColor(.orange)
                                .padding(.top, 25)
                                
                            
                        }.background(
                            NavigationLink(destination: RegisterView(), isActive: $shouldShowRegister) {
                                EmptyView()
                            }
                        )
                        
                       
                    }
                    .padding(.horizontal,15)
                    
                }
            }
            
        }
        .padding(.horizontal, 25)
    }
    
    // MARK: - Accessory Views
    
    var placeholederColor: Color {
        Color.black.opacity(0.7)
    }
    
    var strokeLineTF: Color {
        Color("Gray")
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

