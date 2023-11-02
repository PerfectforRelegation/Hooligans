//
//  BetService.swift
//  Hooligans
//
//  Created by 정명곤 on 11/2/23.
//

import Foundation
import Combine

final class BetService {
    func fetchBetList() -> AnyPublisher<[Bet], Error> {
        return NetworkService.shared.get(to: .betList)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    print("http error")
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Bet].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchMyBetList() -> AnyPublisher<[UserBet], Error> {
        return NetworkService.shared.get(to: .myBetList)
            .tryMap { data, response in
                print(String(data: data, encoding: .utf8))
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    print("http error")
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [UserBet].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func betting(id: String, betpoint: Int, pick: String) -> AnyPublisher<Point, Error> {
        let params = [
            "betPoint": betpoint,
            "pick": pick
        ] as [String: Any]
        return NetworkService.shared.post(to: "/point/bet/\(id)", param: params)
        .tryMap { data, response in
            print(String(data: data, encoding: .utf8))
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("http error")
                throw URLError(.badServerResponse)
            }
            return data
        }
        .decode(type: Point.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    }
}
