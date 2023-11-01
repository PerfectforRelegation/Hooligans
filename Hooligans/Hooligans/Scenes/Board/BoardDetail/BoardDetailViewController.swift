
import UIKit
import SnapKit

//protocol BoardDetailDisplayLogic: AnyObject {
//    func displayA(viewModel: BoardDetailModels.PostContents.ViewModel)
//}

protocol BoardDetailDisplayLogic: AnyObject {
    func displayA(viewModel: BoardListModels.PostContents.ViewModel, navigationController: UINavigationController?)
}


class BoardDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    var selectedPost: Board?

    private func displayPostDetails() {

        guard selectedPost != nil else { return }

//            titleLabel.text = post.title
//            contentLabel.text = post.content
        }


    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 120
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    let commentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "댓글을 입력하세요."
        textField.backgroundColor = UIColor(red: 0.9686, green: 0.9686, blue: 0.9686, alpha: 1.0) /* #f7f7f7 */
        textField.borderStyle = .roundedRect
        return textField
    }()

    let sendButton: UIButton = {
        let button = UIButton()
        let sendImage = UIImage(named: "sendIcon")
        button.setBackgroundImage(sendImage, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
    }

    func setupUI() {
        let inputView = UIView()
        inputView.addSubview(commentTextField)
        inputView.addSubview(sendButton)

        view.addSubview(tableView)
        view.addSubview(inputView)

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)


        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        inputView.backgroundColor = .white

        inputView.translatesAutoresizingMaskIntoConstraints = false
        inputView.topAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
        inputView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        inputView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        inputView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true


//        commentTextField.rightView = sendButton
//        commentTextField.rightViewMode = .always

        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        commentTextField.topAnchor.constraint(equalTo: inputView.topAnchor, constant: 20).isActive = true
        commentTextField.leadingAnchor.constraint(equalTo: inputView.leadingAnchor, constant: 10).isActive = true
        commentTextField.widthAnchor.constraint(equalToConstant: 375).isActive = true
        commentTextField.bottomAnchor.constraint(equalTo: inputView.bottomAnchor, constant: -50).isActive = true
        commentTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true

        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.trailingAnchor.constraint(equalTo: inputView.trailingAnchor, constant: -20).isActive = true
        sendButton.centerYAnchor.constraint(equalTo: commentTextField.centerYAnchor).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 20).isActive = true

        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)

        tableView.reloadData()
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

//        // 찾기
//        let searchButton = UIBarButtonItem(image: UIImage(named: "searchIcon"), style: .plain, target: self, action: #selector(searchButtonTapped))
//            searchButton.tintColor = .black

        navigationItem.rightBarButtonItems = [menuButton]
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell

        // 게시물 데이터 표시
//        let post = posts[indexPath.row]
//        cell.configure(with: post)

        // 좋아요 이미지 설정
        cell.likesImageView.image = UIImage(named: "likeIcon")

        return cell
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

    @objc func sendButtonTapped() {
        print("DEBUG :", "clickSend")
    }
}
