import UIKit


final class SigninPresenter {
    
}

extension SigninPresenter {
    func presentationSigninError(response: SigninModels.Signin.Response) {
        print("Signin Error")
    }
    
    func presentationMainView(response: SigninModels.Signin.Response) {
//        guard let user = response.userResopnse else { return }
//        
//        let viewModel = SigninModels.Signin.ViewModel(user: user)
//        
//        self.viewController?.displayMainView(viewModel: viewModel)
    }
    
    func presentationSigninView(response: SigninModels.Signup.Response) {
//        guard let response = response.response else { return }
//        
//        let viewModel = SigninModels.Signup.ViewModel(response: response)
    }

}
