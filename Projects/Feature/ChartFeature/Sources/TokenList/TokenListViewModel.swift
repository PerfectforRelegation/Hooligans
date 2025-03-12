import Foundation
import RxSwift
import TokenInterface
import Domain


public final class TokenListViewModel {
  struct Input {
    let viewDidLoad: Observable<Void>
    let selectTap: Observable<TokenListTableViewCell>
  }

  struct Output {
    public let tapList = PublishSubject<[String]>()
    public let clubList = PublishSubject<[Token]>()
  }

  // MARK: - Properties
  private let tokenListUseCase: TokenListUseCase
  private let disposeBag = DisposeBag()
  let output = Output()


  // MARK: - Lifecycle
  public init(tokenListUseCase: TokenListUseCase) {
    self.tokenListUseCase = tokenListUseCase
  }

  func transform(from input: Input) -> Output {

    input.viewDidLoad
      .map {
        ["전체", "국내", "해외"]
      }
      .bind(to: output.tapList)
      .disposed(by: disposeBag)

    input.viewDidLoad
      .flatMap { [weak self] _ -> Observable<[Token]> in
        guard let self = self else { return Observable.just([]) }
        return tokenListUseCase.getTokenList()
      }
      .bind(to: output.clubList)
      .disposed(by: disposeBag)

    return output
  }

}
