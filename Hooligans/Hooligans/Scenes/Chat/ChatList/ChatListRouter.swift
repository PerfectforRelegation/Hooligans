//
//  ChatListRouter.swift
//  Hooligans
//
//  Created by 정명곤 on 10/22/23.
//

import Foundation

protocol ChatListRoutingLogic {
    
}

protocol ChatListDataPassing {
    var dataStore: ChatListDataStore? { get }
}

final class ChatListRouter: ChatListRoutingLogic {
    weak var viewController: ChatListViewController?
    var dataStore: ChatListDataStore?
    
}
