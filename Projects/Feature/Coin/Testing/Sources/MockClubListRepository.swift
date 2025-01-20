import Foundation
import Domain
import RxSwift


public final class MockClubListRepository: ClubListRepository {
  private let clubList = [
    Club(clubId: UUID().uuidString, clubName: "MU", clubLogo: "", currentPrice: "100000", totalSupply: "10_000", createdAt: ""),
    Club(clubId: UUID().uuidString, clubName: "MCI", clubLogo: "", currentPrice: "100897", totalSupply: "10_000", createdAt: ""),
    Club(clubId: UUID().uuidString, clubName: "CHE", clubLogo: "", currentPrice: "100780", totalSupply: "10_000", createdAt: ""),
    Club(clubId: UUID().uuidString, clubName: "LIV", clubLogo: "", currentPrice: "1006786", totalSupply: "10_000", createdAt: ""),
    Club(clubId: UUID().uuidString, clubName: "TOT", clubLogo: "", currentPrice: "10067869", totalSupply: "10_000", createdAt: ""),
    Club(clubId: UUID().uuidString, clubName: "ARS", clubLogo: "", currentPrice: "100787", totalSupply: "10_000", createdAt: ""),
    Club(clubId: UUID().uuidString, clubName: "AVL", clubLogo: "", currentPrice: "100678", totalSupply: "10_000", createdAt: ""),
  ]

  public init() {

  }

  public func fetchClubList() -> Observable<[Club]> {
    return Observable<[Club]>.just(clubList)
  }
  
}
