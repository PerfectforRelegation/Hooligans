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
    func betting()
}

class BetInteractor: BetDataStore, BetBusinessLogic {
    func betting() {
        print()
    }
    
    var presenter: BetPresentationLogic?
    var worker: BetWorker?
    
//    worker = BetWorker()
//    worker?.betting()
//    func betting() {
//        
//    }
}
