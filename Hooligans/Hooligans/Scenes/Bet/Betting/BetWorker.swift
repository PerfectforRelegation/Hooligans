//
//  BetWorker.swift
//  Hooligans
//
//  Created by 정명곤 on 11/2/23.
//

import Foundation
import Combine

protocol BetWorkerLogic {
    func betting(request: BetModels.Betting.Request, _ response: @escaping (BetModels.Betting.Response) -> Void)
}

class BetWorker: BetWorkerLogic {
    private let apiService = BetService()
    private var cancellables = Set<AnyCancellable>()
    
    func betting(request: BetModels.Betting.Request, _ response: @escaping (BetModels.Betting.Response) -> Void) {
        apiService.betting(id: request.id, betpoint: request.betPoint, pick: request.pick).sink { result in
            switch result {
            case .finished:
                print("Betting finished")
            case .failure(_):
                print("Betting Error")
                response(BetModels.Betting.Response(isError: true, message: "Error"))
            }
        } receiveValue: { data in
            response(BetModels.Betting.Response(point: data, isError: false))
        }
        .store(in: &cancellables)

        
    }
    
}
