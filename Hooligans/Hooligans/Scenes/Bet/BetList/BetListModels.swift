//
//  BetListModels.swift
//  Hooligans
//
//  Created by 정명곤 on 11/2/23.
//

import Foundation

enum BetListModels {
    
    enum BetList{
        struct Request {
            
        }
        struct Response {
            var betList: [Bet]?
            var isError: Bool
            var message: String?
        }
        struct ViewModel {
            var betList: [Bet]
        }
    }
}
