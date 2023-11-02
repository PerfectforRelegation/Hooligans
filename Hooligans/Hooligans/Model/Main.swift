//
//  Main.swift
//  Hooligans
//
//  Created by 정명곤 on 11/1/23.
//

import Foundation

struct MainResponse: Codable {
    let user: MainUser
    let fixtures: [Fixture]
    let news: News
}

// MARK: - News
struct News: Codable {
    let platform: String
    let url: String
    let posts: [Post]
}

// MARK: - User
struct MainUser: Codable {
    let nickname: String
    let betPoint: Int
    let firstTeam: String?
    let secondTeam: String?
    let hirdTeam: String?
}

struct Post: Codable {
    let title: String
    let href: String
}


