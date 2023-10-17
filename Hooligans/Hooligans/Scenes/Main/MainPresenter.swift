//
//  MainPresenter.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/14.
//

import Foundation

protocol MainPresentationLogic: AnyObject {
    func presentationUser(response: MainModels.Users.Response)
<<<<<<< Updated upstream

=======
    func presentationLeagueTable(response: MainModels.Table.Response)
>>>>>>> Stashed changes
}

final class MainPresenter {
    weak var viewController: MainDisplayLogic?
}

extension MainPresenter: MainPresentationLogic {
    
    func presentationUser(response: MainModels.Users.Response) {
        
        guard let users = response.users else { return }
        
        let viewModel = MainModels.Users.ViewModel(users: users)
        
        viewController?.displaySomething(viewModel: viewModel)
    }
    
<<<<<<< Updated upstream
=======
    func presentationLeagueTable(response: MainModels.Table.Response) {
        
        guard let table = response.table else { return }
        
        let viewModel = MainModels.Table.ViewModel(table: table)
        
        viewController?.displayLeagueTable(viewModel: viewModel)
    }
>>>>>>> Stashed changes
}
