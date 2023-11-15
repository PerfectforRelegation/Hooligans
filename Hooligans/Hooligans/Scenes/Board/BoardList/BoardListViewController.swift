
import UIKit
import SnapKit

protocol BoardListDisplayLogic: AnyObject {
    func displayBoardList(viewModel: BoardListModels.BoardList.ViewModel)
}

class BoardListViewController: UIViewController {
    var interactor: (BoardListBusinessLogic & BoardListDataStore)?
    var router: BoardListRoutingLogic?
    
    var posts: [Board]?
    var refresh: UIRefreshControl?

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 150
        return tableView
    }()
    
    private let navigationBar = NavigationBar(background: .systemIndigo, title: "자유게시판")

    let writeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemIndigo
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor.systemIndigo.withAlphaComponent(0.9)

        let image = UIImageView(image: UIImage(systemName: "pencil"))
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        button.addSubview(image)
        image.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(button.snp.leading).offset(10)
            make.width.height.equalTo(20)
        }

        let label = UILabel()
        label.text = "글 쓰기"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.white
        button.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(image.snp.trailing).offset(10)
        }

        return button
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
        posts = [Board]()
        refresh = UIRefreshControl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupView()
        interactor?.fetchBoardList(request: BoardListModels.BoardList.Request())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setup() {
        let viewcontroller = self
        let interactor = BoardListInteractor()
        let presenter = BoardListPresenter()
        let router = BoardListRouter()
        viewcontroller.interactor = interactor
        viewcontroller.router = router
        interactor.presenter = presenter
        presenter.viewController = viewcontroller
        router.viewController = viewcontroller
    }

}

extension BoardListViewController {
    private func setupView() {
        view.addSubview(navigationBar)
        navigationBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }

        view.addSubview(writeButton)
        writeButton.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
        }
        writeButton.addTarget(self, action: #selector(writeButtonTapped), for: .touchUpInside)
    }
}

extension BoardListViewController: BoardListDisplayLogic {
    func displayBoardList(viewModel: BoardListModels.BoardList.ViewModel) {
        DispatchQueue.main.async {
            self.posts = viewModel.posts
            self.tableView.reloadData()
        }
    }
    
    @objc func backButtonTapped() {
        print("DEBUG :", "clickBack")
        navigationController?.popViewController(animated: true)
    }

    @objc func searchButtonTapped() {
        let boardSearchViewController = BoardSearchViewController()

        navigationController?.pushViewController(boardSearchViewController, animated: true)
    }

    @objc func menuButtonTapped() {
        let menuVC = BoardMenuViewController()

        menuVC.modalPresentationStyle = .overCurrentContext
        menuVC.view.backgroundColor = UIColor.black.withAlphaComponent(0)
        present(menuVC, animated: false) {
            let menuHeight: CGFloat = 300
            menuVC.view.frame = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: menuHeight)
            UIView.animate(withDuration: 0.2) {
                menuVC.view.frame = CGRect(x: 0, y: self.view.frame.height - menuHeight, width: self.view.frame.width, height: menuHeight)
            }
        }
    }

    @objc func writeButtonTapped() {
        let boardWriteViewController = BoardWriteViewController()

        navigationController?.pushViewController(boardWriteViewController, animated: true)
    }
}

extension BoardListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell

        // 게시물 데이터 표시
        if let post = posts?[indexPath.row] {
            cell.configure(with: post)
        }

        // 좋아요 이미지 설정
//        cell.likesImageView.image = UIImage(named: "likeIcon")

        return cell
    }

    // 게시물 상세 이동
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedPost = posts?[indexPath.row] else { return }
        router?.routeToBoardDetail(board: selectedPost)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func initRefresh() {
        refresh?.addTarget(self, action: #selector(refreshTable(refresh:)), for: .valueChanged)
        refresh?.backgroundColor = UIColor.clear
        self.tableView.refreshControl = refresh
    }
    
    @objc func refreshTable(refresh: UIRefreshControl) {
        print("refreshTable")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.interactor?.fetchBoardList(request: BoardListModels.BoardList.Request())
            self.tableView.reloadData()
            refresh.endRefreshing()
        }
    }
    
    //MARK: - UIRefreshControl of ScrollView
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if(velocity.y < -0.1) {
            self.refreshTable(refresh: self.refresh!)
        }
    }
}
