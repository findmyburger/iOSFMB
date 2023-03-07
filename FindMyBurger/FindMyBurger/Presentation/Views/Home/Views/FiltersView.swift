//
//  FiltersView.swift
//  FindMyBurger
//
//  Created by Juan jose Morales on 3/3/23.
//

import SwiftUI

struct FiltersView: View {
    @State private var terneraIsOn = false
    @State private var chikenIsOn = false
    @State private var bueyIsOn = false
    @State private var porkIsOn = false
    @State private var fishIsOn = false
    @State private var vegetarianaIsOn = false
    @State private var veganaIsOn = false
    @State private var lessThan5 = false
    @State private var lessThan10 = false
    @State private var lessThan20 = false
    @State private var selectedButton: Int? = nil
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            
            VStack{
                CustomLinearGradient()
                moneyFilter
                Divider()
                typeBurgerFilter
                Divider()
                ubicationFilter
                filterButton
            }
        }
    }
    
    private var ubicationFilter: some View{
        
        VStack{
            Text("Ubicación")
                .font(.custom("Inter-SemiBold", size: 18))
                .fontWeight(.semibold)
                .padding(.top , 20)
                .padding(.horizontal)
                .frame(maxWidth: .infinity,alignment: .leading)
            
            Toggle(isOn: $lessThan5) {
                Text("Menos de 5km")
                
                    .onChange(of: lessThan5) { newValue in
                        if newValue {
                            lessThan10 = false
                            lessThan20 = false
                        }
                    }
                
            }
            .toggleStyle(SwitchToggleStyle(tint: .orange))
            .padding(.top,20)
            .padding(.horizontal,20)
            
            Toggle(isOn: $lessThan10) {
                Text("Menos de 10km")
                    .onChange(of: lessThan10) { newValue in
                        if newValue {
                            lessThan5 = false
                            lessThan20 = false
                        }
                    }
                
            }
            .toggleStyle(SwitchToggleStyle(tint: .orange))
            .padding(.top,20)
            .padding(.horizontal,20)
            Toggle(isOn: $lessThan20) {
                Text("Menos de 20km")
                    .onChange(of: lessThan20) { newValue in
                        if newValue {
                            lessThan10 = false
                            lessThan5 = false
                        }
                    }
            }
            .toggleStyle(SwitchToggleStyle(tint: .orange))
            .padding(.top,20)
            .padding(.horizontal,20)
        }
        .padding(.bottom,40)
    }
    
    private var filterButton: some View{
        
        VStack{
            
            Button{
                
            }label: {
                
                Image("Filters")
            }
        }
    }
    
    private var typeBurgerFilter: some View{
        
        VStack{
            Text("Tipo de hamburguesa")
                .font(.custom("Inter-SemiBold", size: 18))
                .fontWeight(.semibold)
                .padding(.top , 20)
                .padding(.horizontal)
                .frame(maxWidth: .infinity,alignment: .leading)
            
            Toggle(isOn: $terneraIsOn) {
                Text("Ternera")
                    .onChange(of: terneraIsOn) { newValue in
                        if newValue {
                            chikenIsOn = false
                            porkIsOn = false
                            bueyIsOn = false
                            fishIsOn = false
                            veganaIsOn = false
                            vegetarianaIsOn = false
                            
                        }
                    }
            }
            .toggleStyle(SwitchToggleStyle(tint: .orange))
            .padding(.top,20)
            .padding(.horizontal,20)
            
            Toggle(isOn: $chikenIsOn) {
                Text("Pollo")
                    .onChange(of: chikenIsOn) { newValue in
                        if newValue {
                            terneraIsOn = false
                            porkIsOn = false
                            bueyIsOn = false
                            fishIsOn = false
                            veganaIsOn = false
                            vegetarianaIsOn = false
                            
                        }
                    }
            }
            .toggleStyle(SwitchToggleStyle(tint: .orange))
            .padding(.top,20)
            .padding(.horizontal,20)
            Toggle(isOn: $porkIsOn) {
                Text("Cerdo")
                    .onChange(of: porkIsOn) { newValue in
                        if newValue {
                            terneraIsOn = false
                            chikenIsOn = false
                            bueyIsOn = false
                            fishIsOn = false
                            veganaIsOn = false
                            vegetarianaIsOn = false
                            
                        }
                    }
            }
            .toggleStyle(SwitchToggleStyle(tint: .orange))
            .padding(.top,20)
            .padding(.horizontal,20)
            
            Toggle(isOn: $bueyIsOn) {
                Text("Buey")
                    .onChange(of: bueyIsOn) { newValue in
                        if newValue {
                            terneraIsOn = false
                            chikenIsOn = false
                            porkIsOn = false
                            fishIsOn = false
                            veganaIsOn = false
                            vegetarianaIsOn = false
                            
                        }
                    }
            }
            .toggleStyle(SwitchToggleStyle(tint: .orange))
            .padding(.top,20)
            .padding(.horizontal,20)
            
            Toggle(isOn: $fishIsOn) {
                Text("Pescado")
                    .onChange(of: fishIsOn) { newValue in
                        if newValue {
                            terneraIsOn = false
                            chikenIsOn = false
                            porkIsOn = false
                            bueyIsOn = false
                            veganaIsOn = false
                            vegetarianaIsOn = false
                            
                        }
                    }
            }
            .toggleStyle(SwitchToggleStyle(tint: .orange))
            .padding(.top,20)
            .padding(.horizontal,20)
            
            Toggle(isOn: $veganaIsOn) {
                Text("Vegana")
                    .onChange(of: veganaIsOn) { newValue in
                        if newValue {
                            terneraIsOn = false
                            chikenIsOn = false
                            porkIsOn = false
                            bueyIsOn = false
                            fishIsOn = false
                            vegetarianaIsOn = false
                            
                        }
                    }
            }
            .toggleStyle(SwitchToggleStyle(tint: .orange))
            .padding(.top,20)
            .padding(.horizontal,20)
            
            Toggle(isOn: $vegetarianaIsOn) {
                Text("Vegetariana")
                    .onChange(of: vegetarianaIsOn) { newValue in
                        if newValue {
                            terneraIsOn = false
                            chikenIsOn = false
                            porkIsOn = false
                            bueyIsOn = false
                            fishIsOn = false
                            veganaIsOn = false
                            
                        }
                    }
            }
            .toggleStyle(SwitchToggleStyle(tint: .orange))
            .padding(.top,20)
            .padding(.horizontal,20)
        }
        .padding(.bottom,30)
    }
    
    private var moneyFilter: some View{
        VStack{
            Text("Precio")
                .font(.custom("Inter-SemiBold", size: 18))
                .fontWeight(.semibold)
                .padding(.top , 20)
                .padding(.horizontal)
                .frame(maxWidth: .infinity,alignment: .leading)
            
            HStack(spacing: 30){
                
                Button(action: { self.buttonTapped(1) }){
                    Image("NormalPrice")
                        .opacity(self.selectedButton == 1 ? 1 : 0.5)
                }.disabled(self.selectedButton != nil && self.selectedButton != 1)
                
                Button(action: { self.buttonTapped(2) }){
                    Image("RegularPrice")
                        .opacity(self.selectedButton == 2 ? 1 : 0.5)
                }.disabled(self.selectedButton != nil && self.selectedButton != 2)
                
                Button(action: { self.buttonTapped(3) }){
                    Image("HighPrice")
                        .opacity(self.selectedButton == 3 ? 1 : 0.5)
                }.disabled(self.selectedButton != nil && self.selectedButton != 3)
            }
            .padding(.top,20)
            .padding(.bottom,40)
        }
    }
    
    func buttonTapped(_ buttonNumber: Int) {
           if self.selectedButton == buttonNumber {
               self.selectedButton = nil
           } else {
               self.selectedButton = buttonNumber
           }
       }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView()
    }
}
