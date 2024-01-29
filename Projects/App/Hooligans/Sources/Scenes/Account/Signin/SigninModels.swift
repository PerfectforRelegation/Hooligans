//
//  SigninModels.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/19.
//

import Foundation

enum SigninModels {
    enum Section: Int {
        case header
        case email
        case social
    }
    
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
    
    enum Signup {
        struct Request {
            var name: String
            var nickName: String
            var account: String
            var password: String
            var phoneNumber: String
            var birth: String
            var firstTeam: String
        }

        struct Response {
            var response: ResponseMessage?
            var isError: Bool
            var message: String?
        }

        struct ViewModel {
            var response: ResponseMessage
        }
    }
}
