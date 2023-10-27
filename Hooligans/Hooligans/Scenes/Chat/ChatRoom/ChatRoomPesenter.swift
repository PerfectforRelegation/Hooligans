//
//  ChatRoomPesenter.swift
//  Hooligans
//
//  Created by 정명곤 on 10/25/23.
//

import Foundation

protocol ChatRoomPresentationLogic: AnyObject {
    func presentChatMessage(response: ChatRoomModels.ChatMessage.Response)
}

final class ChatRoomPresenter {
    weak var viewController: ChatRoomViewController?
}

extension ChatRoomPresenter: ChatRoomPresentationLogic {
    
    func presentChatMessage(response: ChatRoomModels.ChatMessage.Response) {
        guard let message = response.ChatMessageResponse else { return }
        let viewModel = ChatRoomModels.ChatMessage.ViewModel(message: message)
        
        viewController?.displayChatMessage(viewModel: viewModel)
    }
    
}

