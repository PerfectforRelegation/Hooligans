//
//  ChatListInteractor.swift
//  Hooligans
//
//  Created by 정명곤 on 10/22/23.
//

import Foundation

protocol ChatListDataStore {
    
}

protocol ChatListBusinessLogic {
    func fetchChatRoomList(request: ChatListModels.ChatRoomList.Request)
    func fetchFixtureList(request: ChatListModels.FixtureList.Request)
}

class ChatListInteractor: ChatListDataStore, ChatListBusinessLogic {
    
    var presenter: ChatListPresentationLogic?
    var worker: ChatListWorker?
    
    func fetchChatRoomList(request: ChatListModels.ChatRoomList.Request) {
        worker = ChatListWorker()
        worker?.fetchChatRoomList({ response in
            self.presenter?.presentChatRoomList(response: response)
        })
    }
    
    func fetchFixtureList(request: ChatListModels.FixtureList.Request) {
        worker = ChatListWorker()
        worker?.fetchFixtureList({ response in
            self.presenter?.presentFixtureList(response: response)
        })
    }
}
