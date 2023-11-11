//
//  TabBarController.swift
//  Hooligans
//
//  Created by 정명곤 on 10/17/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBarItem()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    private func setupUI() {
        self.tabBar.tintColor = .main
        self.tabBar.backgroundColor = .white
        self.tabBar.layer.borderWidth = 0.1
        self.tabBar.layer.cornerRadius = tabBar.frame.height * 0.41
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    //    private func setupTabBarItem() {
    //        let firstViewController = UINavigationController(rootViewController: MainViewController())
    //
    //        firstViewController.tabBarItem.image = UIImage(systemName: "house.fill")
    //        firstViewController.tabBarItem.selectedImage = UIImage(systemName: "house")
    //        firstViewController.tabBarItem.title = "홈"
    //        firstViewController.tabBarItem.tag = 0
    //
    //        let secondViewController = UINavigationController(rootViewController: ChatListViewController())
    //
    //        secondViewController.tabBarItem.image = UIImage(systemName: "text.bubble.fill")
    //        secondViewController.tabBarItem.selectedImage = UIImage(systemName: "text.bubble")
    //        secondViewController.tabBarItem.title = "채팅"
    //        secondViewController.tabBarItem.tag = 1
    //
    //        let thirdViewController = UINavigationController(rootViewController: BoardListViewController())
    //
    //        thirdViewController.tabBarItem.image = UIImage(systemName: "list.bullet.clipboard.fill")
    //        thirdViewController.tabBarItem.selectedImage = UIImage(systemName: "list.bullet.clipboard")
    //        thirdViewController.tabBarItem.title = "게시판"
    //        thirdViewController.tabBarItem.tag = 2
    //
    //        let fourthViewController = UINavigationController(rootViewController: BetListViewController())
    //
    //        fourthViewController.tabBarItem.image = UIImage(systemName: "gamecontroller.fill")
    //        fourthViewController.tabBarItem.selectedImage = UIImage(systemName: "gamecontroller")
    //        fourthViewController.tabBarItem.title = "배팅"
    //        fourthViewController.tabBarItem.tag = 3
    //
    //        let fifthViewController = UINavigationController(rootViewController: LeagueTableViewController())
    //
    //        fifthViewController.tabBarItem.image = UIImage(systemName: "sportscourt")
    //        fifthViewController.tabBarItem.selectedImage = UIImage(systemName: "sportscourt")
    //        fifthViewController.tabBarItem.title = "테이블"
    //        fifthViewController.tabBarItem.tag = 4
    //
    //        self.setViewControllers([firstViewController, secondViewController, thirdViewController, fourthViewController, fifthViewController], animated: true)
    //
    ////        if let image = firstViewController.tabBarItem.image {
    ////                firstViewController.tabBarItem.image = image.withTintColor(.systemGray5, renderingMode: .alwaysOriginal)
    //        //            }
    //        if let selectedImage = firstViewController.tabBarItem.selectedImage {
    //            firstViewController.tabBarItem.selectedImage = selectedImage.withTintColor(.systemIndigo, renderingMode: .alwaysOriginal)
    //        }
    //    }
    //
    //}
    private func setupTabBarItem() {
        let viewControllers: [UIViewController] = [
            UINavigationController(rootViewController: MainViewController()),
            UINavigationController(rootViewController: ChatListViewController()),
            UINavigationController(rootViewController: BoardListViewController()),
            UINavigationController(rootViewController: BetListViewController()),
            UINavigationController(rootViewController: LeagueTableViewController())
        ]

        let tabBarItemData: [(image: String, selectedImage: String, title: String, tag: Int)] = [
            ("house", "house.fill", "홈", 0),
            ("text.bubble", "text.bubble.fill", "채팅", 1),
            ("list.bullet.clipboard", "list.bullet.clipboard.fill", "게시판", 2),
            ("gamecontroller", "gamecontroller.fill", "배팅", 3),
            ("sportscourt", "sportscourt.fill", "테이블", 4)
        ]

        let selectedColor = UIColor.systemIndigo
        let unselectedColor = UIColor.systemGray // You can adjust this color

        for (index, viewController) in viewControllers.enumerated() {
            let tabBarItemInfo = tabBarItemData[index]

            viewController.tabBarItem.image = UIImage(systemName: tabBarItemInfo.image)
            viewController.tabBarItem.selectedImage = UIImage(systemName: tabBarItemInfo.selectedImage)
            viewController.tabBarItem.title = tabBarItemInfo.title
            viewController.tabBarItem.tag = tabBarItemInfo.tag

            if let selectedImage = viewController.tabBarItem.selectedImage {
                viewController.tabBarItem.selectedImage = selectedImage.withTintColor(selectedColor, renderingMode: .alwaysOriginal)
            }

            // Set text color for selected and unselected states
            viewController.tabBarItem.setTitleTextAttributes([.foregroundColor: selectedColor], for: .selected)
            viewController.tabBarItem.setTitleTextAttributes([.foregroundColor: unselectedColor], for: .normal)
        }

        self.setViewControllers(viewControllers, animated: true)
    }
}
