//
//  BetListInteractor.swift
//  Hooligans
//
//  Created by 정명곤 on 11/2/23.
//

import Foundation

protocol BetListDataStore {
    
}

protocol BetListBusinessLogic {
    func fetchBetList(request: BetListModels.BetList.Request)
}

class BetListInteractor: BetListDataStore, BetListBusinessLogic {
    var presenter: BetListPresentationLogic?
    var worker: BetListWorker?
    
    func fetchBetList(request: BetListModels.BetList.Request) {
        worker = BetListWorker()
        worker?.fetchBetList(request: request) { response in
            self.presenter?.presentationBetList(response: response)
        }
    }
    
    
}
