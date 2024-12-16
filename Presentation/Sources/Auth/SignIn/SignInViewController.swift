import UIKit
import Domain
import SnapKit
import RxSwift


enum Auth: Int {
  case apple
  case naver
  case kakao
}


public final class SignInViewController: UIViewController {
  // MARK: - Properties
  private let viewModel: MainViewModel

  //  CollectionView CompositionalLayout
  //      typealias DataSource = UICollectionViewDiffableDataSource<SigninModels.Section, Item>
  //      typealias Snapshot = NSDiffableDataSourceSnapshot<SigninModels.Section, Item>
  //
  //      private lazy var dataSource: DataSource = configureDataSource()
  //      private lazy var snapshot: Snapshot = Snapshot()

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

  // MARK: - Initialize
  public init(viewModel: MainViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - UI Components
  private let signUpButton = UIButton()
  private let forgotPasswordButton = UIButton()


  // MARK: - LifeCycle
  public override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .blue
    setup()

    //    collectionView.delegate = self
    //    collectionView.dataSource = dataSource

  }

  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

  }




}

extension SignInViewController {
  // MARK: - Setup
  private func setup() {
    setView()
    setLayout()
    bind()
  }

  private func bind() {

  }

  private func setView() {
    self.view.addSubview(collectionView)

  }

  private func setLayout() {
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

extension SignInViewController: UICollectionViewDelegate {

}
