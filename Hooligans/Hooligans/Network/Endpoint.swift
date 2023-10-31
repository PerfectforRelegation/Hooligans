//
//  Endpoint.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/18.
//

import Foundation

enum Endpoint: String {
    case main = "/main"
    case news = "/news/list"
    case userList = "/user/userList"
    case leagueTable = "/team/table"
    case fixtureList = "/match/table"
    case boardList = "/board/list"
    case postList = "/post/list"
    case chatList = "/chat/room"
    case signIn = "/user/login"
}
