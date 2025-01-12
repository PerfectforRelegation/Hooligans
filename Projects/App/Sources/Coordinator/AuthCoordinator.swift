import UIKit
import RxSwift
import Presentation
import Domain
import Data

final class AuthCoordinator: Coordinator {
  // MARK: - Property
  var parent: Coordinator?
  var childeren: [Coordinator] = []
  var navigationController: UINavigationController

  var disposeBag = DisposeBag()

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  // MARK: - Start
  func start() {
    let repository = RepositoryImpl()               // Data layer
    let useCase = UseCase(repository: repository)   // Domain layer
    let viewModel = SignUpViewModel(useCase: useCase)     // Presentation layer
    let viewController = SignUpViewController(viewModel: viewModel)

    viewModel.output.navigateToTabBarCoordinator
      .subscribe(onNext: { [weak self] in
        let appCoordinator = self?.parent as! AppCoordinator
        appCoordinator.goToTabBarCoordinator()
      })
      .disposed(by: disposeBag)

    viewModel.output.navigateToSignIn
      .subscribe(onNext: { [weak self] in
        self?.goToSignIn()
      })

    navigationController.pushViewController(viewController, animated: true)
  }

  private func goToSignIn() {
    let repository = RepositoryImpl()               // Data layer
    let useCase = UseCase(repository: repository)   // Domain layer
    let viewModel = SignInViewModel(useCase: useCase)     // Presentation layer
    let viewController = SignInViewController(viewModel: viewModel)

    navigationController.pushViewController(viewController, animated: true)
  }

}
