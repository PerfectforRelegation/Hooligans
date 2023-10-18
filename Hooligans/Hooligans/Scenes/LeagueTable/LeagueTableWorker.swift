//
//  LeagueTableWorker.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/30.
//

import Foundation
import Combine

protocol LeagueTableWorkerLogic {
    func fetchLeagueTable(_ response: @escaping (LeagueTableModels.Table.Response) -> Void)
}

class LeagueTableWorker: LeagueTableWorkerLogic {
    func fetchLeagueTable(_ response: @escaping (LeagueTableModels.Table.Response) -> Void) {
        return
    }
    
    
    let apiManager = APIService()
    
    var cancellables = Set<AnyCancellable>()
    
//    func fetchLeagueTable(_ response: @escaping (LeagueTableModels.Table.Response) -> Void) {
//        apiManager.fetchLeagueTable().sink { result in
//            switch result {
//            case .finished:
//                print("Fetch LeagueTable finished")
//            case .failure(_):
//                response(LeagueTableModels.Table.Response(isError: true, message: "Error"))
//            }
//        } receiveValue: { data in
//            response(LeagueTableModels.Table.Response(tableResponse: data, isError: false, message: nil))
//        }
//        .store(in: &cancellables)
//    }
    
}
