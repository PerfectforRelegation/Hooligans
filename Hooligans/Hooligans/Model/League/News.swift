//
//  News.swift
//  Hooligans
//
//  Created by 정명곤 on 10/29/23.
//

import Foundation

struct NewsResponse: Codable {
    let platform: String
    let url: String
    let posts: [Post]
}

struct Post: Codable {
    let title: String
    let href: String
}
