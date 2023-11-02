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
    func fetchMainSource(request: MainModels.Main.Request)
}

class MainInteractor: MainDataStore, MainBusinessLogic {
    var presenter: MainPresentationLogic?
    var worker: MainWorker?
    
    var users: [User]?
    
    func fetchMainSource(request: MainModels.Main.Request) {
        worker = MainWorker()
        worker?.fetchMainSource({ response in
            self.presenter?.presentationMainSource(response: response)
        })
    }
    
}
