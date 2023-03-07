//
//  ProfilePresentationModel.swift
//  FindMyBurger
//
//  Created by Apps2T on 21/2/23.
//

struct ProfilePresentationModel : Identifiable {
    let name: String
    let email: String
    let imageUrl: String
    
    init() {
        name = ""
        email = ""
        imageUrl = ""
    }
    
    init(name: String, email: String, imageUrl: String) {
        self.name = name
        self.email = email
        self.imageUrl = imageUrl
    }
}

