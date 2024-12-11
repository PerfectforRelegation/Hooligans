//
//  ChatListPresenter.swift
//  Hooligans
//
//  Created by 정명곤 on 10/22/23.
//

import Foundation

protocol ChatListPresentationLogic: AnyObject {
    func presentChatRoomList(response: ChatListModels.ChatRoomList.Response)
    func presentFixtureList(response: ChatListModels.FixtureList.Response)
}

final class ChatListPresenter {
    weak var viewController: ChatListViewController?
}

extension ChatListPresenter: ChatListPresentationLogic {
    
    func presentFixtureList(response: ChatListModels.FixtureList.Response) {
//        guard let fixtureResponse = response.fixtureListResponse else { return }
//        
//        let viewModel = ChatListModels.FixtureList.ViewModel(league: fixtureResponse.league, fixtures: fixtureResponse.fixtures)
//        
//        viewController?.displayFixtureList(viewModel: viewModel)
    }
    
    func presentChatRoomList(response: ChatListModels.ChatRoomList.Response) {
//        guard let response = response.ChatRoomListResponse else { return }
//        let viewModel = ChatListModels.ChatRoomList.ViewModel(chatRooms: response)
//        
//        viewController?.displayChatRoomList(viewModel: viewModel)
    }
    
}
