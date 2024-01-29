//
//  MyBetListInteractor.swift
//  Hooligans
//
//  Created by 정명곤 on 11/2/23.
//

import Foundation

protocol MyBetListDataStore {
    
}

protocol MyBetListBusinessLogic {
    func fetchMyBetList(request: BetListModels.MyBetList.Request)
    func getReward(request: BetListModels.Reward.Request)
}

class MyBetListInteractor: MyBetListDataStore, MyBetListBusinessLogic {
    var presenter: MyBetListPresentationLogic?
    var worker: MyBetListWorker?
    
    func fetchMyBetList(request: BetListModels.MyBetList.Request) {
        worker = MyBetListWorker()
        worker?.fetchMyBetList(request: request) { response in
            self.presenter?.presentationMyBetList(response: response)
        }
    }
    
    func getReward(request: BetListModels.Reward.Request) {
        worker = MyBetListWorker()
        worker?.getReward(request: request) { response in
            self.presenter?.presentationReward(response: response)
        }
    }
    
}
