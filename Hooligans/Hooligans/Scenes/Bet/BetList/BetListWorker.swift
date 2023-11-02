//
//  BetListWorker.swift
//  Hooligans
//
//  Created by 정명곤 on 11/2/23.
//

import Foundation
import Combine

protocol BetListWorkerLogic {
    
}

class BetListWorker: BetListWorkerLogic {
    
    let apiManager = BetService()
    private var cancellables = Set<AnyCancellable>()

    func fetchBetList(request: BetListModels.BetList.Request, _ response: @escaping (BetListModels.BetList.Response) -> Void) {
        apiManager.fetchBetList().sink { result in
            switch result {
            case .finished:
                print("Fetch LeagueTable finished")
            case .failure(_):
                response(BetListModels.BetList.Response(isError: true, message: "Error"))
            }
        } receiveValue: { data in
            response(BetListModels.BetList.Response(betList: data, isError: false))
        }
        .store(in: &cancellables)

    }
}
