//
//  SigninModels.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/19.
//

import Foundation

enum SigninModels {
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
