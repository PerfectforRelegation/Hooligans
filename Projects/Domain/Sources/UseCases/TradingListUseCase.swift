import Foundation
import RxSwift

final class TradingListUseCase {
  private let repository: ClubListRepository

  init(repository: ClubListRepository) {
    self.repository = repository
  }


//  public func getTradingList() -> Observable<[Coin]> {
//    return repository.getStockList()
//  }
}
