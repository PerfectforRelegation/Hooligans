import UIKit
import Presentation
import Domain
import Data


//enum TabBarNavigator: Navigatorable {
//  case home
//}

final class TabBarCoordinator: Coordinator {
  // MARK: - Property
  var parent: Coordinator?
  var childeren: [Coordinator] = []
  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  // MARK: - Start
  func start() {
//    let repository = RepositoryImpl() // Data layer
//    let useCase = UseCase(repository: repository) // Domain layer
//    let viewModel = AlarmViewModel(useCase: useCase) // Presentation layer
//    let viewController = AlarmListViewController(viewModel: viewModel)

    let tabbarController = UITabBarController()

    let chatViewController = UINavigationController()
    let homeCoordinator = HomeCoordinator(navigationController: chatViewController)
    homeCoordinator.parent = parent

    chatViewController.tabBarItem.image = UIImage(systemName: "house.fill")
    chatViewController.tabBarItem.selectedImage = UIImage(systemName: "house")
    chatViewController.tabBarItem.title = "홈"
    chatViewController.tabBarItem.tag = 0

    let userViewController = UINavigationController()
    let tradingCoordinator = TradingCoordinator(navigationController: userViewController)
    tradingCoordinator.parent = parent

    userViewController.tabBarItem.image = UIImage(systemName: "text.bubble.fill")
    userViewController.tabBarItem.selectedImage = UIImage(systemName: "text.bubble")
    userViewController.tabBarItem.title = "채팅"
    userViewController.tabBarItem.tag = 1

    tabbarController.viewControllers = [chatViewController, userViewController]

    navigationController.pushViewController(tabbarController, animated: true)

    parent?.childeren.append(homeCoordinator)
    parent?.childeren.append(tradingCoordinator)

    homeCoordinator.start()
    tradingCoordinator.start()
  }

//  func goToTabBar() {
//    let tabBarController = TabBarViewController()
//
//    let viewControllers: [UIViewController] = [
//      UINavigationController(rootViewController: ViewController()),
//      UINavigationController(rootViewController: ChatListViewController()),
//    ]
//  }


}
