//
//  Endpoint.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/18.
//

import Foundation

enum Endpoint {
    case main
    case news
    case userList
    case leagueTable
    case fixtureList
    case boardList
    case boardDetail(id: Int)
    case writeBoard
    case postList
    case chatList
    case signIn
    case signUp
    case betList
    case betting
    case myBetList
    case getReward
    
    var endpoint: String {
        switch self {
        case .main: return "/main"
        case .news: return "/news/list"
        case .userList: return "/user/userList"
        case .leagueTable: return "/team/listTable"
        case .fixtureList: return "/fixture/list"
        case .boardList: return "/board/list"
        case .boardDetail(let id): return "/board/detail/\(id)"
        case .writeBoard: return "/board/write"
        case .postList: return "/post/list"
        case .chatList: return "/chat/room"
        case .signIn: return "/user/login"
        case .signUp: return "/user/join"
        case .betList: return "/bet/list"
        case .betting: return "/point/bet"
        case .myBetList: return "/user/bet"
        case .getReward: return "/bet/reward"
        }
    }
}
