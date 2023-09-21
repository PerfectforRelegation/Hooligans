//
//  SigninWorker.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/19.
//

import Foundation

protocol SigninWorkerLogic {
    func fetchUser(_ response: @escaping (SigninModels.Users.Response) -> Void)
}

class SigninWorker: SigninWorkerLogic {

    let apiManager = APIService()

    func fetchUser(_ response: @escaping (SigninModels.Users.Response) -> Void) {
        apiManager.fetchUsers { result in
            switch result {
            case .success(let users):
                print(users)
                response(SigninModels.Users.Response(users: users, isError: false, message: nil))
            case .failure(let error):
                response(SigninModels.Users.Response(isError: true, message: error.localizedDescription))
            }
        }
    }
}
