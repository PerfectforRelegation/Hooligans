
import UIKit

enum Auth: Int {
    case apple
    case naver
    case kakao
}

protocol SigninDisplayLogic: AnyObject {
    func displayAnything(viewModel: SigninModels.Signin.ViewModel)
    func displayMainView(viewModel: SigninModels.Signin.ViewModel)
}

final class SigninController: UIViewController {
    var interactor: (SigninBusinessLogic & SigninDataStore)?
    var router: SigninRoutingLogic?
    
    // MARK: - View Initialize
    typealias DataSource = UICollectionViewDiffableDataSource<SigninModels.Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<SigninModels.Section, Item>

    private lazy var dataSource: DataSource = configureDataSource()
    private lazy var snapshot: Snapshot = Snapshot()

    private var collectionView: UICollectionView = {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.2))
        let layout = UICollectionViewCompositionalLayout { section, _ in
            return Layouts.Signin.allCases[section].section()
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isScrollEnabled = false

        return collectionView
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
        registerCell()
        bindView()
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            UserDefaults.standard.removeObject(forKey: key.description)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    
    // MARK: - UI Components
    private let signUpButton = UIButton()
    private let forgotPasswordButton = UIButton()
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        
        collectionView.delegate = self
        collectionView.dataSource = dataSource
        
//        self.signInButton.addTarget(self, action: #selector(clickSignIn), for: .touchUpInside)
//        self.signUpButton.addTarget(self, action: #selector(clickNewUser), for: .touchUpInside)
//        self.forgotPasswordButton.addTarget(self, action: #selector(clickForgotPassword), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func registerCell() {
        collectionView.register(CollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewHeader.identifier)
        collectionView.register(SigninHeader.self, forCellWithReuseIdentifier: SigninHeader.identifier)
        collectionView.register(EmailCell.self, forCellWithReuseIdentifier: EmailCell.identifier)
        collectionView.register(SocialCell.self, forCellWithReuseIdentifier: SocialCell.identifier)
    }
    
    private func configureDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: self.collectionView) { collectionView, indexPath, item in
            guard let section = SigninModels.Section(rawValue: indexPath.section) else { return UICollectionViewCell() }
            switch section {
            case .header:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SigninHeader.identifier,
                                                                    for: indexPath) as? SigninHeader else { return UICollectionViewCell() }
                cell.configureCell(title: "")
                return cell
            case .email:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmailCell.identifier,
                                                                    for: indexPath) as? EmailCell else { return UICollectionViewCell() }
                cell.continueButton.addTarget(self, action: #selector(self.clickEmailLogin), for: .touchUpInside)
//                cell.continueButton.addTarget(self, action: #selector(<#T##@objc method#>), for: .touchUpInside)
                cell.delegate = self
                return cell
                
            case .social:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SocialCell.identifier, for: indexPath) as? SocialCell else { return UICollectionViewCell() }
                if let data = item.data as? Social { cell.configureCell(social: data) }
                let authType = Auth(rawValue: indexPath.row)
                
                switch authType {
                case .apple:
                    cell.socialButton.addTarget(self, action: #selector(self.clickNewUser), for: .touchUpInside)
                case .naver:
                    cell.socialButton.addTarget(self, action: #selector(self.clickNewUser), for: .touchUpInside)
                case .kakao:
                    cell.socialButton.addTarget(self, action: #selector(self.clickKakaoLogin), for: .touchUpInside)
                default:
                    print("error")
                }
                
                return cell
                
            }
        }

        configureHeader(of: dataSource)
        return dataSource
    }

    private func configureHeader(of dataSource: DataSource) {
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            let section = self.dataSource.snapshot().sectionIdentifiers[indexPath.section]
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                       withReuseIdentifier: CollectionViewHeader.identifier,
                                                                       for: indexPath) as? CollectionViewHeader

            return view
        }
    }
    
    private func bindView() {
        snapshot.appendSections([.header, .email, .social])
        snapshot.appendItems([Item(data: "")], toSection: .header)
        snapshot.appendItems([Item(data: "")], toSection: .email)
        snapshot.appendItems([
            Item(data: Social(platform: "네이버", color: .naver, image: "naver"))
        ], toSection: .social)
        self.dataSource.apply(self.snapshot)
    }
    
}

extension SigninController {
    // MARK: - UI Setup
    private func setupView() {
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Selectors
    
    @objc private func clickSignIn() {
       
//        guard let email = emailField.text,
//              let password = passwordField.text else {
//            
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
//
//            
//                        let signupViewController = SignupViewController()
//                        let navController = UINavigationController(rootViewController: signupViewController)
//                        self.present(navController, animated: true, completion: nil)
//            return
//        }
        
//        interactor?.signIn(request: SigninModels.Signin.Request(account: email, password: password))
        
    }
    
    @objc private func clickNewUser() {
        let phonenumberView = PhonenumberView(frame: self.view.frame)
        UIView.transition(with: phonenumberView, duration: 0.3, options: [.transitionCrossDissolve], animations: nil, completion: nil)
    }

    @objc private func clickEmailLogin() {
//        textFieldTextDidEndEditing(text: <#T##String#>, in: <#T##EmailCell#>)
    }
    
    @objc private func clickAppleLogin() {
        print("DEBUG :", "apple")
    }
    
    @objc private func clickNaverLogin() {
        print("DEBUG :", "naver")
    }
    
    @objc private func clickKakaoLogin() {
        print("DEBUG :", "kakao")
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

extension SigninController: UICollectionViewDelegate {
    
}

extension SigninController: UITextFieldDelegate, EmailCellDelegate {
    func textFieldTextDidEndEditing(email: String, password: String) {
        interactor?.signIn(request: SigninModels.Signin.Request(account: email, password: password))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let section = SigninModels.Section(rawValue: indexPath.section) else { return }
//        switch section {
//        case .header:
//            print("header")
//        case .email:
//            section.
//        case .social:
//            print("social")
//            
//        }
    
    }
    
}
