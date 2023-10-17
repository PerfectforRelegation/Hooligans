//
//  UserWorker.swift
//  Hooligans
//
//  Created by 진우's MAC book on 2023/09/20.
//

import Foundation

protocol UserWorkerLogic {
    func fetchUser(_ response: @escaping (UserModels.Users.Response) -> Void)
}

class UserWorker: UserWorkerLogic {
    
    let apiManager = APIService()
    
    func fetchUser(_ response: @escaping (UserModels.Users.Response) -> Void) {
        apiManager.fetchUsers { result in
            switch result {
            case .success(let users):
                print(users)
                response(UserModels.Users.Response(users: users, isError: false, message: nil))
            case .failure(let error):
                print(error.localizedDescription)
                response(UserModels.Users.Response(isError: true, message: error.localizedDescription))
         }
       }
    }
}

