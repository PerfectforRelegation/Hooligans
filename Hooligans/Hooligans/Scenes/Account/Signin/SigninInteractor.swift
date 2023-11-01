//
//  SigninInteractor.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/19.
//

import Foundation

protocol SigninDataStore {
    var user: User? { get set }
}

protocol SigninBusinessLogic {
    func signIn(request: SigninModels.Signin.Request)
}

class SigninInteractor: SigninDataStore, SigninBusinessLogic {
    var presenter: SigninPresentationLogic?
    var worker: SigninWorker?
    
    var user: User?
    
    func signIn(request: SigninModels.Signin.Request) {
        worker = SigninWorker()
        worker?.signIn(request: request) { response in
            if response.isError {
                self.presenter?.presentationSigninError(response: response)
            }
            
            if let user = response.userResopnse {
                print(user)
                UserDefault.userdeault.setUserInfo(user: user)
                self.presenter?.presentationMainView(response: response)
            }
            
        }
    }
}
