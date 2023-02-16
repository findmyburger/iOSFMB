//
//  CustomLinearGradient.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 15/2/23.
//

import Foundation
import SwiftUI

struct CustomLinearGradient: View {
    
    var body: some View{
        
        Rectangle()
            .fill(LinearGradient(colors: [Color("Gray3"), .white], startPoint: .top, endPoint: .bottom))
            .frame(height: 16)
            
    }
        
    
}
