//
//  CustomTexfield.swift
//  FindMyBurger
//
//  Created by Apps2T on 7/2/23.
//

import SwiftUI

struct TextFields: View {
    var title: String
    @State var binding: Binding<String>
    var text: String

    
    var body: some View {
        TextField(title, text: binding)
            .font(.custom("Inter-Regular", size: 20))
            .foregroundColor(Color("Black"))
            .frame(height:45)
            .padding(.horizontal, 18)
            .background(Color("Gray"))
            .cornerRadius(25)
            .background(RoundedRectangle(cornerRadius: 25).stroke(text != "" ? Color("TextField_Stroke") : Color("Gray"), lineWidth: 2))
            .padding(.bottom, 10)
    }
}
struct SecureFields: View {
    var title: String
    @State var binding: Binding<String>
    var text: String
    @State var visible = false
    
    var body: some View {
        HStack (spacing: 15){
            
            if self.visible{
                TextField(title, text: binding)
                
            }else{
                SecureField(title, text: binding)
                    .foregroundColor(Color("Black"))
            }
            
            Button(action: {
                self.visible.toggle()
            }) {
                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor((self.visible == true) ? Color.orange : Color.secondary)
            }
            
        }
            
            .font(.custom("Inter-Regular", size: 20))
            .foregroundColor(Color("Black"))
            .frame(height: 45)
            .padding(.horizontal, 18)
            .background(Color("Gray"))
            .cornerRadius(25)
            .background(RoundedRectangle(cornerRadius: 25).stroke(text != "" ? Color("TextField_Stroke") : Color("Gray"), lineWidth: 2))
            .padding(.bottom, 10)
    }
}


