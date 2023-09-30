//
//  MainWorker.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/14.
//

import Foundation
import Combine

protocol MainWorkerLogic {
    func fetchUser(_ response: @escaping (MainModels.Users.Response) -> Void)
}

class MainWorker: MainWorkerLogic {
    
    let apiManager = APIService()
    
    var cancellables = Set<AnyCancellable>()
    
    func fetchUser(_ response: @escaping (MainModels.Users.Response) -> Void) {
        apiManager.fetchUsers { result in
            switch result {
            case .success(let users):
                print(users)
                response(MainModels.Users.Response(users: users, isError: false, message: nil))
            case .failure(let error):
                print(error.localizedDescription)
                response(MainModels.Users.Response(isError: true, message: error.localizedDescription))
            }
        }
    }
    
    
}
