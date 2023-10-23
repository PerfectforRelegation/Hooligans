//
//  MainViewController.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/14.
//

import UIKit
import SwiftUI
import SnapKit

protocol MainDisplayLogic: AnyObject {
    func displaySomething(viewModel: MainModels.Users.ViewModel)
}

class MainViewController: UIViewController {
    
    // MARK: - Properties
    var interactor: (MainBusinessLogic & MainDataStore)?
    var router: MainRoutingLogic?
    
    // MARK: - View Initailize
    private let headerView = HomeHeaderView()
        .backgroundColor(.gray)
    
    private var collectionView: UICollectionView = {
        let size = NSCollectionLayoutSize(widthDimension: .absolute(100), heightDimension: .fractionalHeight(0.2))
        let layout = UICollectionViewCompositionalLayout { section, _ in
            return CollectionViewLayouts.Main.allCases[section].section()
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .orange
        
        collectionView.showsVerticalScrollIndicator = false
        

        return collectionView
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
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        setupView()
        registerCells()
    }

    private func setup() {
        let viewController = self
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    private func registerCells() {
        collectionView.register(FixtureCell.self, forCellWithReuseIdentifier: FixtureCell.identifier)
    }

}

extension MainViewController {
    private func setupView() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        self.view.addSubview(headerView)
        
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(78)
        }
    }
    
    func routeToUserViewController() {
        router?.routeToUserInfo()
    }
  
    @objc func routeToChatRoom() {
        router?.routeToUserInfo()
    }
    
}

extension MainViewController: MainDisplayLogic {
    func displaySomething(viewModel: MainModels.Users.ViewModel) {
        DispatchQueue.main.async {
//            self.users = viewModel.users
//            self.tableView.reloadData()
        }
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FixtureCell.identifier,
                                                            for: indexPath) as? FixtureCell else { return UICollectionViewCell() }
        cell.configure(home: "CHE", away: "MCI")
        cell.clipsToBounds = true
        return cell
    }
    
}
