//
//  CustomTexfield.swift
//  FindMyBurger
//
//  Created by Apps2T on 7/2/23.
//

import SwiftUI

struct TextFields: View {
    var title: String
    @State var text: String
    var color: Color
    var gray: Color
    
    var body: some View {
        TextField(title, text: $text)
            .foregroundColor(color)
            .padding()
            .background(RoundedRectangle(cornerRadius: 25).stroke(text != "" ? Color("Black") : gray,lineWidth: 2))
            .font(.custom("Inter-VariableFont_slnt,wght", size: 20))
            .padding(.top, 20)
            .padding(.bottom,20)
    }
}
struct Securefields: View {
    var title: String
    @State var text: String
    var color: Color
    var gray: Color
    
    var body: some View {
        SecureField(title, text: $text)
            .foregroundColor(color)
            .font(.custom("Inter-VariableFont_slnt,wght", size: 20))
            .padding()
            .background(RoundedRectangle(cornerRadius: 25).stroke(text != "" ? Color("Black") : self.gray,lineWidth: 2))
            .padding(.top, 20)
            .padding(.bottom,20)
    }
}


