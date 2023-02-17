//
//  SettingViewModel.swift
//  FindMyBurger
//
//  Created by Apps2T on 17/2/23.
//

import Foundation

class SettingViewModel: ObservableObject{
    @Published var shouldShowLogin: Bool = false
    
    let userDefaults = UserDefaults.standard
    @Published var alertText: String = ""
    
    func signOut(){
        let url = "http://127.0.0.1:8000/api/users/signOut"
        
        //connectToAPI(dictionary: dictionary, url: url)
    }
}
