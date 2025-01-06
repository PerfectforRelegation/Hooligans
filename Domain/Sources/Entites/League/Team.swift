
import Foundation

public struct Team: Codable {
    let teamId: String
    let teamName: String
    let teamLogo: String?
    let played: String
    let won: String
    let lost: String
    let drawn: String
    let points: String
    let goalsAgainst: String
    let goalsFor: String
    let goalDifference: String

    enum CodingKeys: String, CodingKey {
        case teamId = "teamid"
        case teamName = "teamname"
        case teamLogo = "team_logo"
        case played
        case won
        case drawn
        case lost
        case points
        case goalsAgainst = "ga"
        case goalsFor = "gf"
        case goalDifference = "gd"
    }
}
