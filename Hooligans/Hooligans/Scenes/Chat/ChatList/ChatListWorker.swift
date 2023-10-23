//
//  ChatListWorker.swift
//  Hooligans
//
//  Created by 정명곤 on 10/22/23.
//

import Foundation
import Combine

protocol ChatListWorkerLogic {
    func fetchFixtureList(_ response: @escaping (ChatListModels.FixtureList.Response) -> Void)
}

class ChatListWorker: ChatListWorkerLogic {
    
    let apiManager = LeagueService()
    
    var cancellables = Set<AnyCancellable>()
    
    func fetchFixtureList(_ response: @escaping (ChatListModels.FixtureList.Response) -> Void) {
        apiManager.fetchFixtures().sink { result in
            switch result {
            case .finished:
                print("Fetch LeagueTable finished")
            case .failure(_):
                print("fail")
                response(ChatListModels.FixtureList.Response(isError: true, message: "Error"))
            }
        } receiveValue: { data in
            response(ChatListModels.FixtureList.Response(fixtureListResponse: data, isError: false, message: nil))
        }
        .store(in: &cancellables)
    }
    
    
    
    
}
