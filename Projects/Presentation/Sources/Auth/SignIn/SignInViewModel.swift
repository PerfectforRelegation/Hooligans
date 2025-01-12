
import Foundation
import RxSwift
import RxCocoa
import Domain


public final class SignInViewModel {
  private let useCase: UseCase
  private let disposeBag = DisposeBag()

  struct Input {
    let viewDidAppear: Observable<Void>
    let tapButton: Observable<Void>
  }

  public struct Output {
//    public let navigateToTabBarCoordinator = PublishRelay<Void>()
  }

  public let output = Output()

  public init(useCase: UseCase) {
    self.useCase = useCase
  }

  func transform(from input: Input) -> Output {

    input.viewDidAppear.subscribe(onNext: {
      print("Sign in view did appear")
    })
    .disposed(by: disposeBag)

//    input.tapButton
//      .bind(to: output.navigateToTabBarCoordinator)
//      .disposed(by: disposeBag)

    return output
  }

}
