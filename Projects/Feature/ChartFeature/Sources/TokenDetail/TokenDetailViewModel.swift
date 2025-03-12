import Foundation
import RxSwift
import TokenDomainInterface
import Domain

enum Constants {
  static let headerHeight: CGFloat = 100
}

final public class TokenDetailViewModel {
  struct Input {
    let viewDidAppear: Observable<Void>
    let selectTab: Observable<IndexPath>
    let scrollTo: Observable<CGPoint>
  }

  struct Output {
    public let candleData = BehaviorSubject<[CandleData]>(value: [])
    public let selectedTab = BehaviorSubject(value: IndexPath(row: 0, section: 0))
    let tabBarPosition = BehaviorSubject(value: Constants.headerHeight)
  }

  // MARK: - Properties
  private let disposeBag = DisposeBag()
  let output = Output()

  private let tokenDetailUseCase: TokenDetailUseCase

  // MARK: - LifeCycle
  init(tokenDetailUseCase: TokenDetailUseCase) {
    self.tokenDetailUseCase = tokenDetailUseCase
  }

  func transform(from input: Input) -> Output {
    input.viewDidAppear
      .flatMap { [weak self] _ -> Observable<[CandleData]> in
        guard let self = self else { return Observable.just([]) }
        return tokenDetailUseCase.getTokenDetail(of: "")
      }
      .bind(to: output.candleData)
      .disposed(by: disposeBag)

    input.selectTab
      .map { indexPath in
        indexPath
      }
      .bind(to: output.selectedTab)
      .disposed(by: disposeBag)

    input.scrollTo
      .map { offset in
        max(Constants.headerHeight - offset.y, 0)
      }
      .bind(to: output.tabBarPosition)
      .disposed(by: disposeBag)

    return output
  }
}
