//
//  ProfilePresentationModel.swift
//  FindMyBurger
//
//  Created by Apps2T on 21/2/23.
//

struct ProfilePresentationModel : Identifiable {
    let id: Int
    let name: String
    let email: String
    let imageUrl: String
    
    init() {
        id = 0
        name = ""
        email = ""
        imageUrl = ""
    }
    
    init(id: Int, name: String, email: String, imageUrl: String) {
        self.id = id
        self.name = name
        self.email = email
        self.imageUrl = imageUrl
    }
}

