//
//  SigninPresenter.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/19.
//

import Foundation

protocol SigninPresentationLogic: AnyObject {
    func presentationUser(response: SigninModels.BoardContents.Response)
}

final class SigninPresenter {
    weak var viewController: SigninDisplayLogic?
}

extension SigninPresenter: SigninPresentationLogic {

    func presentationUser(response: SigninModels.BoardContents.Response) {

        guard let boardContents = response.boardContents else { return }

        let viewModel = SigninModels.BoardContents.ViewModel(boardContents: boardContents)

        viewController?.displayAnything(viewModel: viewModel)
    }
}
