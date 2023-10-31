//
//  BoardService.swift
//  Hooligans
//
//  Created by 정명곤 on 10/28/23.
//

import Foundation
import Combine

final class BoardService {
    
    func fetchBoardList() -> AnyPublisher<[Board], Error> {
        
        return NetworkService.shared.get(to: .boardList)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    print("http error")
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: [Board].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
