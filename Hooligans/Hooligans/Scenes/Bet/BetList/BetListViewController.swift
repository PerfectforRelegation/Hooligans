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

    private let myBetListButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        button.setTitle("내 배팅 리스트", for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()

    private let homeTeamText: UILabel = {
        let label = UILabel()
        label.text = "홈팀"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        //label.textAlignment = .left
        return label
    }()

    private let awayTeamText: UILabel = {
        let label = UILabel()
        label.text = "원정팀"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()

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
        
        setupHeaderLabel()
        setupView()
        registerCell()
        tableView.delegate = self
        tableView.dataSource = self

//        let button = UIBarButtonItem(title: "내 배팅 리스트", style: .plain, target: self, action: #selector(myBetList))
//        button.tintColor = .white
//        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = button

        if let titleImage = UIImage(systemName: "gamecontroller.fill") {
            let titleImageView = UIImageView(image: titleImage)
            titleImageView.tintColor = .white
            navigationItem.titleView = titleImageView
        }

        if let buttonImage = UIImage(systemName: "list.bullet.rectangle") { //rectangle.and.pencil.and.ellipsis
            let button = UIBarButtonItem(image: buttonImage, style: .plain, target: self, action: #selector(myBetList))
            button.tintColor = .white
            self.navigationController?.navigationBar.topItem?.rightBarButtonItem = button
        }
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

    private func setupHeaderLabel() {
        view.backgroundColor = .systemIndigo

        view.addSubview(homeTeamText)
        homeTeamText.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().inset(40)
        }

        view.addSubview(awayTeamText)
        awayTeamText.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.trailing.equalToSuperview().inset(35)
        }

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

    private func registerCell() {
        tableView.register(BetListCell.self, forCellReuseIdentifier: BetListCell.identifier)
    }
}

extension BetListViewController {
    private func setupView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            //            make.edges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

    @objc func myBetList() {
        router?.routeToMyBetList()
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
