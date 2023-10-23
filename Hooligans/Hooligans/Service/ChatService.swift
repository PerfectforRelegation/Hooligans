//
//  ChatService.swift
//  Hooligans
//
//  Created by 정명곤 on 10/22/23.
//

import Foundation
import Combine

final class ChatService {
    
    func fetchChatroom() -> AnyPublisher<LeagueTable, Error> {
        
        return NetworkService.shared.get(to: .leagueTable)
            .tryMap { data, response in
                guard let httpResopnse = response as? HTTPURLResponse, httpResopnse.statusCode == 200 else {
                    print("http error")
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: LeagueTable.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
