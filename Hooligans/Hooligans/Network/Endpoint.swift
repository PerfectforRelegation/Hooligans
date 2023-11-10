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
    case leagueTable = "/team/listTable"
    case fixtureList = "/fixture/list"
    case boardList = "/board/list"
    case postList = "/post/list"
    case chatList = "/chat/room"
    case signIn = "/user/login"
    case signUp = "/user/join"
    case betList = "/bet/list"
    case betting = "/point/bet"
    case myBetList = "/user/bet"
}
