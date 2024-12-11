import UIKit
import Presentation
import Domain
import Data
import RxSwift


final class HomeCoordinator: Coordinator {
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
    let viewModel = ViewModel(useCase: useCase)     // Presentation layer
    let viewController = ViewController(viewModel: viewModel)

    viewModel.navigateToAuthCoordinator
      .subscribe(onNext: { [weak self] in
        let appCoordinator = self?.parent as! AppCoordinator
        appCoordinator.goToAuthCoordinator()
      })
      .disposed(by: disposeBag)

    navigationController.pushViewController(viewController, animated: true)
  }

}