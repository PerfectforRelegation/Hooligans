//
//  Endpoint.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/18.
//

import Foundation

enum Endpoint {
    case main
    case userList
    
}

extension Endpoint {
    var url: URL {
        switch self {
        case .main:
            return .endpoint("/main")
        case .userList:
            return .endpoint("/user/userList")
        }
    }
}

private extension URL {
    static let baseURL = "http://13.124.61.192:8080"
//    static let baseURL = "https://livescore6.p.rapidapi.com/leagues/v2"
    
    static func endpoint(_ endpoint: String) -> URL {
        guard let url = URL(string: baseURL + endpoint) else { return URL(string: "")! }
        
        return url
    }
    
}
