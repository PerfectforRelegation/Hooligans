//
//  BetListRouter.swift
//  Hooligans
//
//  Created by 정명곤 on 11/2/23.
//

import Foundation

protocol BetListRoutingLogic {
    func routeToBetView(bet: Bet)
    func routeToMyBetList()
}

protocol BetListDataPassing {
    var dataStore: BetListDataStore? { get }
}

final class BetListRouter: BetListRoutingLogic {
    weak var viewController: BetListViewController?
    var dataStore: BetListDataStore?
    
    func routeToBetView(bet: Bet) {
        let betViewController = BetViewController(bet: bet)
        
        viewController?.navigationController?.pushViewController(betViewController, animated: true)
    }
    
    func routeToMyBetList() {
        let myBetListViewController = MyBetListViewController()
        viewController?.navigationController?.pushViewController(myBetListViewController, animated: true)
    }
}
