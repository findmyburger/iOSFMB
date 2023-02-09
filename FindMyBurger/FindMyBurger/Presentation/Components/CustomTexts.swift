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
            .font(.custom("Khand-SemiBold", size: 48))
    }
    
}
