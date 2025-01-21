import Foundation
import Domain
import RxSwift


public final class MockTokenRepository: TokenRepository {
  private let clubList = [
    Token(clubId: UUID().uuidString, clubName: "MU", clubLogo: "", currentPrice: "100000", totalSupply: "10_000", createdAt: ""),
    Token(clubId: UUID().uuidString, clubName: "MCI", clubLogo: "", currentPrice: "100897", totalSupply: "10_000", createdAt: ""),
    Token(clubId: UUID().uuidString, clubName: "CHE", clubLogo: "", currentPrice: "100780", totalSupply: "10_000", createdAt: ""),
    Token(clubId: UUID().uuidString, clubName: "LIV", clubLogo: "", currentPrice: "1006786", totalSupply: "10_000", createdAt: ""),
    Token(clubId: UUID().uuidString, clubName: "TOT", clubLogo: "", currentPrice: "10067869", totalSupply: "10_000", createdAt: ""),
    Token(clubId: UUID().uuidString, clubName: "ARS", clubLogo: "", currentPrice: "100787", totalSupply: "10_000", createdAt: ""),
    Token(clubId: UUID().uuidString, clubName: "AVL", clubLogo: "", currentPrice: "100678", totalSupply: "10_000", createdAt: ""),
  ]

  private let exampleData: [Candle] = [
    Candle(clubName: "Unified Club", candleDateTimeUTC: "2025-01-20T00:00:00", candleDateTimeKST: "2025-01-20T09:00:00", openingPrice: 41500000.0, highPrice: 42000000.0, lowPrice: 41000000.0, tradePrice: 41800000.0, timestamp: 1737446400000, candleAccTradePrice: 1200000000.0, candleAccTradeVolume: 28.5, prevClosingPrice: 41700000.0, changePrice: 100000.0, changeRate: 0.0024, convertedTradePrice: 41800.0),
    Candle(clubName: "Unified Club", candleDateTimeUTC: "2025-01-20T01:00:00", candleDateTimeKST: "2025-01-20T10:00:00", openingPrice: 2500000.0, highPrice: 2520000.0, lowPrice: 2480000.0, tradePrice: 2510000.0, timestamp: 1737448200000, candleAccTradePrice: 620000000.0, candleAccTradeVolume: 246.3, prevClosingPrice: 2505000.0, changePrice: 5000.0, changeRate: 0.002, convertedTradePrice: nil),
    Candle(clubName: "Unified Club", candleDateTimeUTC: "2025-01-20T02:00:00", candleDateTimeKST: "2025-01-20T11:00:00", openingPrice: 520.0, highPrice: 530.0, lowPrice: 510.0, tradePrice: 525.0, timestamp: 1737450000000, candleAccTradePrice: 320000000.0, candleAccTradeVolume: 620000.0, prevClosingPrice: 518.0, changePrice: 7.0, changeRate: 0.0135, convertedTradePrice: nil),
    Candle(clubName: "Unified Club", candleDateTimeUTC: "2025-01-20T03:00:00", candleDateTimeKST: "2025-01-20T12:00:00", openingPrice: 41800000.0, highPrice: 42500000.0, lowPrice: 41500000.0, tradePrice: 42400000.0, timestamp: 1737451800000, candleAccTradePrice: 1900000000.0, candleAccTradeVolume: 44.2, prevClosingPrice: 41800000.0, changePrice: 600000.0, changeRate: 0.0144, convertedTradePrice: 42400.0),
    Candle(clubName: "Unified Club", candleDateTimeUTC: "2025-01-20T04:00:00", candleDateTimeKST: "2025-01-20T13:00:00", openingPrice: 2510000.0, highPrice: 2550000.0, lowPrice: 2500000.0, tradePrice: 2530000.0, timestamp: 1737453600000, candleAccTradePrice: 720000000.0, candleAccTradeVolume: 284.1, prevClosingPrice: 2510000.0, changePrice: 20000.0, changeRate: 0.0079, convertedTradePrice: nil),
    Candle(clubName: "Unified Club", candleDateTimeUTC: "2025-01-20T05:00:00", candleDateTimeKST: "2025-01-20T14:00:00", openingPrice: 525.0, highPrice: 535.0, lowPrice: 520.0, tradePrice: 530.0, timestamp: 1737455400000, candleAccTradePrice: 410000000.0, candleAccTradeVolume: 770000.0, prevClosingPrice: 525.0, changePrice: 5.0, changeRate: 0.0095, convertedTradePrice: nil),
    Candle(clubName: "Unified Club", candleDateTimeUTC: "2025-01-20T06:00:00", candleDateTimeKST: "2025-01-20T15:00:00", openingPrice: 42400000.0, highPrice: 42800000.0, lowPrice: 42300000.0, tradePrice: 42600000.0, timestamp: 1737457200000, candleAccTradePrice: 1400000000.0, candleAccTradeVolume: 33.7, prevClosingPrice: 42400000.0, changePrice: 200000.0, changeRate: 0.0047, convertedTradePrice: 42600.0),
    Candle(clubName: "Unified Club", candleDateTimeUTC: "2025-01-20T20:00:00", candleDateTimeKST: "2025-01-21T05:00:00", openingPrice: 2530000.0, highPrice: 2560000.0, lowPrice: 2520000.0, tradePrice: 2550000.0, timestamp: 1737489000000, candleAccTradePrice: 940000000.0, candleAccTradeVolume: 370.6, prevClosingPrice: 2530000.0, changePrice: 20000.0, changeRate: 0.0079, convertedTradePrice: nil),
]


  public init() {

  }

  public func fetchTokenList() -> Observable<[Token]> {
    return Observable<[Token]>.just(clubList)
  }

  public func fetchTokenDetail(of clubId: String) -> Observable<Token> {
    return Observable<Token>.just(clubList[0])
  }

  public func fetchTokenOrderBook(of clubId: String) -> Observable<[OrderBook]> {
    return Observable<[OrderBook]>.just([])
  }

  public func fetchCandleData(of clubId: String) -> Observable<[Candle]> {
    return Observable<[Candle]>.just(exampleData)
  }

}
