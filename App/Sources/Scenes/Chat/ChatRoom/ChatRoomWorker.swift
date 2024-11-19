//
//  ChatRoomWorker.swift
//  Hooligans
//
//  Created by 정명곤 on 10/25/23.
//

import Foundation
import Combine


protocol ChatRoomWorkerLogic {
    
}

class ChatRoomWorker: ChatRoomWorkerLogic {
    
    var cancellables = Set<AnyCancellable>()
    
    func decodeMessage(message: Data, _ response: @escaping (ChatRoomModels.ChatMessage.Response) -> Void) {
        

    }
    
}
