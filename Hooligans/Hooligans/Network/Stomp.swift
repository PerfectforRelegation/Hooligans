//
//  WebSocket.swift
//  Hooligans
//
//  Created by 정명곤 on 10/25/23.
//

import Foundation
import StompClientLib

final class Stomp {
    static let shard = StompClientLib()
    
    let stomp = StompClientLib()
    
//    var subscribeList: [String] = []
}

//extension Stomp: StompClientLibDelegate {
//    func stompClient(client: StompClientLib.StompClientLib!, didReceiveMessageWithJSONBody jsonBody: AnyObject?, akaStringBody stringBody: String?, withHeader header: [String : String]?, withDestination destination: String) {
//        <#code#>
//    }
//    
//    func stompClientDidDisconnect(client: StompClientLib.StompClientLib!) {
//        <#code#>
//    }
//    
//    func stompClientDidConnect(client: StompClientLib.StompClientLib!) {
//        <#code#>
//    }
//    
//    func serverDidSendReceipt(client: StompClientLib.StompClientLib!, withReceiptId receiptId: String) {
//        <#code#>
//    }
//    
//    func serverDidSendError(client: StompClientLib.StompClientLib!, withErrorMessage description: String, detailedErrorMessage message: String?) {
//        <#code#>
//    }
//    
//    func serverDidSendPing() {
//        <#code#>
//    }
//    
//    
//}
