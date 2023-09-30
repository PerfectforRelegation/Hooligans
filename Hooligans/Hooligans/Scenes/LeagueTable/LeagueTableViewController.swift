//
//  LeagueTableViewController.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/30.
//

import UIKit

protocol LeagueTableDisplayLogic: AnyObject {
    func displayLeagueTable(viewModel: LeagueTableModels.Table.ViewModel)
    
}

class LeagueTableViewController: UIViewController {
    var interactor: (LeagueTableBusinessLogic & LeagueTableDataStore)?
    var router: LeagueTableRoutingLogic?
    
    var leagueTable: LeagueTable?
    
    private let headerView: LeagueTableHeaderView = LeagueTableHeaderView()

    private let leagueTableView: UITableView = {
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
        interactor?.fetchLeagueTable(request: LeagueTableModels.Table.Request())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        leagueTableView.delegate = self
        leagueTableView.dataSource = self
        setupView()
        registerCells()
    }

    func setup() {
        let viewController = self
        let interactor = LeagueTableInteractor()
        let presenter = LeagueTablePresenter()
        let router = LeagueTableRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }

    func registerCells() {
        leagueTableView.register(LeagueTableViewCell.self, forCellReuseIdentifier: LeagueTableViewCell.identifier)
    }
    
}

extension LeagueTableViewController {
    private func setupView() {
        
        self.view.addSubview(headerView)
        
        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(150)
        }
        
        self.view.addSubview(leagueTableView)

        leagueTableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
    }
}

extension LeagueTableViewController: LeagueTableDisplayLogic {
    func displayLeagueTable(viewModel: LeagueTableModels.Table.ViewModel) {
        DispatchQueue.main.async {
            self.leagueTable = viewModel.table
            self.leagueTableView.reloadData()
        }
    }
    
}

extension LeagueTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.leagueTableView {
            let originY: CGFloat = scrollView.contentOffset.y
            let modifiedTopHeight = headerView.maxHeight - originY
            let height = min(max(modifiedTopHeight, headerView.minHeight), headerView.maxHeight)
            
            headerView.snp.updateConstraints { make in
                make.height.equalTo(height)
                
            }
            
            headerView.headerImage.snp.updateConstraints { make in
                make.width.equalTo(height*1.8)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.leagueTable?.leaguetable.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LeagueTableViewCell.identifier, for: indexPath) as? LeagueTableViewCell else { return UITableViewCell() }
        cell.configure(rank: indexPath.row+1, team: leagueTable?.leaguetable[indexPath.row] ?? Team())
        
        return cell
    }
    
    
}
