//
//  WebSocket.swift
//  Hooligans
//
//  Created by 정명곤 on 10/25/23.
//

import Foundation
import SwiftStomp

final class StompManager {
    static let shard = StompManager()
    
    private var socket: SwiftStomp?
    private var subscribeList: [String: String]?
    
    let url = URL(string: "ws://13.124.61.192:8080/ws-stomp")!
    
    init() {
        socket = SwiftStomp(host: url)
        socket?.enableLogging = true
        socket?.autoReconnect = true
        
        socket?.enableAutoPing()
    }
    
    func connect(chatRoom: ChatRoom, delegate: SwiftStompDelegate) {
        
        socket?.connect()
            
    }
    
    func disconnect(chatRoom: ChatRoom) {
        sendMessage(type: "QUIT", roomId: chatRoom.roomId.uuidString, message: "")
        socket?.disconnect()
        
    }
    
    func subscribe(chatRoom: ChatRoom) {
        socket?.subscribe(to: "/sub/chat/room/\(chatRoom.roomId)")
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
        socket?.send(body: "1", to: "/pub/chat/message")
    }
}

extension StompManager: SwiftStompDelegate {
    func onConnect(swiftStomp: SwiftStomp, connectType: StompConnectType) {
        print("Stomp socket is connected")
    }
    
    func onDisconnect(swiftStomp: SwiftStomp, disconnectType: StompDisconnectType) {
        print("Stomp socket is disconnected")
    }
    
    func onMessageReceived(swiftStomp: SwiftStomp, message: Any?, messageId: String, destination: String, headers: [String : String]) {
        print(messageId)
    }
    
    func onReceipt(swiftStomp: SwiftStomp, receiptId: String) {
        print("Receipt: \(receiptId)")
    }
    
    func onError(swiftStomp: SwiftStomp, briefDescription: String, fullDescription: String?, receiptId: String?, type: StompErrorType) {
        print("Error send: ")
    }
    
    func onSocketEvent(eventName: String, description: String) {
        print("Server ping")
    }
    
}

