
import UIKit

protocol LoginDisplayLogic: AnyObject {
    func displayAnything(viewModel: SigninModels.BoardContents.ViewModel)
}

class LoginController: UIViewController, SigninDisplayLogic {
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

    private let usernameField = TextField(fieldType: .username)
    private let passwordField = TextField(fieldType: .password)

    private let signInButton = Button(title: "로그인", hasBackground: true, fontSize: .big)
    private let signUpButton = Button(title: "회원가입", fontSize: .med)
    private let forgotPasswordButton = Button(title: "비밀번호 찾기", fontSize: .small)

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()

        self.signInButton.addTarget(self, action: #selector(clickSignIn), for: .touchUpInside)
        self.signUpButton.addTarget(self, action: #selector(clickNewUser), for: .touchUpInside)
        self.forgotPasswordButton.addTarget(self, action: #selector(clickForgotPassword), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .white

        self.view.addSubview(headerView)
        self.view.addSubview(usernameField)
        self.view.addSubview(passwordField)
        self.view.addSubview(signInButton)
        self.view.addSubview(signUpButton)
        self.view.addSubview(forgotPasswordButton)

        headerView.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 222),

            self.usernameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            self.usernameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.usernameField.heightAnchor.constraint(equalToConstant: 55),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),

            self.passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 22),
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
        print("DEBUG :", "clickSignIn")
    }

    @objc private func clickNewUser() {
        print("DEBUG :", "clickSignUp")
    }

    @objc private func clickForgotPassword() {
        print("DEBUG :", "clickForgotPassword")
    }
}
