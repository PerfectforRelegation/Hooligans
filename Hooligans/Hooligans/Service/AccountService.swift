//
//  AccountService.swift
//  Hooligans
//
//  Created by 정명곤 on 10/27/23.

import Foundation
import Combine

final class AccountService {
    
    func signIn(account: String, password: String) -> AnyPublisher<User, Error> {
        let params = [
            "account": account,
            "password": password
        ] as [String: Any]
        
        return NetworkService.shared.post(to: .signIn, param: params)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    print("http error\(String(data: data, encoding: .utf8))")
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: User.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
