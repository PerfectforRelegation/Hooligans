import Foundation
import RxSwift
import RxCocoa
import Domain


public final class ClubListViewModel {
  // MARK: - Properties
  private let useCase: CoinListUseCase
  private let disposeBag = DisposeBag()

  struct Input {
    let viewDidAppear: Observable<Void>
  }

  struct Output {
    public let clubList = PublishRelay<[Club]>()
  }

  let output = Output()
  var coinList: [Coin] = []

  // MARK: - Lifecycle
  public init(useCase: CoinListUseCase) {
    self.useCase = useCase
  }

  func transform(from input: Input) -> Output {

    input.viewDidAppear
      .flatMap { [weak self] _ -> Observable<[Club]> in
        guard let self = self else { return Observable.just([]) }
        return useCase.getClubList()
      }
      .bind(to: output.clubList)
      .disposed(by: disposeBag)

    return output
  }

}
