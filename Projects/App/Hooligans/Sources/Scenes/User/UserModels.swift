//
//  UserModels.swift
//  Hooligans
//
//  Created by 진우's MAC book on 2023/09/20.
//

import Foundation

enum UserModels {
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
