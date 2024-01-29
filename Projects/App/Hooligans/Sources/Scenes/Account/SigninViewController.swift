////
////  SigninViewController.swift
////  Hooligans
////
////  Created by Joseph on 2023/09/19.
////
//
//import UIKit
////import SnapKit
//
//protocol SigninDisplayLogic: AnyObject {
//    func displayAnything(viewModel: SigninModels.BoardContents.ViewModel)
//}
//

import UIKit
import SnapKit

protocol SigninDisplayLogic: AnyObject {
//    func displaySomething(viewModel: SigninModels.Users.ViewModel)
}

class SigninViewController: UIViewController, SigninDisplayLogic, UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return section
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 여기에 셀을 생성하고 설정하는 코드를 작성하세요.
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")

        // 셀에 텍스트를 설정하거나 다른 내용을 추가할 수 있습니다.
        cell.textLabel?.text = "행 \(indexPath.row)"

        return cell
    }


//    func displaySomething(viewModel: SigninModels.Users.ViewModel) {
//        
//    }

    private let header: SigninView = {
        let header = SigninView(title: "", subTitle: "")
        //header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()

    var interactor: (SigninBusinessLogic & SigninDataStore)?

    var users: [User]?

    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.frame = CGRect(origin: .zero, size: .zero)
        table.backgroundColor = .white
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
//        presenter.viewController = viewController
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
//        presenter.viewController = viewController
//        router.viewController = viewController
    }

    func registerCells() {
        tableView.register(LeagueTableViewCell.self, forCellReuseIdentifier: LeagueTableViewCell.identifier)
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

//class SigninViewController: UIViewController {
//
////    func displayAnything(viewModel: SigninModels.BoardContents.ViewMod Kel) {
////
////    }
//
////    private let header: SigninView = {
////        let header = SigninView()
////        //header.translatesAutoresizingMaskIntoConstraints = false
////        return header
////    }()
//
//    var interactor: (SigninBusinessLogic & SigninDataStore)?
//
//    var users: [User]?
//    var boardContents: [Board]?
//
//    private let tableView: UITableView = {
//        let table = UITableView()
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.frame = CGRect(origin: .zero, size: .zero)
//        table.backgroundColor = .black
//        return table
//    }()
//
//    init() {
//        super.init(nibName: nil, bundle: nil)
//        setup()
//    }
//
//    func setup() {
//        let viewController = self
//        let interactor = SigninInteractor()
//        let presenter = SigninPresenter()
//        _ = SigninRouter()
//        viewController.interactor = interactor
////        viewController.router = router
//        interactor.presenter = presenter
//        presenter.viewController = viewController
////        router.viewController = viewController
//    }
//
//
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = .yellow
//        tableView.delegate = self
//        tableView.dataSource = self
//        setupView()
//        registerCells()
//        // Do any additional setup after loading the view.
//    }
//
//    func setupd() {
//        let viewController = self
//        let interactor = SigninInteractor()
//        let presenter = SigninPresenter()
//        _ = SigninRouter()
//        viewController.interactor = interactor
////        viewController.router = router
//        interactor.presenter = presenter
//        presenter.viewController = viewController
////        router.viewController = viewController
//    }
//
//    func registerCells() {
//        tableView.register(TestTableViewCell.self, forCellReuseIdentifier: TestTableViewCell.identifier)
//    }
//
//}
//
//
//extension SigninViewController {
//    private func setupView() {
//        self.view.addSubview(tableView)
//
//        tableView.snp.makeConstraints { make in
//            make.top.leading.trailing.bottom.equalToSuperview()
//        }
//    }
//}
//
//extension SigninViewController: SigninDisplayLogic {
//    func displayAnything(viewModel: SigninModels.BoardContents.ViewModel) {
//        DispatchQueue.main.async {
//            self.boardContents = viewModel.boardContents
//            self.tableView.reloadData()
//        }
//    }
//}
//
//
//extension SigninViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.boardContents?.count ?? 0
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: SigninTableViewCell.identifier, for: indexPath) as? SigninTableViewCell else { return UITableViewCell() }
//                cell.label.text = self.users?[indexPath.row].name
//                return cell
//
//    }
//}
