//
//  ChatRoomInteractor.swift
//  Hooligans
//
//  Created by 정명곤 on 10/25/23.
//

import Foundation

protocol ChatRoomBusinessLogic {
    func getChatMessage(message: Data)
}

protocol ChatRoomDataStore {
    
}


class ChatRoomInteractor: ChatRoomDataStore, ChatRoomBusinessLogic {
    var presenter: ChatRoomPresentationLogic?
    var worker: ChatRoomWorker?
    
    func getChatMessage(message: Data) {
        worker = ChatRoomWorker()
        worker?.decodeMessage(message: message) { response in
            self.presenter?.presentChatMessage(response: response)
        }
    }
}
