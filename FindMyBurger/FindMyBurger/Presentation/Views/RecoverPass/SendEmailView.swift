//
//  RecoverPassView.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 14/2/23.
//

import SwiftUI

struct SendEmailView: View {
    
    @State var email = ""
    
    var body: some View {
        ZStack{
            BackgroundColorView()
            
            VStack(spacing: 15){
                Logo3()
                
                TextFields(title: "Email", binding: $email, text: email)
                
                sendEmail()

            }
            .padding(.horizontal,20)
            .padding(.bottom,30)
        }
    }
    func sendEmail() -> some View {
        Button(action: {
            
        }){
            
            Text("Enviar Email")
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
struct SendEmailView_Previews: PreviewProvider {
    static var previews: some View {
        SendEmailView()
    }
}
