//
//  SigninWorker.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/19.
//

import Foundation

protocol SigninWorkerLogic {
//    func fetchUser(_ response: @escaping (SigninModels.BoardContents.Response) -> Void)

    func boardList(_ response: @escaping (SigninModels.BoardContents.Response) -> Void)
}

class SigninWorker: SigninWorkerLogic {

    let apiManager = LeagueService()

    // api manager를 통해서 서버에게 요청후 돌아온 응답 처리 과정
//    func fetchUser(_ response: @escaping (SigninModels.Users.Response) -> Void) {
//        apiManager.fetchUsers { result in
//            switch result {
//            case .success(let users):
//                print(users)
//                response(SigninModels.Users.Response(users: users, isError: false, message: nil))
//            case .failure(let error):
//                response(SigninModels.Users.Response(isError: true, message: error.localizedDescription))
//            }
//        }
//    }

    func boardList(_ response: @escaping (SigninModels.BoardContents.Response) -> Void) {
//        apiManager.boardList { result in
//            switch result {
//            case .success(let boardContents):
//                   print(boardContents)
//                response(SigninModels.BoardContents.Response(boardContents: boardContents, isError: false, message: nil))
//            case .failure(let error):
//                    response(SigninModels.BoardContents.Response(isError:true, message: error.localizedDescription))
//                }
//            }
    }
}
