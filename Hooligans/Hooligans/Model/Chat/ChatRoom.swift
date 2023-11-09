//
//  Chatroom.swift
//  Hooligans
//
//  Created by 정명곤 on 10/25/23.
//

import Foundation

struct ChatRoom: Codable {
    let roomId: UUID
    let name: String
    let count: Int
}

