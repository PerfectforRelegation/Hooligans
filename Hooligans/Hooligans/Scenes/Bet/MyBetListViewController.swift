//
//  MyBetListViewController.swift
//  Hooligans
//
//  Created by 정명곤 on 11/2/23.
//

import UIKit

protocol MyBetListDisplayLogic {
    func displayMyBetList(viewModel: BetListModels.MyBetList.ViewModel)
}

class MyBetListViewController: UIViewController {
    var interactor: (MyBetListBusinessLogic&MyBetListDataStore)?
    
    private var myBetList: [UserBet] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        return tableView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setup()
        registerCell()
        tableView.dataSource = self
        tableView.delegate = self
        interactor?.fetchMyBetList(request: BetListModels.MyBetList.Request())
        // Do any additional setup after loading the view.
        if let backButtonImage = UIImage(systemName: "chevron.backward") {
            let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backAction))
            backButton.tintColor = .black
            navigationItem.leftBarButtonItem = backButton
        }
    }
    
    private func setup() {
        let viewController = self
        let interactor = MyBetListInteractor()
        let presenter = MyBetListPresenter()
//        let router = BetListRouter()
        viewController.interactor = interactor
//        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
//        router.viewController = viewController
//        router.dataStore = interactor
    }
    
    private func registerCell() {
        tableView.register(MyBetCell.self, forCellReuseIdentifier: MyBetCell.identifier)
    }

    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }
}

extension MyBetListViewController {
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension MyBetListViewController: MyBetListDisplayLogic {
    func displayMyBetList(viewModel: BetListModels.MyBetList.ViewModel) {
        DispatchQueue.main.async {
            viewModel.betList.forEach { userbet in
                self.myBetList.append(userbet)
            }
            self.tableView.reloadData()
        }
    }
}

extension MyBetListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myBetList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor?.getReward(request: BetListModels.Reward.Request(id: myBetList[indexPath.row].id.uuidString))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyBetCell.identifier, for: indexPath) as? MyBetCell else { return UITableViewCell() }
        cell.configureCell(userBet: myBetList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
