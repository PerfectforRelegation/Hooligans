//
//  AccountService.swift
//  Hooligans
//
//  Created by Joseph on 10/27/23.
//

import Foundation
import Combine

final class AccountService {

    func fetchChatroom() -> AnyPublisher<[ChatRoom], Error> {
        return NetworkService.shared.get(to: .chatList)
            .tryMap { data, response in
//                print(String(data: data, encoding: .utf8))
                guard let httpResopnse = response as? HTTPURLResponse, httpResopnse.statusCode == 200 else {
                    print("http error")
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [ChatRoom].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

}
