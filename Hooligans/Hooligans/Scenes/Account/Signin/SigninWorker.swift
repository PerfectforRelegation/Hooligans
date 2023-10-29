//
//  SigninWorker.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/19.
//

import Foundation
import Combine

protocol SigninWorkerLogic {
    func signIn(request: SigninModels.Signin.Request, _ response: @escaping (SigninModels.Signin.Response) -> Void)

}

class SigninWorker: SigninWorkerLogic {

    let apiManager = AccountService()
    private var cancellables = Set<AnyCancellable>()

    func signIn(request: SigninModels.Signin.Request, _ response: @escaping (SigninModels.Signin.Response) -> Void) {
        apiManager.signIn(account: request.account, password: request.password).sink { result in
            switch result {
            case .finished:
                print("Fetch LeagueTable finished")
            case .failure(_):
                response(SigninModels.Signin.Response(isError: true, message: "Error"))
            }
        } receiveValue: { data in
            response(SigninModels.Signin.Response(userResopnse: data, isError: false))
        }
        .store(in: &cancellables)

    }

}
