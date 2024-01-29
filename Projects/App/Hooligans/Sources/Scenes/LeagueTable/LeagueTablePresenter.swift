//
//  LeagueTablePresenter.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/30.
//

import Foundation

protocol LeagueTablePresentationLogic: AnyObject {
    func presentationLeagueTable(response: LeagueTableModels.Table.Response)
}

final class LeagueTablePresenter {
    weak var viewController: LeagueTableDisplayLogic?
}

extension LeagueTablePresenter: LeagueTablePresentationLogic {
    
    func presentationLeagueTable(response: LeagueTableModels.Table.Response) {
        
        guard let table = response.tableResponse else { return }
        
        let viewModel = LeagueTableModels.Table.ViewModel(table: table)
        
        viewController?.displayLeagueTable(viewModel: viewModel)
    }
    
}
