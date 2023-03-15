////
////  FiltersView.swift
////  FindMyBurger
////
////  Created by Juan jose Morales on 3/3/23.
////
//
//import SwiftUI
//
//struct FiltersView: View {
//
//    @ObservedObject var viewModel = FiltersViewModel()
//    @State private var selectedButton: Int? = nil
//    
//    enum Prices: Binding<Bool> {
//        case less5 = false
//        case less10 = false
//        case less20 = false
//    }
//    @State private var enumPrices: Prices
//    
//    var body: some View {
//
//        ScrollView(.vertical, showsIndicators: false){
//
//            VStack{
//                CustomLinearGradient()
//                moneyFilter
//                Divider()
//                typeBurgerFilter
//                Divider()
//                ubicationFilter
//                filterButton
//            }
//        }
//    }
//
//    private var ubicationFilter: some View{
//
//        VStack{
//            Text("Ubicación")
//                .font(.custom("Inter-SemiBold", size: 18))
//                .fontWeight(.semibold)
//                .padding(.top , 20)
//                .padding(.horizontal)
//                .frame(maxWidth: .infinity,alignment: .leading)
//
//            Toggle(isOn: enumPrices = .less5) {
//                Text("Menos de 5km")
//
//                    .onChange(of: Prices.less5) { newValue in
//                        viewModel.location = 5
//                    }
//
//            }
//            .toggleStyle(SwitchToggleStyle(tint: .orange))
//            .padding(.top,20)
//            .padding(.horizontal,20)
//
//            Toggle(isOn: $viewModel.lessThan10) {
//                Text("Menos de 10km")
//                    .onChange(of: viewModel.lessThan10) { newValue in
//                        viewModel.location = 10
//                    }
//
//            }
//            .toggleStyle(SwitchToggleStyle(tint: .orange))
//            .padding(.top,20)
//            .padding(.horizontal,20)
//            Toggle(isOn: $viewModel.lessThan20) {
//                Text("Menos de 20km")
//                    .onChange(of: viewModel.lessThan20) { newValue in
//                        viewModel.location = 20
//                    }
//            }
//            .toggleStyle(SwitchToggleStyle(tint: .orange))
//            .padding(.top,20)
//            .padding(.horizontal,20)
//        }
//        .padding(.bottom,40)
//    }
//
//    private var filterButton: some View{
//
//        VStack{
//
//            Button{
//                viewModel.filterRestaurants()
//            }label: {
//                Image("Filters")
//            }
//        }
//    }
//
//    private var typeBurgerFilter: some View{
//
//        VStack{
//            Text("Tipo de hamburguesa")
//                .font(.custom("Inter-SemiBold", size: 18))
//                .fontWeight(.semibold)
//                .padding(.top , 20)
//                .padding(.horizontal)
//                .frame(maxWidth: .infinity,alignment: .leading)
//
//            Toggle(isOn: $viewModel.terneraIsOn) {
//                Text("Ternera")
//                    .onChange(of: viewModel.terneraIsOn) { newValue in
//                        viewModel.burgerType = "Ternera"
//                    }
//            }
//            .toggleStyle(SwitchToggleStyle(tint: .orange))
//            .padding(.top,20)
//            .padding(.horizontal,20)
//
//            Toggle(isOn: $viewModel.chikenIsOn) {
//                Text("Pollo")
//                    .onChange(of: viewModel.chikenIsOn) { newValue in
//                        viewModel.burgerType = "Pollo"
//                    }
//            }
//            .toggleStyle(SwitchToggleStyle(tint: .orange))
//            .padding(.top,20)
//            .padding(.horizontal,20)
//            Toggle(isOn: $viewModel.porkIsOn) {
//                Text("Cerdo")
//                    .onChange(of: viewModel.porkIsOn) { newValue in
//                        viewModel.burgerType = "Cerdo"
//                    }
//            }
//            .toggleStyle(SwitchToggleStyle(tint: .orange))
//            .padding(.top,20)
//            .padding(.horizontal,20)
//
//            Toggle(isOn: $viewModel.bueyIsOn) {
//                Text("Buey")
//                    .onChange(of: viewModel.bueyIsOn) { newValue in
//                        viewModel.burgerType = "Buey"
//                    }
//            }
//            .toggleStyle(SwitchToggleStyle(tint: .orange))
//            .padding(.top,20)
//            .padding(.horizontal,20)
//
//            Toggle(isOn: $viewModel.fishIsOn) {
//                Text("Pescado")
//                    .onChange(of: viewModel.fishIsOn) { newValue in
//                        viewModel.burgerType = "Pescado"
//                    }
//            }
//            .toggleStyle(SwitchToggleStyle(tint: .orange))
//            .padding(.top,20)
//            .padding(.horizontal,20)
//
//            Toggle(isOn: $viewModel.veganaIsOn) {
//                Text("Vegana")
//                    .onChange(of: viewModel.veganaIsOn) { newValue in
//                        viewModel.burgerType = "Vegana"
//                    }
//            }
//            .toggleStyle(SwitchToggleStyle(tint: .orange))
//            .padding(.top,20)
//            .padding(.horizontal,20)
//
//            Toggle(isOn: $viewModel.vegetarianaIsOn) {
//                Text("Vegetariana")
//                    .onChange(of: viewModel.vegetarianaIsOn) { newValue in
//                        viewModel.burgerType = "Vegetariana"
//                    }
//            }
//            .toggleStyle(SwitchToggleStyle(tint: .orange))
//            .padding(.top,20)
//            .padding(.horizontal,20)
//        }
//        .padding(.bottom,30)
//    }
//
//    private var moneyFilter: some View{
//        VStack{
//            Text("Precio")
//                .font(.custom("Inter-SemiBold", size: 18))
//                .fontWeight(.semibold)
//                .padding(.top , 20)
//                .padding(.horizontal)
//                .frame(maxWidth: .infinity,alignment: .leading)
//
//            HStack(spacing: 30){
//
//                Button(
//                    action: {
//                        self.buttonTapped(1)
//                        viewModel.price = 10
//                    }){
//                    Image("NormalPrice")
//                        .opacity(self.selectedButton == 1 ? 1 : 0.5)
//                }.disabled(self.selectedButton != nil && self.selectedButton != 1)
//
//                Button(
//                    action: {
//                        self.buttonTapped(2)
//                        viewModel.price = 15
//                    }){
//                    Image("RegularPrice")
//                        .opacity(self.selectedButton == 2 ? 1 : 0.5)
//                }.disabled(self.selectedButton != nil && self.selectedButton != 2)
//
//                Button(
//                    action: {
//                        self.buttonTapped(3)
//                        viewModel.price = 25
//                    }){
//                    Image("HighPrice")
//                        .opacity(self.selectedButton == 3 ? 1 : 0.5)
//                }.disabled(self.selectedButton != nil && self.selectedButton != 3)
//            }
//            .padding(.top,20)
//            .padding(.bottom,40)
//        }
//    }
//
//    func buttonTapped(_ buttonNumber: Int) {
//           if self.selectedButton == buttonNumber {
//               self.selectedButton = nil
//           } else {
//               self.selectedButton = buttonNumber
//           }
//       }
//}
//
//struct FiltersView_Previews: PreviewProvider {
//    static var previews: some View {
//        FiltersView()
//    }
//}
