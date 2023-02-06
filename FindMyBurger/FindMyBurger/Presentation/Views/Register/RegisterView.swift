//
//  RegisterView.swift
//  FindMyBurger
//
//  Created by Apps2T on 6/2/23.
//

import SwiftUI



struct RegisterView: View {
    
    @State var color = Color.black.opacity(0.7)
    @State var gray = Color("Gray")
    @State var email = ""
    @State var name = ""
    @State var pass = ""
    @State var pass2 = ""
    @State var visible = false
    @State private var shouldShowLogin: Bool = false
    @State private var shouldShowHome: Bool = false
    @State private var shouldShowError: Bool = false
    @State var textalert = ""
    @Environment(\.presentationMode)
    var mode: Binding<PresentationMode>
    var body: some View{
        
        ZStack {
            Color.white.ignoresSafeArea()
            VStack{
                Logo2()
                Text("Registro")
                    .font(.custom("Khand-Semibold", size: 48))
                    .padding(.bottom,10)
                    
                
                VStack{
                    TextField("Email", text: self.$email)
                        .foregroundColor(color)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 25).stroke(self.email != "" ? Color("Black") : self.gray,lineWidth: 2))
                        .font(.custom("Inter-VariableFont_slnt,wght", size: 20))
                        
                    
                    TextField("Nombre", text: self.$name)
                        .foregroundColor(color)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 25).stroke(self.email != "" ? Color("Black") : self.gray,lineWidth: 2))
                        .font(.custom("Inter-VariableFont_slnt,wght", size: 20))
                        .padding(.bottom,20)
                        .padding(.top,40)
                }
                
                HStack (spacing: 10){
                    VStack{
                            SecureField("Contraseña", text: self.$pass)
                                .foregroundColor(color)
                                .font(.custom("Inter-VariableFont_slnt,wght", size: 20))
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 25).stroke(self.email != "" ? Color("Black") : self.gray,lineWidth: 2))
                .padding(.top, 20)
                .padding(.bottom,20)
                HStack (spacing: 10){
                    VStack{
                        
                            SecureField("Repetir contraseña", text: self.$pass2)
                                .foregroundColor(color)
                                .font(.custom("Inter-VariableFont_slnt,wght", size: 20))
                    }
 
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 25).stroke(self.email != "" ? Color("Black") : self.gray,lineWidth: 2))
                .padding(.top, 20)
                .padding(.bottom,30)

               
                    
                    Button(action: {
                        
                        
                    }){
                        
                        Text("Registrarse")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 90)
                        
                    }
                    .padding(.horizontal, 25)
                    .background(Color("Amarillo"))
                    .cornerRadius(25)
                    .padding(.top,20)
                    .padding(.bottom,20)
                
             
                HStack{
                    Spacer()
                    //Boton para redirijir a iniciar sesion
                    Button(action: {
                        shouldShowLogin = true
                    }){
                        Text("Ya tienes una cuenta? ")
                            .padding(.top, 25)
                            .foregroundColor(.black)
                        
                        
                        Text("Inicia Sesion")
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                            .padding(.top, 25)
                        
                    }.background(
                        NavigationLink(destination: LoginView(), isActive: $shouldShowLogin) {
                            EmptyView()
                        }
                    )
                }
                .padding(.horizontal,50)
                
                }
            .padding(.horizontal, 25)
            }
        
           
        }
    func onSuccess() {
        shouldShowHome = true
        mode.wrappedValue.dismiss()
    }
    
    func onError(error: String) {
        print(error)
        shouldShowError = true
        textalert = "Error al crear nuevo usuario"

    }
    
        }
        
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

extension RegisterView {
    
    func RegisterButton(title: String) -> some View {
        Button {
            if email.isEmpty || pass.isEmpty || pass2.isEmpty || name.isEmpty{
                shouldShowError = true
                textalert = "Rellena todos los campos"
                
            } else if pass != pass2{
                
                shouldShowError = true
                textalert = "Las contraseñas deben coincidir"
            }
            
            else{
                //register(email: email, pass: pass)
            }
            
        } label: {
            Text(title)
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 50)
                .background(Color("Color"))
                .cornerRadius(10)
                .padding(.top,20)
            
        }
        //realizamos la navegacion hacia el destino que queremos y le pasamos la comprobacion creada en la aprte superior
        .background(
            NavigationLink(destination: HomeView(), isActive: $shouldShowHome) {
                EmptyView()
            }
        )
        .alert("Error al registrarte", isPresented: $shouldShowError, actions: {
            
            Button{
                
            } label: {
                Text("Ok")
            }
        }){
            Text(textalert)
        }
    }
}

