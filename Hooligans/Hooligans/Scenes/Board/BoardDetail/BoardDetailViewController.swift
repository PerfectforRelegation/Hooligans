
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

//    private func displayPostDetails() {
//        guard selectedPost != nil else { return }
////        titleLabel.text = post.title
////        contentLabel.text = post.content
//    }


    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 120
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let contextLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    init(board: Board) {
        super.init(nibName: nil, bundle: nil)
        contextLabel.text = board.content
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let commentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "댓글을 입력하세요."
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.systemIndigo.cgColor
        textField.layer.borderWidth = 0.7
        textField.layer.cornerRadius = 10
        return textField
    }()

    let sendButton: UIButton = {
        let button = UIButton()
        let sendImage = UIImage(systemName: "paperplane.fill")
        button.tintColor = .systemIndigo
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
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }

        inputView.backgroundColor = .white
        inputView.translatesAutoresizingMaskIntoConstraints = false
        inputView.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }

        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        commentTextField.borderStyle = .none
        commentTextField.layer.cornerRadius = 20
        commentTextField.layer.masksToBounds = true
        commentTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: commentTextField.frame.height))
        commentTextField.leftViewMode = .always

        commentTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalTo(10)
            make.width.equalTo(375)
            make.bottom.equalToSuperview().offset(-100)
            make.height.equalTo(45)
        }

        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.snp.makeConstraints { make in
            make.trailing.equalTo(inputView).offset(-20)
            make.centerY.equalTo(commentTextField)
            make.size.equalTo(20)
        }

        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
    }

    func setupNavigationBar() {
        // 뒤로가기
        let backButton = UIBarButtonItem(image: UIImage(named: "backIcon"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        backButton.tintColor = .white

        // 자유게시판
        let titleView = UIView()
        let titleLabel = UILabel()
        titleLabel.text = "자유게시판"
        titleLabel.textColor = .white
        titleView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        navigationItem.titleView = titleView

        // 메뉴
        let menuButton = UIBarButtonItem(image: UIImage(named: "menuIcon"), style: .plain, target: self, action: #selector(menuButtonTapped))
        menuButton.tintColor = .white

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

    @objc func sendButtonTapped() {
        print("DEBUG :", "clickSend")
    }
}
