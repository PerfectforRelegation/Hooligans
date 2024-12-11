import UIKit


public final class TabBarViewController: UITabBarController {

  public override func viewDidLoad() {
    super.viewDidLoad()

    setupTabBarItem()
    setupUI()
  }

  private func setupUI() {
    self.tabBar.tintColor = .black
    self.tabBar.backgroundColor = .white
    self.tabBar.layer.borderWidth = 0.1
    self.tabBar.layer.cornerRadius = tabBar.frame.height * 0.41
    self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
  }

  private func setupTabBarItem() {
    let firstViewController = UINavigationController(rootViewController: UserViewController())



    let secondViewController = UINavigationController(rootViewController: ChatListViewController())

    

    let thirdViewController = UINavigationController(rootViewController: BoardListViewController())

    thirdViewController.tabBarItem.image = UIImage(systemName: "list.bullet.clipboard.fill")
    thirdViewController.tabBarItem.selectedImage = UIImage(systemName: "list.bullet.clipboard")
    thirdViewController.tabBarItem.title = "게시판"
    thirdViewController.tabBarItem.tag = 2


    self.setViewControllers([firstViewController, secondViewController, thirdViewController], animated: true)

//    if let selectedImage = firstViewController.tabBarItem.selectedImage {
//      firstViewController.tabBarItem.selectedImage = selectedImage.withTintColor(.systemIndigo, renderingMode: .alwaysOriginal)
//    }
  }


//  private func setupTabBarItem() {
//
//
//    let tabBarItemData: [(image: String, selectedImage: String, title: String, tag: Int)] = [
//      ("text.bubble", "text.bubble.fill", "채팅", 0),
//      ("list.bullet.clipboard", "list.bullet.clipboard.fill", "게시판", 1),
//      ("gamecontroller", "gamecontroller.fill", "배팅", 2),
//      ("sportscourt", "sportscourt.fill", "테이블", 3)
//    ]
//
//    let selectedColor = UIColor.systemIndigo
//    let unselectedColor = UIColor.systemGray // You can adjust this color
//
//    for (index, viewController) in viewControllers.enumerated() {
//      let tabBarItemInfo = tabBarItemData[index]
//
//      viewController.tabBarItem.image = UIImage(systemName: tabBarItemInfo.image)
//      viewController.tabBarItem.selectedImage = UIImage(systemName: tabBarItemInfo.selectedImage)
//      viewController.tabBarItem.title = tabBarItemInfo.title
//      viewController.tabBarItem.tag = tabBarItemInfo.tag
//
//      if let selectedImage = viewController.tabBarItem.selectedImage {
//        viewController.tabBarItem.selectedImage = selectedImage.withTintColor(selectedColor, renderingMode: .alwaysOriginal)
//      }
//
//      // Set text color for selected and unselected states
//      viewController.tabBarItem.setTitleTextAttributes([.foregroundColor: selectedColor], for: .selected)
//      viewController.tabBarItem.setTitleTextAttributes([.foregroundColor: unselectedColor], for: .normal)
//    }
//
//    self.setViewControllers(viewControllers, animated: true)
//  }
}
