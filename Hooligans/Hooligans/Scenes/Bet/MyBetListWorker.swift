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
}
