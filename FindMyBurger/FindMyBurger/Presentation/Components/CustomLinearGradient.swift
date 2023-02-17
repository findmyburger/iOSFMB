//
//  CustomLinearGradient.swift
//  FindMyBurger
//
//  Created by Apps2T on 16/2/23.
//

import SwiftUI

struct CustomLinearGradient: View {
    var body: some View {
        Rectangle()
            .fill(LinearGradient(colors: [Color("Gray3"), .white], startPoint: .top, endPoint: .bottom))
            .frame(height: 16)
    }
}
