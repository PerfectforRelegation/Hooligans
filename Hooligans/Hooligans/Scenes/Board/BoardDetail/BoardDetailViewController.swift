
import UIKit
import SnapKit

//protocol BoardDetailDisplayLogic: AnyObject {
//    func displayA(viewModel: BoardDetailModels.PostContents.ViewModel)
//}

protocol BoardDetailDisplayLogic: AnyObject {
    func displayA(viewModel: BoardListModels.PostContents.ViewModel, navigationController: UINavigationController?)
}


class BoardDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    var selectedPost: Post?

    private func displayPostDetails() {

        guard selectedPost != nil else { return }

//            titleLabel.text = post.title
//            contentLabel.text = post.content
        }


    var posts: [Post] = [
        Post(title: "첫 번째 글", content: "첫 번째 글 내용"),
        //Post(title: "두 번째 글", content: "두 번째 글 내용")
    ]

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 100
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
    }

    func setupUI() {
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }

    func setupNavigationBar() {
        // 뒤로가기
        let backButton = UIBarButtonItem(image: UIImage(named: "backIcon"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton

        // 자유게시판
        let titleView = UIView()
        let titleLabel = UILabel()
        titleLabel.text = "자유게시판"
        titleView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        navigationItem.titleView = titleView

        // 메뉴
        let menuButton = UIBarButtonItem(image: UIImage(named: "menuIcon"), style: .plain, target: self, action: #selector(menuButtonTapped))
        menuButton.tintColor = .white

        // 찾기
        let searchButton = UIBarButtonItem(image: UIImage(named: "searchIcon"), style: .plain, target: self, action: #selector(searchButtonTapped))
            searchButton.tintColor = .white
        navigationItem.rightBarButtonItems = [menuButton, searchButton]

//      // 네비게이션 바 경계선 제거
//      navigationController?.navigationBar.shadowImage = UIImage()
//            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.2, green: 0.4, blue: 0.6, alpha: 1.0)
        // back 색상 
        navigationController?.navigationBar.tintColor = .white
    }



    @objc func backButtonTapped() {
        print("DEBUG :", "clickBack")
        navigationController?.popViewController(animated: true)
    }

    @objc func searchButtonTapped() {
        print("DEBUG :", "clickSearch")
    }

    @objc func menuButtonTapped() {
        print("DEBUG :", "clickMenu")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell

        // 게시물 데이터 표시
        let post = posts[indexPath.row]
        cell.titleLabel.text = post.title
        cell.contentLabel.text = post.content

        return cell
    }
    
}
