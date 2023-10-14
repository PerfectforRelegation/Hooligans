
import UIKit
import SnapKit

protocol BoardListDisplayLogic: AnyObject {
    func displayA(viewModel: BoardListModels.PostContents.ViewModel)
}

class BoardListViewController: UIViewController {

    var interactor: (BoardListBusinessLogic & BoardListDataStore)?

    var postList: [Post]?

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

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    func setup() {
        let viewController = self
        let interactor = BoardListInteractor()
        let presenter = BoardListPresenter()
        _ = BoardListRouter()
        viewController.interactor = interactor
        //        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        //        router.viewController = viewController
    }

    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        self.view.backgroundColor = .yellow
    //        tableView.delegate = self
    //        tableView.dataSource = self
    //        setupView()
    //        registerCells()
    //
    //    }

    //    func setupd() {
    //        let viewController = self
    //        let interactor = BoardListInteractor()
    //        let presenter = BoardListPresenter()
    //        _ = BoardListRouter()
    //        viewController.interactor = interactor
    ////        viewController.router = router
    //        interactor.presenter = presenter
    //        presenter.viewController = viewController
    ////        router.viewController = viewController
    //    }

    func registerCells() {
        tableView.register(TestTableViewCell.self, forCellReuseIdentifier: TestTableViewCell.identifier)
    }

}

extension BoardListViewController {
        private func setupView() {
            self.view.addSubview(tableView)

            tableView.snp.makeConstraints { make in
                make.top.leading.trailing.bottom.equalToSuperview()
            }
        }
    }

extension BoardListViewController: BoardListDisplayLogic {
        func displayA(viewModel: BoardListModels.PostContents.ViewModel) {
            DispatchQueue.main.async {
                self.postList = viewModel.postContents
                self.tableView.reloadData()
            }
        }
}


//extension BoardListViewController: UITableViewDelegate, UITableViewDataSource {
//        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return self.postList?.count ?? 0
//        }
//
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 150
//        }
//
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: BoardListTableViewCell.identifier, for: indexPath) as? BoardListTableViewCell else { return UITableViewCell() }
//            cell.label.text = self.users?[indexPath.row].name
//            return cell
//
//        }
//    }
