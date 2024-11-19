//
//  File.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/19.
//

import Foundation
import UIKit

protocol SigninRoutingLogic {
    func routeToMain()
    func routeToSignup()
}

protocol SigninDataPassing {
    
}

final class SigninRouter: SigninRoutingLogic {
    weak var viewController: SigninController?
    
    func routeToMain() {
        let mainViewController = TabBarController()
        let tabbarViewController = UINavigationController(rootViewController: mainViewController)
        
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.changeRootViewController(tabbarViewController, animated: false)
        }
    }
    
    func routeToSignup() {
        let signupViewController = SignupViewController()
        
        viewController?.navigationController?.pushViewController(signupViewController, animated: true)
    }
}
