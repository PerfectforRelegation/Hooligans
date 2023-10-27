//
//  ChatService.swift
//  Hooligans
//
//  Created by 정명곤 on 10/22/23.
//

import Foundation
import Combine

final class ChatService {
    
    func fetchChatroom() -> AnyPublisher<[ChatRoom], Error> {
        return NetworkService.shared.get(to: .chatList)
            .tryMap { data, response in
                print(String(data: data, encoding: .utf8))
                guard let httpResopnse = response as? HTTPURLResponse, httpResopnse.statusCode == 200 else {
                    print("http error")
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [ChatRoom].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func decodeMessage(message: Data) -> AnyPublisher<Message, Error> {
        return Just(message).decode(type: Message.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
