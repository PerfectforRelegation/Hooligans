
import Foundation

struct Team: Codable {
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    let teamID: String = "0"
=======
    let teamId: String = "0"
>>>>>>> Stashed changes
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
=======
    
    let teamID: String
    let teamName: String
    let played: String
    let won: Int
    let drawn: Int
    let lost: Int
    let ga: Int
    let gd: Int
    let gf: Int
    let points: Int
    let teamLogo: String

//    enum CodingKeys: String, CodingKey {
//        case lost, teamID = "teamid", won, ga, drawn, played, gd, teamLogo = "team_logo", teamName = "teamname", gf, points
//    }
>>>>>>> Stashed changes
=======
    
    let teamID: String
    let teamName: String
    let played: String
    let won: Int
    let drawn: Int
    let lost: Int
    let ga: Int
    let gd: Int
    let gf: Int
    let points: Int
    let teamLogo: String

//    enum CodingKeys: String, CodingKey {
//        case lost, teamID = "teamid", won, ga, drawn, played, gd, teamLogo = "team_logo", teamName = "teamname", gf, points
//    }
>>>>>>> Stashed changes
}
