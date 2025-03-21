
import UIKit
import Token

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let scene = (scene as? UIWindowScene) else { return }

    let window = UIWindow(windowScene: scene)

    let viewController = TokenExampleViewController()
    let rootViewController = UINavigationController(rootViewController: viewController)

    window.rootViewController = rootViewController
    self.window = window

    window.makeKeyAndVisible()
  }

}
