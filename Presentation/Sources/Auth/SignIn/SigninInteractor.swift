//
//  SigninInteractor.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/19.
//

import Foundation
import Domain

protocol SigninDataStore {
    var user: User? { get set }
}

protocol SigninBusinessLogic {

}

class SigninInteractor: SigninDataStore, SigninBusinessLogic {
    
    var user: User?
    
    func signIn(request: SigninModels.Signin.Request) {

    }
    
    func signUp(request: SigninModels.Signup.Request) {

    }
}
