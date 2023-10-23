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


class ChatRoomTableViewCell: UITableViewCell {
    static let identifier = "ChatListTableViewCell"
   
    var chatRoomLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(origin: .zero, size: .zero)
        label.text = "room1"
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupView()
        // Configure the view for the selected state
    }
    
    private func setupView() {
        self.addSubview(chatRoomLabel)
        
        chatRoomLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(20)
        }
    }
    
}

class ChatRoomViewController: UIViewController {
    
    var socketClient = StompClientLib()
    
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
        textField.backgroundColor = .gray
        return textField
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        return button
    }()
    
//    var interactor: (ChatListBusinessLogic & ChatListDataStore)?
//    var router: ChatListLogin?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        registerCell()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
        
    private func registerCell() {
        tableView.register(ChatRoomTableViewCell.self, forCellReuseIdentifier: ChatRoomTableViewCell.identifier)
    }
}

extension ChatRoomViewController {
    private func setupView() {
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(sendButton)
        
        sendButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.width.equalTo(40)
        }
        
//        sendButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        
        self.view.addSubview(chatTextField)
        
        chatTextField.snp.makeConstraints { make in
            make.trailing.equalTo(sendButton.snp.leading).inset(20)
            make.leading.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        
        self.view.addSubview(headerView)
        
        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(80)
        }
        
        
        self.headerView.addTarget(self, action: #selector(subscribeSTOMP), for: .touchUpInside)
        
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(chatTextField.snp.top)
        }
        
    }
    
    @objc func subscribeSTOMP() {
        self.registerSocket()
        self.subscribe()
        print("sub")
    }
    
    @objc func sendMessage() {
        self.sendMessage(message: "hi")
        print("send")
    }
}

//extension ChatRoomViewController: ChatListDisplayLogic {
//    
//}

extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatRoomTableViewCell.identifier, for: indexPath) as? ChatRoomTableViewCell else { return UITableViewCell() }
        cell.chatRoomLabel.text = self.messages[indexPath.row].message
        return cell
    }
    
}

extension ChatRoomViewController: StompClientLibDelegate {
    
    
    func registerSocket() {
        guard let url = URL(string: "ws://localhost:8080/ws-stomp") else { return }
        socketClient.openSocketWithURLRequest(request: NSURLRequest(url: url), delegate: self)
    }
    
    func subscribe() {
        print("Subscribe Topic")
        socketClient.subscribe(destination: "/sub/chat/room/test")
    }
    
    func sendMessage(message: String) {
        var payloadObject = [String: Any]()
        payloadObject = [
            "type": "ENTER",
            "roomId": "test",
            "sender": "myung",
            "message": message
            
        ]
        print(payloadObject)
        socketClient.sendJSONForDict(dict: payloadObject as AnyObject, toDestination: "/pub/chat/message")
    }
    
    func disconnect() {
        socketClient.disconnect()
    }
    
    func stompClient(client: StompClientLib!, didReceiveMessageWithJSONBody jsonBody: AnyObject?, akaStringBody stringBody: String?, withHeader header: [String : String]?, withDestination destination: String) {
        guard let response = stringBody?.data(using: .utf8) else { return }
        guard let message = try? JSONDecoder().decode(Message.self, from: response) else { print("JSON Decode Error")
            return
        }
        self.messages.append(message)
        tableView.reloadData()
        print("Message: \(message)")
    }
    
    func stompClientDidDisconnect(client: StompClientLib!) {
        print("Stomp socket is disconnected")
    }
    
    func stompClientDidConnect(client: StompClientLib!) {
        print("Stomp socket is connected")
        
        subscribe()
    }
    
    func serverDidSendReceipt(client: StompClientLib!, withReceiptId receiptId: String) {
        print("Receipt: \(receiptId)")
    }
    
    func serverDidSendError(client: StompClientLib!, withErrorMessage description: String, detailedErrorMessage message: String?) {
        print("Error send: " + description)
        
        socketClient.disconnect()
        registerSocket()
   
    }
    
    func serverDidSendPing() {
        print("Server ping")
    }
    
  
}
