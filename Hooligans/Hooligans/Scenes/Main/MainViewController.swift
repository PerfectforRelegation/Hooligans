//
//  MainViewController.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/14.
//

import UIKit
import SnapKit

protocol MainDisplayLogic: AnyObject {
    func displaySomething(viewModel: MainModels.Users.ViewModel)
}

class MainViewController: UIViewController {
    var interactor: (MainBusinessLogic & MainDataStore)?
//    var router: MainRoutingLogic?
    
    var users: [User]?
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.frame = CGRect(origin: .zero, size: .zero)
        table.backgroundColor = .green
        return table
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
        interactor?.fetchUsers(request: MainModels.Users.Request(count: 0))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        tableView.delegate = self
        tableView.dataSource = self
        setupView()
        registerCells()
    }
    
    func setup() {
        let viewController = self
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter()
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

extension MainViewController {
    private func setupView() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension MainViewController: MainDisplayLogic {
    func displaySomething(viewModel: MainModels.Users.ViewModel) {
        DispatchQueue.main.async {
            self.users = viewModel.users
            self.tableView.reloadData()
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TestTableViewCell.identifier, for: indexPath) as? TestTableViewCell else { return UITableViewCell() }
        cell.label.text = self.users?[indexPath.row].name
        cell.date.text = self.users?[indexPath.row].date
        return cell
    }
    
}
