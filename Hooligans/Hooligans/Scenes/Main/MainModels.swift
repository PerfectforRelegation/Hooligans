//
//  MainModels.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/14.
//

import Foundation

enum MainModels {
    // MARK: Usecases
    enum Users {
        struct Request {
            var count: Int
        }
        
        struct Response {
            var users: [User]?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel {
            var users: [User]
        }
    }
}
