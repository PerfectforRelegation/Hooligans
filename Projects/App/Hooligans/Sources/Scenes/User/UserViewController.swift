//
//  UserViewController.swift
//  Hooligans
//
//  Created by 진우's MAC book on 2023/09/19.
//

import UIKit
import SnapKit

protocol UserDisplayLogic: AnyObject {
    func displaySomething(viewModel: UserModels.Users.ViewModel)
}

class UserViewController: UIViewController {
    var interactor: (UserBusinessLogic & UserDataSotre)?
    
    var users: [User]?
    
    private let userInfoView: UserInfoView = {                //   다시공부
        let view = UserInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(origin: .zero, size: .zero)
        return view
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        interactor?.fetchUsers(request: UserModels.Users.Request(count: 0))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        setupView()
        
    }
    
    func setup() {
        let viewController = self
        let interactor = UserInteractor()
        let presenter = UserPresenter()
        let router = UserRouter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
}

extension UserViewController {
    private func setupView() {                // 공부하기
        self.view.addSubview(userInfoView)
        
        userInfoView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    @objc func tapButton() {
        
    }
}

    
extension UserViewController: UserDisplayLogic {
    func displaySomething(viewModel: UserModels.Users.ViewModel) {
        DispatchQueue.main.async {
            self.users = viewModel.users
        }
    }
}
