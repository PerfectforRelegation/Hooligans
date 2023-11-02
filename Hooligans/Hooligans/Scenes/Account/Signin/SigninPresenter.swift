//
//  SigninPresenter.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/19.
//

import Foundation
import UIKit

protocol SigninPresentationLogic: AnyObject {
    func presentationSigninError(response: SigninModels.Signin.Response)
    func presentationMainView(response: SigninModels.Signin.Response)
    func presentationSigninView(response: SigninModels.Signup.Response)
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
    
    func presentationSigninView(response: SigninModels.Signup.Response) {
        guard let response = response.response else { return }
        
        let viewModel = SigninModels.Signup.ViewModel(response: response)
        DispatchQueue.main.async {
            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                sceneDelegate.changeRootViewController(SigninController(), animated: false)
            }
        }
    }

}
