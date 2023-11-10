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
    
    private func setupTabBarItem() {
        let firstViewController = UINavigationController(rootViewController: MainViewController())
        
        firstViewController.tabBarItem.image = UIImage(systemName: "house.fill")
        firstViewController.tabBarItem.selectedImage = UIImage(systemName: "house")
        firstViewController.tabBarItem.title = "홈"
        firstViewController.tabBarItem.tag = 0
        
        let secondViewController = UINavigationController(rootViewController: ChatListViewController())
        
        secondViewController.tabBarItem.image = UIImage(systemName: "text.bubble.fill")
        secondViewController.tabBarItem.selectedImage = UIImage(systemName: "text.bubble")
        secondViewController.tabBarItem.title = "채팅"
        secondViewController.tabBarItem.tag = 1
        
        let thirdViewController = UINavigationController(rootViewController: BoardListViewController())
        
        thirdViewController.tabBarItem.image = UIImage(systemName: "list.bullet.clipboard.fill")
        thirdViewController.tabBarItem.selectedImage = UIImage(systemName: "list.bullet.clipboard")
        thirdViewController.tabBarItem.title = "게시판"
        thirdViewController.tabBarItem.tag = 2
        
        let fourthViewController = UINavigationController(rootViewController: BetListViewController())
        
        fourthViewController.tabBarItem.image = UIImage(systemName: "gamecontroller.fill")
        fourthViewController.tabBarItem.selectedImage = UIImage(systemName: "gamecontroller")
        fourthViewController.tabBarItem.title = "배팅"
        fourthViewController.tabBarItem.tag = 3
        
        let fifthViewController = UINavigationController(rootViewController: LeagueTableViewController())
        
        fifthViewController.tabBarItem.image = UIImage(systemName: "sportscourt")
        fifthViewController.tabBarItem.selectedImage = UIImage(systemName: "sportscourt")
        fifthViewController.tabBarItem.title = "테이블"
        fifthViewController.tabBarItem.tag = 4
        
        self.setViewControllers([firstViewController, secondViewController, thirdViewController, fourthViewController, fifthViewController], animated: true)
    }

}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        viewController.navigationController?.popToRootViewController(animated: true)
    }
}
