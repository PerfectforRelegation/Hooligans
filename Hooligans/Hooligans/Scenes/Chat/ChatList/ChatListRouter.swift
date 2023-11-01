//
//  ChatListRouter.swift
//  Hooligans
//
//  Created by 정명곤 on 10/22/23.
//

import Foundation
import StompClientLib

protocol ChatListRoutingLogic {
    func routeToChatView(chatRoom: ChatRoom)
}

protocol ChatListDataPassing {
    var dataStore: ChatListDataStore? { get }
}

final class ChatListRouter: ChatListRoutingLogic {
    weak var viewController: ChatListViewController?
    var dataStore: ChatListDataStore?
    
    func routeToChatView(chatRoom: ChatRoom) {
        let chatRoomViewController = ChatRoomViewController(chatRoom: chatRoom)
        chatRoomViewController.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(chatRoomViewController, animated: true)
    }
}
