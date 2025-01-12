//
//  ChatRoomPesenter.swift
//  Hooligans
//
//  Created by 정명곤 on 10/25/23.
//

import Foundation


final class ChatRoomPresenter {
    weak var viewController: ChatRoomViewController?
}

extension ChatRoomPresenter {

    func presentChatMessage(response: ChatRoomModels.ChatMessage.Response) {
//        guard let message = response.ChatMessageResponse else { return }
//        let viewModel = ChatRoomModels.ChatMessage.ViewModel(message: message)
//        
//        viewController?.displayChatMessage(viewModel: viewModel)
    }
    
}

