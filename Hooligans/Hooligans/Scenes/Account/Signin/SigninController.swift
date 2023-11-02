
import UIKit

protocol SigninDisplayLogic: AnyObject {
    func displayAnything(viewModel: SigninModels.Signin.ViewModel)
    func displayMainView(viewModel: SigninModels.Signin.ViewModel)
}

final class SigninController: UIViewController {
    var interactor: (SigninBusinessLogic & SigninDataStore)?
    var router: SigninRoutingLogic?

    var previousEmail: String?
    var previousPassword: String?
    var previousPhoneNumber: String?
    var previousNickname: String?
    var selectedTeam: (name: String, imageName: String)?

    init() {
        super.init(nibName: nil, bundle: nil)
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            UserDefaults.standard.removeObject(forKey: key.description)
        }
        hideKeyboardWhenTappedAround()
        setup()
    }
    
    func setup() {
        let viewController = self
        let interactor = SigninInteractor()
        let presenter = SigninPresenter()
        let router = SigninRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupd() {
        let viewController = self
        let interactor = SigninInteractor()
        let presenter = SigninPresenter()
        _ = SigninRouter()
        viewController.interactor = interactor
        //        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        //        router.viewController = viewController
    }
    
    
    // MARK: - UI Components
    private let headerView = SigninView(title: "", subTitle: "")
    
    //private let usernameField = TextField(fieldType: .username)
    private let emailField = TextField(fieldType: .email)
    private let passwordField = TextField(fieldType: .password)
    
    private let signInButton = Button(title: "로그인", hasBackground: true, fontSize: .med)
    private let signUpButton = Button(title: "회원가입", fontSize: .med)
    private let forgotPasswordButton = Button(title: "비밀번호 찾기", fontSize: .small)
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        emailField.delegate = self
        passwordField.delegate = self
        
        self.signInButton.addTarget(self, action: #selector(clickSignIn), for: .touchUpInside)
        self.signUpButton.addTarget(self, action: #selector(clickNewUser), for: .touchUpInside)
        self.forgotPasswordButton.addTarget(self, action: #selector(clickForgotPassword), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}

extension SigninController {
    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "Sign in"
        
        self.view.addSubview(headerView)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(signInButton)
        self.view.addSubview(signUpButton)
        self.view.addSubview(forgotPasswordButton)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 170),
            
            self.emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            self.emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 55),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            //                self.usernameField.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -50),
            
            self.passwordField.topAnchor.constraint(equalTo:  emailField.bottomAnchor, constant: 22),
            self.passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 22),
            self.signInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 50),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 11),
            self.signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            self.signUpButton.heightAnchor.constraint(equalToConstant: 44),
            self.signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            
            self.forgotPasswordButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 11),
            self.forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            self.forgotPasswordButton.heightAnchor.constraint(equalToConstant: 44),
            self.forgotPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            
        ])
        
    }
    
    // MARK: - Selectors
    
    @objc private func clickSignIn() {
//        
        guard let email = emailField.text,
              let password = passwordField.text else {
            
//            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3,}"
//            if !NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email) {
//                print("이메일 형식이 맞지 않습니다.")
//                return
//            }
//            if password.count < 8 {
//                print("비밀번호는 최소 8자리 이상이어야 합니다.")
//                return
//            }
//            
//            print("Email: \(email)")
//            print("Password: \(password)")

            
//                        let signupViewController = SignupViewController()
//                        let navController = UINavigationController(rootViewController: signupViewController)
//                        self.present(navController, animated: true, completion: nil)
            return
        }
        
        interactor?.signIn(request: SigninModels.Signin.Request(account: email, password: password))
        
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    @objc private func clickNewUser() {
        let phonenumberView = PhonenumberView(frame: self.view.frame)
        self.view = phonenumberView
    }

    
    @objc private func clickForgotPassword() {
        print("DEBUG :", "clickForgotPassword")
    }
}

extension SigninController: SigninDisplayLogic {
    func displayAnything(viewModel: SigninModels.Signin.ViewModel) {
        
    }
    
    func displayMainView(viewModel: SigninModels.Signin.ViewModel) {
        DispatchQueue.main.async {
            self.router?.routeToMain()
        }
    }
}

extension SigninController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Animation()
    }
}

extension SigninController: UITextFieldDelegate {
    
    
    
}
