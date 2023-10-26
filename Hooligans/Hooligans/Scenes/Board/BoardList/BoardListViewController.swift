
import UIKit
import SnapKit

//protocol BoardListDisplayLogic: AnyObject {
//    func displayA(viewModel: BoardListModels.PostContents.ViewModel)
//}

protocol BoardListDisplayLogic: AnyObject {
    func displayA(viewModel: BoardListModels.PostContents.ViewModel, navigationController: UINavigationController?)
}

class BoardListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var posts: [Post] = [
        Post(title: "첫 번째 글", content: "첫 번째 글 내용"),
        Post(title: "첫 번째 글", content: "첫 번째 글 내용"),
        Post(title: "첫 번째 글", content: "첫 번째 글 내용"),
        Post(title: "첫 번째 글", content: "첫 번째 글 내용"),
        Post(title: "첫 번째 글", content: "첫 번째 글 내용"),
        Post(title: "첫 번째 글", content: "첫 번째 글 내용"),
        Post(title: "첫 번째 글", content: "첫 번째 글 내용"),
        Post(title: "첫 번째 글", content: "첫 번째 글 내용"),
        Post(title: "두 번째 글", content: "두 번째 글 내용")
    ]

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 100
        return tableView
    }()

    let writeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.lightGray.cgColor

        let image = UIImageView(image: UIImage(named: "writeIcon"))
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
        button.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(image.snp.trailing).offset(10)
        }

        return button
    }()

    var router: BoardListRouter?

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
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true

        view.addSubview(writeButton)

        writeButton.translatesAutoresizingMaskIntoConstraints = false
        writeButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        writeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        writeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        writeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        writeButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        writeButton.addTarget(self, action: #selector(writeButtonTapped), for: .touchUpInside)

    }

    func setupNavigationBar() {
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.barTintColor = .white

        // 뒤로가기
        let backButton = UIBarButtonItem(image: UIImage(named: "backIcon"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        backButton.tintColor = .black

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
        menuButton.tintColor = .black

        // 찾기
        let searchButton = UIBarButtonItem(image: UIImage(named: "searchIcon"), style: .plain, target: self, action: #selector(searchButtonTapped))
        searchButton.tintColor = .black

        navigationItem.rightBarButtonItems = [menuButton, searchButton]
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell

        // 게시물 데이터 표시
        let post = posts[indexPath.row]
        cell.configure(with: post)

        // 좋아요 이미지 설정
        cell.likesImageView.image = UIImage(named: "likeIcon")

        return cell
    }


    // 게시물 상세 이동
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selectedPost = posts[indexPath.row]
        let boardDetailViewController = BoardDetailViewController()

        // BoardDetailViewController에 선택된 게시물 정보 전달
        boardDetailViewController.selectedPost = selectedPost

        // 화면 전환
        navigationController?.pushViewController(boardDetailViewController, animated: true)
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

    @objc func writeButtonTapped() {
        let boardWriteViewController = BoardWriteViewController()

        navigationController?.pushViewController(boardWriteViewController, animated: true)
    }

}
