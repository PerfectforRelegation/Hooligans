//
//  BetListViewController.swift
//  Hooligans
//
//  Created by 정명곤 on 11/2/23.
//

import UIKit

protocol BetListDisplayLogic: AnyObject {
    func displayBetList(viewModel: BetListModels.BetList.ViewModel)
}

class BetListViewController: UIViewController {
    var interactor: (BetListBusinessLogic & BetListDataStore)?
    var router: BetListRouter?

    private var betList: [Bet] = []

    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    // MARK: - INIT
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
        interactor?.fetchBetList(request: BetListModels.BetList.Request())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        registerCell()
        tableView.delegate = self
        tableView.dataSource = self

        //setupNavigationBarLabels()
    }

    private func setup() {
        let viewController = self
        let interactor = BetListInteractor()
        let presenter = BetListPresenter()
        let router = BetListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    private func registerCell() {
        tableView.register(BetListCell.self, forCellReuseIdentifier: BetListCell.identifier)
    }

//    private func setupNavigationBarLabels() {
//        navigationController?.navigationBar.barTintColor = .systemIndigo
//        navigationController?.navigationBar.backgroundColor = .systemIndigo
//
//        let homeTeamLabel = UILabel()
//        homeTeamLabel.text = "홈팀"
//        homeTeamLabel.textColor = .white
//        homeTeamLabel.font = UIFont.boldSystemFont(ofSize: 18)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: homeTeamLabel)
//
//        let awayTeamLabel = UILabel()
//        awayTeamLabel.text = "원정팀"
//        awayTeamLabel.textColor = .white
//        awayTeamLabel.font = UIFont.boldSystemFont(ofSize: 18)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: awayTeamLabel)
//    }
}

extension BetListViewController {
    private func setupView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension BetListViewController: BetListDisplayLogic {
    func displayBetList(viewModel: BetListModels.BetList.ViewModel) {
        DispatchQueue.main.async {
            viewModel.betList.forEach { fixture in
                self.betList.append(fixture)
            }
            self.tableView.reloadData()
        }
    }
}

extension BetListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(betList)
        return betList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BetListCell.identifier, for: indexPath) as? BetListCell else { return UITableViewCell() }
        cell.configureCell(bet: betList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToBetView(bet: betList[indexPath.row])
    }
    
}
