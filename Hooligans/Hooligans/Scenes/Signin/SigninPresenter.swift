//
//  SigninPresenter.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/19.
//

import Foundation

protocol SigninPresentationLogic: AnyObject {
    func presentationUser(response: SigninModels.Users.Response)
}

final class SigninPresenter {
    weak var viewController: SigninDisplayLogic?
}

extension SigninPresenter: SigninPresentationLogic {

    func presentationUser(response: SigninModels.Users.Response) {

        guard let users = response.users else { return }

        let viewModel = SigninModels.Users.ViewModel(users: users)

        viewController?.displaySomething(viewModel: viewModel)
    }
}
