import Foundation
import UIKit

public struct User: Codable {
    let id: UUID
    let tokenDto: Token
    let name: String
    let nickname: String
    let account: String
    let password: String
    let birth: String
    let phoneNumber: String
    let favoriteTeam: String
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
