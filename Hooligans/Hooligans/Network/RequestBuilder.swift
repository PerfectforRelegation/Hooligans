//
//  RequestBuilder.swift
//  Hooligans
//
//  Created by 정명곤 on 10/18/23.
//

import Foundation

final class RequestBuilder {
    private var targetURL: URL?
    private var param: String?
    private var httpMethod: HTTPMethod = .get
    private var body: Data?
    private var headers: [String: String]? = ["Content-Type": "application/json"]
    
    func url(url: URL) -> Self {
        self.targetURL = url
        return self
    }

    func method(_ method: HTTPMethod) -> Self {
        self.httpMethod = method
        return self
    }
    
    func header() -> Self {
        if let token = UserDefault.userdeault.getToken() {
            self.headers?.updateValue(token.accessToken, forKey: "Access_Token")
            self.headers?.updateValue(token.refreshToken, forKey: "Refresh_Token")
        }
        return self
    }
    
    func body(_ body: [String: Any]) -> Self {
        let sendData = try! JSONSerialization.data(withJSONObject: body, options: [])
        self.body = sendData
        return self
    }

    func create() -> URLRequest {
        
        var request = URLRequest(url: targetURL!)
        request.httpMethod = httpMethod.rawValue.uppercased()
        
        if let body = body {
            request.httpBody = body
        }
        
        if let headers = headers {
            request.allHTTPHeaderFields = headers
        }
        
        return request
    }
}
