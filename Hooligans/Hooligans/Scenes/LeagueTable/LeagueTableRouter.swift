//
//  LeagueTableRouter.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/30.
//

import Foundation

import Foundation

protocol LeagueTableRoutingLogic {
    
}

protocol LeagueTableDataPassing {
    var dataStore: LeagueTableDataStore? { get }
}

final class LeagueTableRouter: LeagueTableRoutingLogic {
    weak var viewController: LeagueTableDisplayLogic?
    var dataStore: LeagueTableDataStore?
    
}
