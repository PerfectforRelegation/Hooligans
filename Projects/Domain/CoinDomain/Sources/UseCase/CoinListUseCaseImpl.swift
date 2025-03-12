import RxSwift
import CoinDomainInterface


public struct CoinListUseCaseImpl: CoinListUseCase {
  private let coinListRepository: CoinListRepository

  init(coinListRepository: CoinListRepository) {
    self.coinListRepository = coinListRepository
  }

  public func getCoinList() -> Observable<[Coin]> {
    return coinListRepository.fetchCoinList()
  }
}
