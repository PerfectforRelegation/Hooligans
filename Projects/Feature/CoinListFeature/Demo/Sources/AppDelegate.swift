import UIKit
@testable import CoinListFeature
@testable import CoinDomainTesting


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  let notificationCenter = UNUserNotificationCenter.current()

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)

    let coinListUseCase = MockCoinListUseCase()
    coinListUseCase.fetchCoinListReturn = Array(repeating: .sample, count: 10)
    let viewModel = CoinListViewModel(coinListUseCase: coinListUseCase)
    let viewController = CoinListViewController(viewModel: viewModel)
    let rootViewController = UINavigationController(rootViewController: viewController)
    
    window?.rootViewController = rootViewController
    window?.makeKeyAndVisible()
    
    return true
  }

}
