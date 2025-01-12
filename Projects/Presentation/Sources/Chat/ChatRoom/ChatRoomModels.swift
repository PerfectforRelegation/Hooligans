//
//  ChatRoomModels.swift
//  Hooligans
//
//  Created by 정명곤 on 10/26/23.
//

import Foundation
import Domain

enum ChatRoomModels {
    
    enum ChatMessage {
        struct Resquest {
            
        }
        
        struct Response {
            var ChatMessageResponse: Message?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel {
            var message: Message
        }
    }
}
