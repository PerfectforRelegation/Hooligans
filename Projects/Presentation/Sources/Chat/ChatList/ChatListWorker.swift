//
//  ChatListWorker.swift
//  Hooligans
//
//  Created by 정명곤 on 10/22/23.
//

import Foundation
import Combine


class ChatListWorker {
    var cancellables = Set<AnyCancellable>()
    
    func fetchFixtureList(_ response: @escaping (ChatListModels.FixtureList.Response) -> Void) {
//        apiManager.fetchFixtures().sink { result in
//            switch result {
//            case .finished:
//                print("Fetch LeagueTable finished")
//            case .failure(_):
//                print("fail")
//                response(ChatListModels.FixtureList.Response(isError: true, message: "Error"))
//            }
//        } receiveValue: { data in
//            response(ChatListModels.FixtureList.Response(fixtureListResponse: data, isError: false, message: nil))
//        }
//        .store(in: &cancellables)
    }
    
    func fetchChatRoomList(_ response: @escaping (ChatListModels.ChatRoomList.Response) -> Void) {
//        apiManager.fetchChatroom().sink { result in
//            switch result {
//            case .finished:
//                print("Fetch ChatRoom finished")
//            case .failure(_):
//                print("Fail")
//                response(ChatListModels.ChatRoomList.Response(isError: true, message: "JSON Decoding Error"))
//            }
//        } receiveValue: { data in
//            response(ChatListModels.ChatRoomList.Response(ChatRoomListResponse: data, isError: false))
//        }
//        .store(in: &cancellables)

    }
    
    
}
