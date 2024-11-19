//
//  LeagueTableModels.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/30.
//

import Foundation

enum LeagueTableModels {
    
    // MARK: Usecases
    enum Table {
        struct Request {
            
        }
        
        struct Response {
            var tableResponse: LeagueTable?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel {
            var table: LeagueTable
        }
    }
}
