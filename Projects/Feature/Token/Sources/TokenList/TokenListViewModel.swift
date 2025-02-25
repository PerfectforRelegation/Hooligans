import Foundation
import RxSwift
import RxCocoa
import Domain


public final class TokenListViewModel {
  // MARK: - Properties
  private let useCase: TokenUseCase
  private let disposeBag = DisposeBag()

  struct Input {
    let viewDidAppear: Observable<Void>
    let selectTap: Observable<TokenListTableViewCell>
  }

  struct Output {
    public let tapList = PublishRelay<[String]>()
    public let clubList = PublishRelay<[Token]>()
  }

  let output = Output()
  var coinList: [Coin] = []
  var selectedTabIndex = 0

  // MARK: - Lifecycle
  public init(useCase: TokenUseCase) {
    self.useCase = useCase
  }

  func transform(from input: Input) -> Output {

    input.viewDidAppear
      .map {
        ["전체", "국내", "해외"]
      }
      .bind(to: output.tapList)
      .disposed(by: disposeBag)

    input.viewDidAppear
      .flatMap { [weak self] _ -> Observable<[Token]> in
        guard let self = self else { return Observable.just([]) }
        return useCase.getTokenList()
      }
      .bind(to: output.clubList)
      .disposed(by: disposeBag)

    return output
  }

}
