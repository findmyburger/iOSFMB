//
//  ChangePassView.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 14/2/23.
//

import SwiftUI

struct ChangePassView: View {
    @State var pass = ""
    @State var pass2 = ""
    @State var code = ""
    
    var body: some View {
        ZStack{
            BackgroundColorView()
            
            VStack(spacing: 20){
                Logo3()
                
                TextFields(title: "Código", binding: $code, text: code)
                
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
            
        }){
            
            Text("Cambiar la contraseña")
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
            /*NavigationLink(destination: LoginView(), isActive: $viewModel.shouldShowLogin) {
                EmptyView()
            }*/
        )
    }

}
struct ChangePassView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePassView()
    }
}
