//
//  WebSocket.swift
//  Hooligans
//
//  Created by 정명곤 on 10/25/23.
//

import Foundation
import StompClientLib

final class StompManager {
    static let shard = StompManager()
    
    private var socket: StompClientLib?
    private var subscribeList: [String: String]?
    
    let url = URL(string: "ws://13.124.61.192:8080/ws-stomp")!
    
    init() {
        socket = StompClientLib()
    }
    
    func connect(chatRoom: ChatRoom, delegate: StompClientLibDelegate) {
        
        socket?.openSocketWithURLRequest(request: NSURLRequest(url: url), delegate: delegate)
            
    }
    
    func disconnect(chatRoom: ChatRoom) {
        sendMessage(type: "QUIT", roomId: chatRoom.roomId.uuidString, message: "")
        socket?.disconnect()
        
    }
    
    func subscribe(chatRoom: ChatRoom) {
        socket?.subscribe(destination: "/sub/chat/room/\(chatRoom.roomId)")
        sendMessage(type: "ENTER", roomId: chatRoom.roomId.uuidString, message: "HI")
        return
    }
    
    func sendMessage(type: String, roomId: String, message: String = "") {
        guard let userName = UserDefaults.standard.string(forKey: "name") else { return }
        
        var payloadObject = [String: Any]()
        payloadObject = [
            "type": type,
            "roomId": roomId,
            "sender": userName,
            "message": message

        ]
        
        socket?.sendJSONForDict(dict: payloadObject as AnyObject, toDestination: "/pub/chat/message")
    }
}

extension StompManager: StompClientLibDelegate {
    
    func stompClient(client: StompClientLib!, didReceiveMessageWithJSONBody jsonBody: AnyObject?, akaStringBody stringBody: String?, withHeader header: [String : String]?, withDestination destination: String) {
        guard let response = stringBody?.data(using: .utf8) else { return }
        
//        self.interactor?.getChatMessage(message: response)
    }
    
    func stompClientDidDisconnect(client: StompClientLib!) {
        print("Stomp socket is disconnected")
    }
    
    func stompClientDidConnect(client: StompClientLib!) {
        print("Stomp socket is connected")
        
//        stomp?.stomp.subscribe(destination: "/sub/chat/room/test")
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

