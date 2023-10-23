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
    func fetchFixtureList(request: ChatListModels.FixtureList.Request)
}

class ChatListInteractor: ChatListDataStore, ChatListBusinessLogic {
    
    var presenter: ChatListPresentationLogic?
    var worker: ChatListWorker?
    
    func fetchFixtureList(request: ChatListModels.FixtureList.Request) {
        worker = ChatListWorker()
        worker?.fetchFixtureList({ response in
            self.presenter?.presentFixtureList(response: response)
        })
    }
}
