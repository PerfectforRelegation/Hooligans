//
//  Bet.swift
//  Hooligans
//
//  Created by 정명곤 on 11/2/23.
//

import Foundation

struct Bet: Codable {
    let id: UUID
    let home: String
    let away: String
    let homeAllocation: Double
    let awayAllocation: Double
    let drawAllocation: Double
    let win: String?
}

struct BetResult: Codable {
    let betId: UUID
    let date: String
    let home: String
    let away: String
    let allocation: Double?
    let point: Int
    let win: String?
    let getReward: Bool
}

struct Point: Codable {
    let id: UUID
    let betPoint: Int
    let pick: String
    let result: Bool
}

struct UserBet: Codable {
    let id: UUID
    let home: String
    let away: String
    let homeAllocation: Double
    let awayAllocation: Double
    let drawAllocation: Double
    let win: String?
    let point: Point
}
