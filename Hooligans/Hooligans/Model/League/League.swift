//
//  League.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/20.
//

import Foundation

struct LeagueResponse: Codable {
    let Sid: String
    let Snm: String
    let Scd: String
    let badgeUrl: String
    let firstColor: String
    let Cid: String
    let Cnm: String
    let Csnm: String
    let Ccd: String
    let CompId: String
    let CompN: String
    let CompD: String
    let CompST: String
    let Scu: Int
    let Sds: String
    let Chi: Int
    let Shi: Int
    let Ccdiso: String
    let Sdn: String
    let LeagueTable: LeagueTable

    enum CodingKeys: String, CodingKey {
        case Sid
        case Snm
        case Scd
        case badgeUrl
        case firstColor
        case Cid
        case Cnm
        case Csnm
        case Ccd
        case CompId
        case CompN
        case CompD
        case CompST
        case Scu
        case Sds
        case Chi
        case Shi
        case Ccdiso
        case Sdn
        case LeagueTable
    }
}

struct LeagueTable: Codable {
    let L: [League]

    enum CodingKeys: String, CodingKey {
        case L
    }
}

struct League: Codable {
    let Tables: [Table]

    enum CodingKeys: String, CodingKey {
        case Tables
    }
}

struct Table: Codable {
    let LTT: Int
    let team: [Team]

    enum CodingKeys: String, CodingKey {
        case LTT
        case team
    }
}
