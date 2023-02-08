//
//  RegisterView.swift
//  FindMyBurger
//  Soy un explotador de niños sirios
//  Created by Apps2T on 6/2/23.
//

import SwiftUI



struct RegisterView: View {
    
    @State var color = Color.black.opacity(0.7)
    @State var gray = Color("Gray")
    
    @ObservedObject var viewModel = RegisterViewModel()
    
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
        ScrollView {
            ZStack {
                Color.white.ignoresSafeArea()
                VStack{
                    Logo2()
                    //TitleView(title: "Registro")
                    
                    Text("Registro")
                        .font(.custom("Khand-Semibold", size: 48))
                        .padding(.bottom,10)
                    
                    VStack{
                        //textFields()
                        TextFields(title: "Nombre", text: name, color: color, gray: gray)
                        
                        TextFields(title: "Email", text: email, color: color, gray: gray)
                        
                        Securefields(title: "Contraseña", text: pass, color: color, gray: gray)
                        
                        Securefields(title: "Repetir contraseña", text: pass2, color: color, gray: gray)
                    }
                    .padding(.bottom,20)
                    .padding(.top,40)
                    
                    registerButton()
                    
                    HStack{
                        goLogin()
                    }
                    .padding(.horizontal,20)
                }
                .padding(.horizontal, 25)
            }
        }
    }
    func goLogin() -> some View {
        Button(action: {
            shouldShowLogin = true
        }){
            Text("Ya tienes una cuenta? ")
                .padding(.top, 25)
                .foregroundColor(.black)
            
            Spacer()
            
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
    
    func registerButton() -> some View {
        Button(action: {
            viewModel.regist(name: name, email: email, pass: pass, pass2: pass2)
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
        .background(
            NavigationLink(destination: LoginView(), isActive: $viewModel.shouldShowLogin) {
                EmptyView()
            }
        )
        .alert("Error al registrarte", isPresented: $shouldShowError, actions: {
            
            Button{
                
            } label: {
                Text("Ok")
            }
        }){
            Text(viewModel.alertText)
        }
    }
//    func textFields() -> some View {
//        
//        TextFields(title: "Nombre", text: name, color: color, gray: gray)
//        
//        TextFields(title: "Email", text: email, color: color, gray: gray)
//        
//        Secureields(title: "Contraseña", text: pass, color: color, gray: gray)
//        
//        Secureields(title: "Repetir contraseña", text: pass2, color: color, gray: gray)
//    }
    
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

