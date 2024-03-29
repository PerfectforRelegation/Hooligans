//
//  MainModels.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/14.
//

import Foundation

enum MainModels {
    enum Section: Int {
        case chat
        case profile
        case result
        case fixture
        case news
    }
    
    // MARK: Usecases
    enum Main {
        struct Request {
            
        }
        
        struct Response {
            var main: MainResponse?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel {
            var mainSource: MainResponse
        }
    }
    
}
