//
//  LeagueTableInteractor.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/30.
//

import Foundation

protocol LeagueTableDataStore {
    var table: LeagueTable? { get set }
}

protocol LeagueTableBusinessLogic {
    func fetchLeagueTable(request: LeagueTableModels.Table.Request)
}

class LeagueTableInteractor: LeagueTableDataStore, LeagueTableBusinessLogic {
    
    var presenter: LeagueTablePresentationLogic?
    var worker: LeagueTableWorker?
    
    var table: LeagueTable?
    
    func fetchLeagueTable(request: LeagueTableModels.Table.Request) {
        worker = LeagueTableWorker()
        worker?.fetchLeagueTable({ response in
            self.presenter?.presentationLeagueTable(response: LeagueTableModels.Table.Response(tableResponse: response.tableResponse, isError: false, message: "Field may not be empty"))
        })
    }
    
}
