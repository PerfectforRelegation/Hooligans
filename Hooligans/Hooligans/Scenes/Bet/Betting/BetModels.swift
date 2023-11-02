//
//  BetModels.swift
//  Hooligans
//
//  Created by 정명곤 on 11/2/23.
//

import Foundation

enum BetModels {
    
    enum Betting {
        struct Request {
            let id: String
            let betPoint: Int
            let pick: String
        }
        
        struct Response {
            var point: Point?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel {
            var point: Point
        }
    }
}
