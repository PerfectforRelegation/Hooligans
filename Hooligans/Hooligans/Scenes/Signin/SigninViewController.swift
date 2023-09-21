//
//  SigninViewController.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/19.
//

import UIKit
import SnapKit

protocol SigninDisplayLogic: AnyObject {
    func displaySomething(viewModel: SigninModels.Users.ViewModel)
}

class SigninViewController: UIViewController, SigninDisplayLogic, UITableViewDelegate, UITableViewDataSource {

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }

    func displaySomething(viewModel: SigninModels.Users.ViewModel) {
        
    }

    private let header: SigninView = {
        let header = SigninView()
//        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()

    var interactor: (SigninBusinessLogic & SigninDataStore)?

    var users: [User]?

    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.frame = CGRect(origin: .zero, size: .zero)
        table.backgroundColor = .blue
        return table
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }

    func setup() {
        let viewController = self
        let interactor = SigninInteractor()
        let presenter = SigninPresenter()
        let router = SigninRouter()
        viewController.interactor = interactor
//        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
//        router.viewController = viewController
    }



    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        tableView.delegate = self
        tableView.dataSource = self
        setupView()
        registerCells()
        // Do any additional setup after loading the view.
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

    func registerCells() {
        tableView.register(TestTableViewCell.self, forCellReuseIdentifier: TestTableViewCell.identifier)
    }

}

extension SigninViewController {
    private func setupView() {
        self.view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}

