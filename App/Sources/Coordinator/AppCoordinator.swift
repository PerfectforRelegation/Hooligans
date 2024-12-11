
import UIKit
import Domain
import RxSwift


final class AppCoordinator: Coordinator {
  // MARK: - Property
  var parent: Coordinator?
  var childeren: [Coordinator] = []
  var navigationController = UINavigationController()

  private let disposeBag = DisposeBag()

  init() {
    
  }

  // MARK: - Start
  func start() {
//    goToAuthCoordinator()
    goToTabBarCoordinator()

    
  }

  func goToTabBarCoordinator() {
    let tabBarCoordinator = TabBarCoordinator(navigationController: self.navigationController)
    tabBarCoordinator.parent = self
    go(to: tabBarCoordinator)
  }

  func goToAuthCoordinator() {
    let authCoordinator = AuthCoordinator(navigationController: self.navigationController)
    authCoordinator.parent = self
    go(to: authCoordinator)
  }

}

extension AppCoordinator {
  private func go(to coordinator: Coordinator) {
    childeren.removeAll()
    childeren.append(coordinator)

    coordinator.start()
  }


}
