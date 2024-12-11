//
//  ChatRoomInteractor.swift
//  Hooligans
//
//  Created by 정명곤 on 10/25/23.
//

import Foundation


class ChatRoomInteractor {
    var worker: ChatRoomWorker?
    
    func getChatMessage(message: Data) {
        worker = ChatRoomWorker()
        worker?.decodeMessage(message: message) { response in
//            self.presenter?.presentChatMessage(response: response)
        }
    }
}
