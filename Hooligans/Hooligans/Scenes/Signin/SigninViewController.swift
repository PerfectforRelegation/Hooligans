//
//  SigninViewController.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/19.
//

import UIKit
import SnapKit

protocol SigninDisplayLogic: AnyObject {
    func displayAnything(viewModel: SigninModels.BoardContents.ViewModel)
}

class SigninViewController: UIViewController {

//    func displayAnything(viewModel: SigninModels.BoardContents.ViewModel) {
//
//    }

//    private let header: SigninView = {
//        let header = SigninView()
//        //header.translatesAutoresizingMaskIntoConstraints = false
//        return header
//    }()

    var interactor: (SigninBusinessLogic & SigninDataStore)?

    var users: [User]?
    var boardContents: [Board]?

    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.frame = CGRect(origin: .zero, size: .zero)
        table.backgroundColor = .black 
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

extension SigninViewController: SigninDisplayLogic {
    func displayAnything(viewModel: SigninModels.BoardContents.ViewModel) {
        DispatchQueue.main.async {
            self.boardContents = viewModel.boardContents
            self.tableView.reloadData()
        }
    }
}

extension SigninViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.boardContents?.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SigninTableViewCell.identifier, for: indexPath) as? SigninTableViewCell else { return UITableViewCell() }
                cell.label.text = self.users?[indexPath.row].name
                return cell

    }
}
