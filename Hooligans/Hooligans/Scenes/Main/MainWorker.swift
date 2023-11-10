//
//  MainWorker.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/14.
//

import Foundation
import Combine

protocol MainWorkerLogic {
    func fetchMainSource(_ response: @escaping (MainModels.Main.Response) -> Void)
}

class MainWorker: MainWorkerLogic {
    let apiManager = MainService()
    var cancellables = Set<AnyCancellable>()
    
    func fetchMainSource(_ response: @escaping (MainModels.Main.Response) -> Void) {
        apiManager.fetchMain().sink { result in
            switch result {
            case .finished:
                print("fetch main finishied")
            case .failure(let error):
                print("Main Error: \(error.localizedDescription)")
                response(MainModels.Main.Response(isError: true, message: error.localizedDescription))
            }
        } receiveValue: { data in
            response(MainModels.Main.Response(main: data, isError: false, message: ""))
        }
        .store(in: &cancellables)

    }
    
}
