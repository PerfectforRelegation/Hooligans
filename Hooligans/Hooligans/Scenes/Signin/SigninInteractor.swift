//
//  SigninInteractor.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/19.
//

import Foundation

protocol SigninDataStore {
    var users: [User]? { get set }
    var boardList: [Board]? { get set }
}

protocol SigninBusinessLogic {
    //func fetchUsers(request: SigninModels.Users.Request)
    func boardList(request: SigninModels.BoardContents.Request)
}

class SigninInteractor: SigninDataStore, SigninBusinessLogic {

    var presenter: SigninPresentationLogic?
    var worker: SigninWorker?

    var users: [User]?
    var boardList: [Board]?

    // 서버에게 데이터 요청
//    func fetchUsers(request: SigninModels.Users.Request) {
//        worker = SigninWorker()
//        worker?.fetchUser({ response in
//            self.presenter?.presentationUser(response: SigninModels.Users.Response(users: response.users, isError: false, message: "Fields may not be empty"))
//        })
//    }

    // 서버에게 데이터 요청
    func boardList(request: SigninModels.BoardContents.Request) {
        worker = SigninWorker()
        worker?.boardList({ response in
            self.presenter?.presentationUser(response: SigninModels.BoardContents.Response(boardContents: response.boardContents, isError: false, message: "Fields may not be empty"))
        })
    }
}
