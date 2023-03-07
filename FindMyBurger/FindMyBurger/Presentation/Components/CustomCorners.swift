//
//  CustomCorners.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 3/3/23.
//

import Foundation
import SwiftUI

struct CustomCorners: Shape{
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
