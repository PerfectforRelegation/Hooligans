
import UIKit
import Domain
import RxSwift


final class AppCoordinator: Coordinator {
  // MARK: - Property
  var window: UIWindow?

  var parent: Coordinator?
  var childeren: [Coordinator] = []
  var navigationController = UINavigationController()

  private let disposeBag = DisposeBag()

  init(window: UIWindow?) {
    self.window = window
  }

  // MARK: - Start
  func start() {
//    goToAuthCoordinator()
    goToTabBarCoordinator()

    
  }

  func goToTabBarCoordinator() {
    let navigationController = UINavigationController()
    let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
    tabBarCoordinator.parent = self
    go(to: tabBarCoordinator)
  }

  func goToAuthCoordinator() {
    let navigationController = UINavigationController()
    let authCoordinator = AuthCoordinator(navigationController: navigationController)
    authCoordinator.parent = self
    go(to: authCoordinator)
  }

}

extension AppCoordinator {
  private func go(to coordinator: Coordinator) {
    guard let window = window else { return }

    childeren.removeAll()
    childeren.append(coordinator)

    window.rootViewController = coordinator.navigationController
    window.makeKeyAndVisible()

    coordinator.start()
  }


}
