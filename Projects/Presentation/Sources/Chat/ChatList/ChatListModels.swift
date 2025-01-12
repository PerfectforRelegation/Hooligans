//
//  ChatListModels.swift
//  Hooligans
//
//  Created by 정명곤 on 10/23/23.
//

import Foundation

enum ChatListModels {
    enum Section: Int {
        case tabItem
        case pageView
    }
    
    // MARK: Usecases
    enum FixtureList {
        struct Request {
            
        }
        
        struct Response {
//            var fixtureListResponse: FixtureResponse?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel {
            var league: String
//            var fixtures: [Fixture]
        }
    }
    
    enum ChatRoomList {
        struct Request {
            
        }
        
        struct Response {
//            var ChatRoomListResponse: [ChatRoom]?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel {
//            var chatRooms: [ChatRoom]
        }
    }
}
