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
    
    private let headerView: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(origin: .zero, size: .zero)
        button.setTitle("click", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.frame = CGRect(origin: .zero, size: .zero)
        table.backgroundColor = .yellow
        return table
    }()
   
    private let chatTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .blue
        return textField
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        return button
    }()
    
    init(chatRoom: ChatRoom) {
        super.init(nibName: nil, bundle: nil)
        self.chatRoom = chatRoom
        StompManager.shard.connect(chatRoom: chatRoom, delegate: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        registerCell()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        StompManager.shard.disconnect()
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
        
        self.view.addSubview(sendButton)
        
        sendButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.width.equalTo(50)
        }
        
        sendButton.addTarget(self, action: #selector(sendMessageSTOMP), for: .touchUpInside)
        
        self.view.addSubview(chatTextField)
        
        chatTextField.snp.makeConstraints { make in
//            make.trailing.equalTo(sendButton.snp.leading).inset(120)
            make.leading.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
            make.width.equalTo(120)
        }
        
        self.view.addSubview(headerView)
        
        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(80)
        }
        
        
//        self.headerView.addTarget(self, action: #selector(subscribeSTOMP), for: .touchUpInside)
        
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(chatTextField.snp.top)
        }
        
    }
    
    @objc func sendMessageSTOMP() {
        StompManager.shard.sendMessage(type: "TALK", roomId: chatRoom.roomId, message: "hi")
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if messages[indexPath.row].sender == "m" {
            guard let mycell = tableView.dequeueReusableCell(withIdentifier: MyChatBubbleCell.identifier, for: indexPath) as? MyChatBubbleCell else { return UITableViewCell() }
            mycell.chatRoomLabel.text = self.messages[indexPath.row].message
            
            return mycell
        }
        
        guard let usercell = tableView.dequeueReusableCell(withIdentifier: ChatBubbleCell.identifier, for: indexPath) as? ChatBubbleCell else { return UITableViewCell() }
        usercell.chatRoomLabel.text = self.messages[indexPath.row].message
        
        return usercell
    }
    
}

extension ChatRoomViewController: UITextFieldDelegate {
    
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

