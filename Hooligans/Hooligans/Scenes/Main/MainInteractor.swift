//
//  MainInteractor.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/14.
//

import Foundation

protocol MainDataStore {
    var users: [User]? { get set }
}

protocol MainBusinessLogic {
    func fetchUsers(request: MainModels.Users.Request)
}

class MainInteractor: MainDataStore, MainBusinessLogic {
    
    var presenter: MainPresentationLogic?
    var worker: MainWorker?
    
    var users: [User]?
    
    func fetchUsers(request: MainModels.Users.Request) {
        worker = MainWorker()
        worker?.fetchUser({ response in
            self.presenter?.presentationUser(response: MainModels.Users.Response(users: response.users, isError: false, message: "Fields may not be empty"))
        })
    }
}
