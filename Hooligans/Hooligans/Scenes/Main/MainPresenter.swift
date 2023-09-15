//
//  MainPresenter.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/14.
//

import Foundation

protocol MainPresentationLogic: AnyObject {
    func presentationUser(response: MainModels.Users.Response)
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
}
