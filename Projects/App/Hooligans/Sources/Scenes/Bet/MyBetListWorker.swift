//
//  MyBetListWorker.swift
//  Hooligans
//
//  Created by 정명곤 on 11/2/23.
//

import Foundation
import Combine

protocol MyBetListWorkerLogic {
    func fetchMyBetList(request: BetListModels.MyBetList.Request, _ response: @escaping (BetListModels.MyBetList.Response) -> Void)
    func getReward(request: BetListModels.Reward.Request, _ response: @escaping (BetListModels.Reward.Response) -> Void)
}

class MyBetListWorker: MyBetListWorkerLogic {
    let apiManager = BetService()
    private var cancellables = Set<AnyCancellable>()
    
    
    func fetchMyBetList(request: BetListModels.MyBetList.Request, _ response: @escaping (BetListModels.MyBetList.Response) -> Void) {
        apiManager.fetchMyBetList().sink { result in
            switch result {
            case .finished:
                print("Fetch LeagueTable finished")
            case .failure(_):
                response(BetListModels.MyBetList.Response(isError: true, message: "Error"))
            }
        } receiveValue: { data in
            response(BetListModels.MyBetList.Response(myBetList: data, isError: false))
        }
        .store(in: &cancellables)
        
    }
    
    func getReward(request: BetListModels.Reward.Request, _ response: @escaping (BetListModels.Reward.Response) -> Void) {
        apiManager.getReward(id: request.id).sink { result in
            switch result {
            case .finished:
                print("Fetch LeagueTable finished")
            case .failure(_):
                response(BetListModels.Reward.Response(isError: true, message: "Error"))
            }
        } receiveValue: { data in
            response(BetListModels.Reward.Response(myPoint: data, isError: false))
        }
        .store(in: &cancellables)
    }
}
