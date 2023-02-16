//
//  CustomTabBar.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 15/2/23.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab : String
    @Namespace var animation
    var body: some View {
        
        ZStack{

           itemsTabBar
            .padding(.top)
            .background(Color("Gray"))
        }
    }
    
    // MARK: - Accessory Views
    
    private var itemsTabBar: some View{
        
        HStack(spacing: 0 ){
            
            TabBarButton(animation: animation, image: "home",selectedTab: $selectedTab)
            TabBarButton(animation: animation, image: "heart",selectedTab: $selectedTab)
            TabBarButton(animation: animation, image: "mapmarker",selectedTab: $selectedTab)
            TabBarButton(animation: animation, image: "person",selectedTab: $selectedTab)
        }
    }
    
}
struct TabBarButton: View{
    
    var animation: Namespace.ID
    var image: String
    @Binding var selectedTab: String
    var body: some View{
        
        
        Button(action: {
            
            withAnimation(.spring()){
                selectedTab = image
            }
        }, label: {
            
            VStack(spacing: 8){
                
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                    .foregroundColor(selectedTab == image ? Color("White") :
                                        Color.gray.opacity(0.5))
                
                if selectedTab == image{
                    
                    Circle()
                        .fill(Color("Naranja"))
                        .matchedGeometryEffect(id: "TAB", in: animation)
                        .frame(width: 8,height: 8)
                }
            }
            .frame(maxWidth: .infinity)
        })
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
