//
//  MainService.swift
//  Hooligans
//
//  Created by 정명곤 on 11/1/23.
//

import Foundation
import Combine

final class MainService {
    
    func fetchBoardList() -> AnyPublisher<NewsResponse, Error> {
        
        return NetworkService.shared.get(to: .news)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    print("http error")
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: NewsResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
