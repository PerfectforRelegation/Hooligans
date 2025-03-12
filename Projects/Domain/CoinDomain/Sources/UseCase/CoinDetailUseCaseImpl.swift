import RxSwift
import CoinDomainInterface

final public class CoinDetailUseCaseImpl: CoinDetailUseCase {
  private let coinDetailRepository: CoinDetailRepository

  init(coinDetailRepository: CoinDetailRepository) {
    self.coinDetailRepository = coinDetailRepository
  }

  public func getCoinDetail(of coinId: String) -> Observable<Coin> {
    return coinDetailRepository.getCoinDetail(of: coinId)
  }
}
