//
//  CustomTexts.swift
//  FindMyBurger
//
//  Created by Apps2T on 6/2/23.
//

import Foundation
import SwiftUI

struct TitleView: View {
    var title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(.black)
            .font(.system(size: 30, weight: .bold))
            .padding(.top, 20)
    }
    
}
