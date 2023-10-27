//
//  Fixture.swift
//  Hooligans
//
//  Created by 정명곤 on 10/22/23.
//

import Foundation

struct FixtureResponse: Codable {
    let league: String
    let fixtures: [Fixture]
}

struct Fixture: Codable {
    let date: String
    let stadium: String
    let home: String
    let homeScore: Int
    let away: String
    let awayScore: Int
    let time: String
    let isLive: Bool
}
