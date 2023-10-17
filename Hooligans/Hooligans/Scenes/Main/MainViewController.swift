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
    func diaplayLeagueTable(viewModel: MainModels.Table.ViewModel)
}

class MainViewController: UIViewController {
    var interactor: (MainBusinessLogic & MainDataStore)?
<<<<<<< Updated upstream
<<<<<<< Updated upstream
//    var router: MainRoutingLogic?
    
    
    private let headerView: LeagueTableHeaderView = LeagueTableHeaderView()
=======
    var router: MainRoutingLogic?
    
    private let headerView: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(origin: .zero, size: .zero)
        button.setTitle("click", for: .normal)
        return button
    }()
>>>>>>> Stashed changes
=======
//    var router: MainRoutingLogic?
    
    var leagueTable: LeagueTable
    var count: Int = 0
>>>>>>> Stashed changes
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.frame = CGRect(origin: .zero, size: .zero)
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
//        interactor?.fetchUsers(request: MainModels.Users.Request(count: 0))
<<<<<<< Updated upstream
=======
        interactor?.fetchLeagueTable(request: MainModels.LeagueTable.Request())
>>>>>>> Stashed changes
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
<<<<<<< Updated upstream
        router.viewController = viewController
<<<<<<< Updated upstream
        router.dataStore = interactor
//        router.viewController = viewController
=======
>>>>>>> Stashed changes
=======
//        router.viewController = viewController
>>>>>>> Stashed changes
    }

    func registerCells() {
        
    }

}

extension MainViewController {
    private func setupView() {
        
        self.view.addSubview(headerView)
        
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(150)
        }
        
        headerView.addTarget(self, action: #selector(routeToChatRoom), for: .touchUpInside)
        
        self.view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
//        self.view.addSubview(countLabel)
//
//        countLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(100)
//            make.centerX.equalToSuperview()
//        }
//
//        self.view.addSubview(upButton)
//
//        upButton.snp.makeConstraints { make in
//            make.top.equalTo(countLabel.snp.bottom).offset(50)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(80)
//            make.height.equalTo(50)
//        }
//
//        upButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
<<<<<<< Updated upstream
    func routeToUserViewController() {
        router?.routeToUserInfo()
    }
  
=======
    @objc func routeToChatRoom() {
        router?.routeToUserInfo()
    }
    
>>>>>>> Stashed changes
}

extension MainViewController: MainDisplayLogic {
    func displaySomething(viewModel: MainModels.Users.ViewModel) {
        DispatchQueue.main.async {
//            self.users = viewModel.users
//            self.tableView.reloadData()
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LeagueTableViewCell.identifier, for: indexPath) as? LeagueTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.routeToUserViewController()
    }
    
}
