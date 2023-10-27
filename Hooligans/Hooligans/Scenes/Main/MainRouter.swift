//
//  MainRouter.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/14.
//

import Foundation

protocol MainRoutingLogic {
    func routeToUserInfo()
}

protocol MainDataPassing {
    var dataStore: MainDataStore? { get }
}

final class MainRouter: MainRoutingLogic {
    weak var viewController: MainViewController?
    var dataStore: MainDataStore?
    
    func routeToUserInfo() {
//        let userViewController = UserViewController()
//        
//        viewController.navigationController?.pushViewController(userViewController, animated: true)

//        let userViewController = ChatRoomViewController()
//        
//        viewController?.navigationController?.pushViewController(userViewController, animated: true)
    }
    
}
