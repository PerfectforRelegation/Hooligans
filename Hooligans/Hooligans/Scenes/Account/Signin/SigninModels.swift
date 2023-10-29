//
//  SigninModels.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/19.
//

import Foundation

enum SigninModels {
    // MARK: Usecases
    enum Signin {
        struct Request {
            var account: String
            var password: String
        }

        struct Response {
            var userResopnse: User?
            var isError: Bool
            var message: String?
        }

        struct ViewModel {
            var user: User
        }
    }
}
