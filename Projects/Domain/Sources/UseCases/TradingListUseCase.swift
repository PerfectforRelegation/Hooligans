import Foundation
import RxSwift

final class TradingListUseCase {
  private let repository: StockListRepository

  init(repository: StockListRepository) {
    self.repository = repository
  }

  public func getTradingList() -> Observable<[Stock]> {
    return repository.getStockList()
  }
}
