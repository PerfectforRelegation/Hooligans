//
//  Board.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/26.
//

import Foundation

struct Board: Codable {
    let id: Int
    let nickname, title, content: String
    let heart, hate, view: Int
    let modified: Bool
    let boardDate: String
}

struct Post: Codable {
    let id: Int
    let nickname, title, content: String
    let heart, hate, view: Int
    let modified: Bool
    let boardDate: String
}
