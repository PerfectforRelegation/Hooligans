import Foundation
import RxSwift
import CoinDomainInterface


public final class CoinListViewModel {
  struct Input {
    let viewDidLoad: Observable<Void>
    let selectTab: Observable<IndexPath>
  }

  struct Output {
    let coinList = BehaviorSubject<[Coin]>(value: [])
    let selectedTab = BehaviorSubject<IndexPath>(value: IndexPath(row: 0, section: 0))
  }

  // MARK: - Properties
  private let coinListUseCase: CoinListUseCase
  private let disposeBag = DisposeBag()
  let output = Output()


  // MARK: - Lifecycle
  public init(coinListUseCase: CoinListUseCase) {
    self.coinListUseCase = coinListUseCase
  }

  func transform(from input: Input) -> Output {
    input.viewDidLoad
      .flatMap { [weak self] _ -> Observable<[Coin]> in
        guard let self = self else { return Observable.just([]) }
        return coinListUseCase.getCoinList()
      }
      .bind(to: output.coinList)
      .disposed(by: disposeBag)

    input.selectTab
      .do { [weak self] index in
        guard let self = self else { return }
        self.output.selectedTab.onNext(index)
      }
      .map { [weak self] index -> [Coin] in
        guard let self = self else { return [] }
        let tab = Tab.allCases[index.row]
        switch tab {
        case .all:
          return [Coin(clubId: UUID().uuidString, clubName: "all", clubLogo: "", currentPrice: "123", totalSupply: "123", createdAt: "")]
        case .soccer:
          return [Coin(clubId: UUID().uuidString, clubName: "soccer", clubLogo: "", currentPrice: "123", totalSupply: "123", createdAt: "")]
        case .basketball:
          return [Coin(clubId: UUID().uuidString, clubName: "basketball", clubLogo: "", currentPrice: "123", totalSupply: "123", createdAt: "")]
        }
      }
      .bind(to: output.coinList)
      .disposed(by: disposeBag)

    return output
  }

}
