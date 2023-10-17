//
//  SigninModels.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/19.
//

import Foundation

enum SigninModels {
    // MARK: Usecases
    enum BoardContents {
        struct Request {
            var count: Int
        }

        struct Response {
            var boardContents: [Board]?
            var isError: Bool
            var message: String?
        }

        struct ViewModel {
            var boardContents: [Board]
        }
    }
}
