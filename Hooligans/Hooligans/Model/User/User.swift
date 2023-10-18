//
//  User.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/15.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let account: String
    let password: String
    let birth: String
    let phoneNumber: String
    let firstTeam: String?
    let secondTeam: String?
    let thirdTeam: String?
    var betPoint: Int
}

class BoardUser{
    var image: String!
    var name: String!
    var message: String!

    init(image:String,name:String,message:String) {

        self.image = image
        self.name = name
        self.message = message
    }
}
