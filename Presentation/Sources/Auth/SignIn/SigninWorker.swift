//
//  SigninWorker.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/19.
//

import Foundation
import Domain
import Combine

protocol SigninWorkerLogic {
    func signIn(request: SigninModels.Signin.Request, _ response: @escaping (SigninModels.Signin.Response) -> Void)
    func signup(request: SigninModels.Signup.Request, _ response: @escaping (SigninModels.Signup.Response) -> Void)

}

class SigninWorker: SigninWorkerLogic {
    private var cancellables = Set<AnyCancellable>()

    func signIn(request: SigninModels.Signin.Request, _ response: @escaping (SigninModels.Signin.Response) -> Void) {
//        apiManager.signIn(account: request.account, password: request.password).sink { result in
//            switch result {
//            case .finished:
//                print("Fetch LeagueTable finished")
//            case .failure(_):
//                response(SigninModels.Signin.Response(isError: true, message: "Error"))
//            }
//        } receiveValue: { data in
//            response(SigninModels.Signin.Response(userResopnse: data, isError: false))
//        }
//        .store(in: &cancellables)

    }
    
    func signup(request: SigninModels.Signup.Request, _ response: @escaping (SigninModels.Signup.Response) -> Void) {
//        apiManager.signUp(name: request.name, account: request.account, password: request.password, nickName: request.nickName, phoneNumber: request.phoneNumber, birth: request.birth, firstTeam: request.firstTeam).sink { result in
//            
//            switch result {
//            case .finished:
//                print("Fetch LeagueTable finished")
//            case .failure(_):
//                response(SigninModels.Signup.Response(isError: true, message: "Error"))
//            }
//        } receiveValue: { data in
//            response(SigninModels.Signup.Response(response: data, isError: false))
//        }
//        .store(in: &cancellables)
    }

}
