//
//  MainRouter.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/14.
//

import Foundation

protocol MainRoutingLogic {
    func routeToChatRoom()
    func routeToHistory()
}

protocol MainDataPassing {
    var dataStore: MainDataStore? { get }
}

final class MainRouter: MainRoutingLogic {
    weak var viewController: MainViewController?
    var dataStore: MainDataStore?
    
    func routeToChatRoom() {
        let chatListViewController = ChatListViewController()
        viewController?.navigationController?.pushViewController(chatListViewController, animated: true)
    }
    
    func routeToHistory() {
        let betHistoryViewController = MyBetListViewController()
        viewController?.navigationController?.pushViewController(betHistoryViewController, animated: true)
    }
    
}
