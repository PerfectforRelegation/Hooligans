
import Foundation
import RxSwift
import RxCocoa
import Domain


public final class SignUpViewModel {
  private let useCase: UseCase
  private let disposeBag = DisposeBag()

  struct Input {
    let tapButton: Observable<Void>
  }

  public struct Output {
    public let navigateToTabBarCoordinator = PublishRelay<Void>()
  }

  public let output = Output()

  public init(useCase: UseCase) {
    self.useCase = useCase
  }

  func transform(from input: Input) -> Output {

    input.tapButton
      .bind(to: output.navigateToTabBarCoordinator)
      .disposed(by: disposeBag)


    return Output()
  }

}
