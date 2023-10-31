//
//  SigninPresenter.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/19.
//

import Foundation

protocol SigninPresentationLogic: AnyObject {
    func presentationSigninError(response: SigninModels.Signin.Response)
    func presentationMainView(response: SigninModels.Signin.Response)
}

final class SigninPresenter {
    weak var viewController: SigninController?
}

extension SigninPresenter: SigninPresentationLogic {
    func presentationSigninError(response: SigninModels.Signin.Response) {
        print("Signin Error")
    }
    
    func presentationMainView(response: SigninModels.Signin.Response) {
        guard let user = response.userResopnse else { return }
        
        let viewModel = SigninModels.Signin.ViewModel(user: user)
        
        self.viewController?.displayMainView(viewModel: viewModel)
    }

}
