//
//  ChatListViewController.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/10/01.
//

import UIKit
import SnapKit
import StompClientLib
import Combine

protocol ChatRoomDisplayLogic {
    func displayChatMessage(viewModel: ChatRoomModels.ChatMessage.ViewModel)
}

class ChatRoomViewController: UIViewController {
    var interactor: (ChatRoomBusinessLogic & ChatRoomDataStore)?
    
    //    private let stomp: StompManager?
    private var cancellables = Set<AnyCancellable>()
    
    private var chatRoom: ChatRoom!
    var messages: [Message] = []
    
    private let headerView: ChatRoomHeader = ChatRoomHeader()
    
    private let teamNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        return table
    }()
    
    private let chatTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .systemGray5
        textView.layer.cornerRadius = 20
        textView.layer.masksToBounds = true
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.isScrollEnabled = false
        return textView
    }()

    private let plusButton: UIButton = {
        let button = UIButton()
        let plusImage = UIImage(systemName: "plus")
        button.setImage(plusImage, for: .normal)
        button.tintColor = .systemGray
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        return button
    }()

    private let sendButton: UIButton = {
        let button = UIButton()
        let buttonImage = UIImage(systemName: "paperplane.circle.fill")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 35))
            .withRenderingMode(.alwaysTemplate)
        button.backgroundColor = .clear
        button.setImage(buttonImage, for: .normal)
        button.tintColor = UIColor(red: 0.1529, green: 0.1804, blue: 0.498, alpha: 1.0)
        button.transform = CGAffineTransform(rotationAngle: .pi / 4)
        
        return button
    }()
    
    init(chatRoom: ChatRoom) {
        super.init(nibName: nil, bundle: nil)
        self.chatRoom = chatRoom
        headerView.configureView(chatRoom: chatRoom)
        StompManager.shard.connect(chatRoom: chatRoom, delegate: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        registerCell()
        hideKeyboardWhenTappedAround()
        tableView.delegate = self
        tableView.dataSource = self
        chatTextView.delegate = self
        let backButton = UIBarButtonItem(image: UIImage(named: "backIcon"), style: .plain, target: self, action: #selector(backAction))
        navigationItem.leftBarButtonItem = backButton
        backButton.tintColor = .black
        
        let teamNameItem = UIBarButtonItem(customView: teamNameLabel)
        navigationItem.rightBarButtonItem = teamNameItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeKeyboardNotifications()
        if let chatRoom = chatRoom {
            StompManager.shard.disconnect(chatRoom: chatRoom)
        }
    }
    
    private func setup() {
        let viewController = self
        let interactor = ChatRoomInteractor()
        let presenter = ChatRoomPresenter()
        //        let router = ChatRoomRouter()
        viewController.interactor = interactor
        //        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        //        router.viewController = viewController
        //        router.dataStore = interactor
    }
    
    private func registerCell() {
        tableView.register(ChatBubbleCell.self, forCellReuseIdentifier: ChatBubbleCell.identifier)
        tableView.register(MyChatBubbleCell.self, forCellReuseIdentifier: MyChatBubbleCell.identifier)
    }
}

extension ChatRoomViewController {
    private func setupView() {
        self.view.backgroundColor = .white

        self.view.addSubview(headerView)
        headerView.backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }

        self.view.addSubview(sendButton)
        sendButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(view.safeAreaLayoutGuide).offset(-5)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-5)
            make.height.width.equalTo(40)
        }

        sendButton.addTarget(self, action: #selector(sendMessageSTOMP), for: .touchUpInside)


        self.view.addSubview(chatTextView)
        chatTextView.snp.makeConstraints { make in
            make.trailing.equalTo(sendButton.snp.leading).offset(-5)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-5)
            make.height.equalTo(40)
            //make.width.equalTo(250)
        }

        self.view.addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(5)
            make.trailing.equalTo(chatTextView.snp.leading)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-5)
            make.height.width.equalTo(40)
        }

        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(chatTextView.snp.top).offset(-5)
        }
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
            chatTextView.snp.updateConstraints{ make in
                make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(keyboardHeight)
            }
            
            
            view.layoutIfNeeded()
        }
        
    }
    
    @objc func keyboardWillHide(_ noti: NSNotification){
        // 키보드가 사라졌을 때 코드
        chatTextView.snp.updateConstraints{ make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(5)
        }
    }
    
    @objc func plusButtonTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    @objc func sendMessageSTOMP() {
        if let chatRoom = chatRoom {
            StompManager.shard.sendMessage(type: "TALK", roomId: chatRoom.roomId.uuidString, message: self.chatTextView.text)
            self.chatTextView.text = ""
        }
    }
    
    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }
}

extension ChatRoomViewController: ChatRoomDisplayLogic {
    func displayChatMessage(viewModel: ChatRoomModels.ChatMessage.ViewModel) {
        DispatchQueue.main.async {
            self.messages.append(viewModel.message)
            self.tableView.reloadData()
        }
    }

}

extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource {
    // 높이 동적 변화
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
    }

    // 경계선 숨김
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatBubbleCell.identifier, for: indexPath) as? ChatBubbleCell else { return UITableViewCell() }
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.configureCell(message: messages[indexPath.row])
        
        return cell
    }
    
}

extension ChatRoomViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: textView.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        textView.snp.updateConstraints { make in
            // 텍스트뷰 높이 동적으로 변경
            make.height.equalTo(estimatedSize.height)
        }
    }
}

extension ChatRoomViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
        }
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

extension ChatRoomViewController: StompClientLibDelegate {
    func stompClient(client: StompClientLib!, didReceiveMessageWithJSONBody jsonBody: AnyObject?, akaStringBody stringBody: String?, withHeader header: [String : String]?, withDestination destination: String) {
        guard let response = stringBody?.data(using: .utf8) else { return }
        
        Just(response)
            .decode(type: Message.self, decoder: JSONDecoder())
            .sink { result in
                switch result {
                case .finished:
                    print("Decode Message Finished")
                case .failure(_):
                    print("Decode Fail")
                }
            } receiveValue: { message in
                self.messages.append(message)
                print(message)
                self.tableView.reloadData()
            }
            .store(in: &cancellables)
        //        self.interactor?.getChatMessage(message: response)
    }
    
    func stompClientDidDisconnect(client: StompClientLib!) {
        print("Stomp socket is disconnected")
    }
    
    func stompClientDidConnect(client: StompClientLib!) {
        print("Stomp socket is connected")
        StompManager.shard.subscribe(chatRoom: chatRoom)
    }
    
    func serverDidSendReceipt(client: StompClientLib!, withReceiptId receiptId: String) {
        print("Receipt: \(receiptId)")
    }
    
    func serverDidSendError(client: StompClientLib!, withErrorMessage description: String, detailedErrorMessage message: String?) {
        print("Error send: " + description)
        
        //        stomp.disconnect()
        //        registerSocket()
        
    }
    
    func serverDidSendPing() {
        print("Server ping")
    }
}

