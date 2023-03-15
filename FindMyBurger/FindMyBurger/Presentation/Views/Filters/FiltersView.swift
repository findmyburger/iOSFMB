//import SwiftUI

import SwiftUI

struct FiltersView: View {
    
    @ObservedObject var viewModel = FiltersViewModel()
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
            
            Toggle(isOn: $viewModel.lessThan5) {
                Text("Menos de 5km")
                
                    .onChange(of: viewModel.lessThan5) { newValue in
                        if newValue {
                            viewModel.lessThan10 = false
                            viewModel.lessThan20 = false
                        }
                    }
                
            }
            .toggleStyle(SwitchToggleStyle(tint: .orange))
            .padding(.top,20)
            .padding(.horizontal,20)
            
            Toggle(isOn: $viewModel.lessThan10) {
                Text("Menos de 10km")
                    .onChange(of: viewModel.lessThan10) { newValue in
                        if newValue {
                            viewModel.lessThan5 = false
                            viewModel.lessThan20 = false
                        }
                    }
                
            }
            .toggleStyle(SwitchToggleStyle(tint: .orange))
            .padding(.top,20)
            .padding(.horizontal,20)
            Toggle(isOn: $viewModel.lessThan20) {
                Text("Menos de 20km")
                    .onChange(of: viewModel.lessThan20) { newValue in
                        if newValue {
                            viewModel.lessThan10 = false
                            viewModel.lessThan5 = false
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
            
            Toggle(isOn: $viewModel.terneraIsOn) {
                Text("Ternera")
                    .onChange(of: viewModel.terneraIsOn) { newValue in
                        if newValue {
                            viewModel.chikenIsOn = false
                            viewModel.porkIsOn = false
                            viewModel.bueyIsOn = false
                            viewModel.fishIsOn = false
                            viewModel.veganaIsOn = false
                            viewModel.vegetarianaIsOn = false
                            
                        }
                    }
            }
            .toggleStyle(SwitchToggleStyle(tint: .orange))
            .padding(.top,20)
            .padding(.horizontal,20)
            
            Toggle(isOn: $viewModel.chikenIsOn) {
                Text("Pollo")
                    .onChange(of: viewModel.chikenIsOn) { newValue in
                        if newValue {
                            viewModel.terneraIsOn = false
                            viewModel.porkIsOn = false
                            viewModel.bueyIsOn = false
                            viewModel.fishIsOn = false
                            viewModel.veganaIsOn = false
                            viewModel.vegetarianaIsOn = false
                            
                        }
                    }
            }
            .toggleStyle(SwitchToggleStyle(tint: .orange))
            .padding(.top,20)
            .padding(.horizontal,20)
            Toggle(isOn: $viewModel.porkIsOn) {
                Text("Cerdo")
                    .onChange(of: viewModel.porkIsOn) { newValue in
                        if newValue {
                            viewModel.terneraIsOn = false
                            viewModel.chikenIsOn = false
                            viewModel.bueyIsOn = false
                            viewModel.fishIsOn = false
                            viewModel.veganaIsOn = false
                            viewModel.vegetarianaIsOn = false
                            
                        }
                    }
            }
            .toggleStyle(SwitchToggleStyle(tint: .orange))
            .padding(.top,20)
            .padding(.horizontal,20)
            
            Toggle(isOn: $viewModel.bueyIsOn) {
                Text("Buey")
                    .onChange(of: viewModel.bueyIsOn) { newValue in
                        if newValue {
                            viewModel.terneraIsOn = false
                            viewModel.chikenIsOn = false
                            viewModel.porkIsOn = false
                            viewModel.fishIsOn = false
                            viewModel.veganaIsOn = false
                            viewModel.vegetarianaIsOn = false
                            
                        }
                    }
            }
            .toggleStyle(SwitchToggleStyle(tint: .orange))
            .padding(.top,20)
            .padding(.horizontal,20)
            
            Toggle(isOn: $viewModel.fishIsOn) {
                Text("Pescado")
                    .onChange(of: viewModel.fishIsOn) { newValue in
                        if newValue {
                            viewModel.terneraIsOn = false
                            viewModel.chikenIsOn = false
                            viewModel.porkIsOn = false
                            viewModel.bueyIsOn = false
                            viewModel.veganaIsOn = false
                            viewModel.vegetarianaIsOn = false
                            
                        }
                    }
            }
            .toggleStyle(SwitchToggleStyle(tint: .orange))
            .padding(.top,20)
            .padding(.horizontal,20)
            
            Toggle(isOn: $viewModel.veganaIsOn) {
                Text("Vegana")
                    .onChange(of: viewModel.veganaIsOn) { newValue in
                        if newValue {
                            viewModel.terneraIsOn = false
                            viewModel.chikenIsOn = false
                            viewModel.porkIsOn = false
                            viewModel.bueyIsOn = false
                            viewModel.fishIsOn = false
                            viewModel.vegetarianaIsOn = false
                            
                        }
                    }
            }
            .toggleStyle(SwitchToggleStyle(tint: .orange))
            .padding(.top,20)
            .padding(.horizontal,20)
            
            Toggle(isOn: $viewModel.vegetarianaIsOn) {
                Text("Vegetariana")
                    .onChange(of: viewModel.vegetarianaIsOn) { newValue in
                        if newValue {
                            viewModel.terneraIsOn = false
                            viewModel.chikenIsOn = false
                            viewModel.porkIsOn = false
                            viewModel.bueyIsOn = false
                            viewModel.fishIsOn = false
                            viewModel.veganaIsOn = false
                            
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
                        .opacity(selectedButton == 1 ? 1 : 0.5)
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
