//
//  UserInteractor.swift
//  Hooligans
//
//  Created by 진우's MAC book on 2023/09/20.
//

import Foundation

protocol UserDataSotre {
    var user: [User]? { get set }
}

protocol UserBusinessLogic {
    func fetchUsers(request: UserModels.Users.Request)
}

class UserInteractor: UserDataSotre, UserBusinessLogic {

    var presenter: UserPresentationLogic?
    var worker: UserWorker?
    
    var user: [User]?
    
    func fetchUsers(request: UserModels.Users.Request) {
        worker = UserWorker()
        worker?.fetchUser({ response in
            self.presenter?.presentationUser(respones: UserModels.Users.Response(users: response.users, isError: false, message: "Fields may not be empty"))
        })
    }
}
