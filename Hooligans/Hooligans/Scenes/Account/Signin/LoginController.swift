
import UIKit

protocol LoginDisplayLogic: AnyObject {
    func displayAnything(viewModel: SigninModels.BoardContents.ViewModel)
}

class LoginController: UIViewController, UITextFieldDelegate {

    func displayAnything(viewModel: SigninModels.BoardContents.ViewModel) {
    }

    var interactor: (SigninBusinessLogic & SigninDataStore)?

    var users: [User]?
    var boardContents: [Board]?

    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }

    func setup() {
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
    private let headerView = SigninView(title: "", subTitle: "Hooligans에서 스포츠 경기를 즐기세요")

    //private let usernameField = TextField(fieldType: .username)
    private let emailField = TextField(fieldType: .email)
    private let passwordField = TextField(fieldType: .password)

    private let signInButton = Button(title: "로그인", hasBackground: true, fontSize: .big)
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
        self.navigationController?.navigationBar.isHidden = true
        //self.textField.becomeFirstResponder()
    }



    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .white

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
                self.headerView.heightAnchor.constraint(equalToConstant: 222),

                self.emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
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
                self.signInButton.heightAnchor.constraint(equalToConstant: 55),
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
        if let email = emailField.text,
           let password = passwordField.text {

            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3,}"
            if !NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email) {
                print("이메일 형식이 맞지 않습니다.")
                return
            }
            if password.count < 8 {
                print("비밀번호는 최소 8자리 이상이어야 합니다.")
                return
            }

            print("Email: \(email)")
            print("Password: \(password)")

            let signupViewController = SignupViewController()
            let navController = UINavigationController(rootViewController: signupViewController)
            self.present(navController, animated: true, completion: nil)
        }
    }


    @objc private func clickNewUser() {
        print("DEBUG :", "clickSignUp")
    }

    @objc private func clickForgotPassword() {
        print("DEBUG :", "clickForgotPassword")
    }
}
