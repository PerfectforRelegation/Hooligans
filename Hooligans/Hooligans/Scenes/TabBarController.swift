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
        self.tabBar.tintColor = .systemGray6
        self.tabBar.backgroundColor = .white
        self.tabBar.layer.cornerRadius = tabBar.frame.height * 0.41
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private func setupTabBarItem() {
        let firstViewController = UINavigationController(rootViewController: MainViewController())
        
        firstViewController.tabBarItem.image = UIImage(systemName: "star.fill")
        firstViewController.tabBarItem.selectedImage = UIImage(systemName: "star")
        firstViewController.tabBarItem.title = "Main"
        firstViewController.tabBarItem.tag = 0
        
        let secondViewController = UINavigationController(rootViewController: ChatListViewController())
        
        secondViewController.tabBarItem.image = UIImage(systemName: "star.fill")
        secondViewController.tabBarItem.selectedImage = UIImage(systemName: "star")
        secondViewController.tabBarItem.title = "Main"
        secondViewController.tabBarItem.tag = 1
        
        let thirdViewController = UINavigationController(rootViewController: BoardListViewController())
        
        thirdViewController.tabBarItem.image = UIImage(systemName: "star.fill")
        thirdViewController.tabBarItem.selectedImage = UIImage(systemName: "star")
        thirdViewController.tabBarItem.title = "Main"
        thirdViewController.tabBarItem.tag = 2
        
        let fourthViewController = UINavigationController(rootViewController: BetListViewController())
        
        fourthViewController.tabBarItem.image = UIImage(systemName: "star.fill")
        fourthViewController.tabBarItem.selectedImage = UIImage(systemName: "star")
        fourthViewController.tabBarItem.title = "Main"
        fourthViewController.tabBarItem.tag = 3
        
        self.setViewControllers([firstViewController, secondViewController, thirdViewController, fourthViewController], animated: true)
    }

}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        viewController.navigationController?.popToRootViewController(animated: true)
    }
}
