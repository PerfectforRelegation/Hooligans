//
//  UserPresenter.swift
//  Hooligans
//
//  Created by 진우's MAC book on 2023/09/20.
//

import Foundation

protocol UserPresentationLogic: AnyObject {
    func presentationUser(respones: UserModels.Users.Response)
}

final class UserPresenter {
    weak var viewController: UserDisplayLogic?
}

extension UserPresenter: UserPresentationLogic {
    
    func presentationUser(respones: UserModels.Users.Response) {
        
        guard let users = respones.users else { return }
        
        let viewModel = UserModels.Users.ViewModel(users: users)
        
        viewController?.displaySomething(viewModel: viewModel)
    }
}
