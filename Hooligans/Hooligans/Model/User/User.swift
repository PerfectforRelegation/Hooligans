//
//  User.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/15.
//

import Foundation
import UIKit

struct User: Codable {
    let id: UUID
    let tokenDto: Token
    let name: String
    let account: String
    let password: String
    let birth: String
    let phoneNumber: String
    let firstTeam: String?
    let secondTeam: String?
    let thirdTeam: String?
    let betPoint: Int
}

struct Token: Codable {
    let accessToken: String
    let refreshToken: String
}

struct BoardUser {
    let profile: UIImage
    let name: String
}
