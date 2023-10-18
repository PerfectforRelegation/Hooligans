
import Foundation

struct Team: Codable {
    let teamId: String = "0"
    let teamName: String = "0"
    let teamLogo: String? = nil
    let played: String = "0"
    let won: String = "0"
    let lost: String = "0"
    let drawn: String = "0"
    let points: String = "0"
    let goalsAgainst: String = "0"
    let goalsFor: String = "0"
    let goalDifference: String = "0"

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
