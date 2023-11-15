
import UIKit
import SnapKit

protocol BoardDetailDisplayLogic: AnyObject {
    func displayBoardContent(viewModel: BoardDetailModels.Content.ViewModel)
}

class BoardDetailViewController: UIViewController {
    var interactor: (BoardDetailBusinessLogic & BoardDetailDataStore)?
    
    private var board: Board?
    
    private let navigationBar = NavigationBar(background: .systemIndigo, leftItem: UIImage(systemName: "chevron.left"), title: "자유게시판")
    private let contentView = BoardDetailContentView()

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 120
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
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
    
    init(board: Board) {
        super.init(nibName: nil, bundle: nil)
        self.board = board
        setup()
        interactor?.fetchBoardDetail(id: board.id, request: BoardDetailModels.Content.Request())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addKeyboardNotifications()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        registerCell()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeKeyboardNotifications()
    }
    
    private func setup() {
        let viewcontroller = self
        let interactor = BoardDetailInteractor()
        let presenter = BoardDetailPresenter()
        viewcontroller.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewcontroller
    }
    
    private func registerCell() {
        tableView.register(CommentCell.self, forCellReuseIdentifier: CommentCell.identifier)
    }
    
}

extension BoardDetailViewController {
    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(navigationBar)
        navigationBar.leftItem.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        navigationBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
        
        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        let inputView = UIView()
        inputView.addSubview(commentTextField)
        inputView.addSubview(sendButton)

        view.addSubview(tableView)
        view.addSubview(inputView)

        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.bottom).offset(15)
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
    
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // 노티피케이션을 추가하는 메서드
    func addKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        // 키보드가 사라질 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // 노티피케이션을 제거하는 메서드
    func removeKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메서드 제거
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification , object: nil)
        // 키보드가 사라질 때 앱에게 알리는 메서드 제거
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ noti: NSNotification){
        // 키보드가 나타날 때 코드
        if let keyboardFrame: NSValue = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            let bottomInset = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.safeAreaInsets.bottom ?? 0
            let adjustedKeyboardHeight = keyboardHeight - bottomInset
            // bottomBaseView의 높이를 올려준다
            
            
            view.layoutIfNeeded()
        }
        
    }
    
    @objc func keyboardWillHide(_ noti: NSNotification){
        // 키보드가 사라졌을 때 코드
        
    }
}

extension BoardDetailViewController: BoardDetailDisplayLogic {
    func displayBoardContent(viewModel: BoardDetailModels.Content.ViewModel) {
        DispatchQueue.main.async {
            self.board = viewModel.boardDetail
            self.contentView.configureCell(board: self.board!)
            self.tableView.reloadData()
        }
    }
}

extension BoardDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let commentCount = board?.comments?.count else { return "" }
        return "댓글 \(commentCount)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.board?.comments?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: CommentCell.identifier, for: indexPath) as! CommentCell
        if let comment = board?.comments?[indexPath.row] {
            cell.configureCell(comment: comment)
        }
        return cell
    }
}
