//
//  BetInteractor.swift
//  Hooligans
//
//  Created by 정명곤 on 11/2/23.
//

import Foundation

protocol BetDataStore {
    
}

protocol BetBusinessLogic {
    func betting(request: BetModels.Betting.Request)
}

class BetInteractor: BetDataStore, BetBusinessLogic {
    var presenter: BetPresentationLogic?
    var worker: BetWorker?
    
    func betting(request: BetModels.Betting.Request) {
        worker = BetWorker()
        worker?.betting(request: request, { response in
            self.presenter?.BetResultPresentation(response: response)
        })
    }
    
}
