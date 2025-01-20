import Foundation


public struct Club: Codable {
  public let clubId: String
  public let clubName: String
  public let clubLogo: String?
  public let currentPrice: String
  public let totalSupply: String
  public let createdAt: String

  public init(clubId: String,
              clubName: String,
              clubLogo: String?,
              currentPrice: String,
              totalSupply: String,
              createdAt: String) {
    self.clubId = clubId
    self.clubName = clubName
    self.clubLogo = clubLogo
    self.currentPrice = currentPrice
    self.totalSupply = totalSupply
    self.createdAt = createdAt
  }

  enum CodingKeys: String, CodingKey {
    case clubId = "club_id"
    case clubName = "club_name"
    case clubLogo = "club_logo"
    case currentPrice = "current_price"
    case totalSupply = "total_supply"
    case createdAt = "created_at"
  }
}
