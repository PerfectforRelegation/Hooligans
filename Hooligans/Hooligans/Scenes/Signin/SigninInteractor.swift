//
//  SigninInteractor.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/19.
//

import Foundation

protocol SigninDataStore {
    var users: [User]? { get set }
}

protocol SigninBusinessLogic {
    func fetchUsers(request: SigninModels.Users.Request)
}

class SigninInteractor: SigninDataStore, SigninBusinessLogic {

    var presenter: SigninPresentationLogic?
    var worker: SigninWorker?

    var users: [User]?

    func fetchUsers(request: SigninModels.Users.Request) {
        worker = SigninWorker()
        worker?.fetchUser({ response in
            self.presenter?.presentationUser(response: SigninModels.Users.Response(users: response.users, isError: false, message: "Fields may not be empty"))
        })
    }
}
