//
//  NetworkService.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/14.
//

import Foundation

enum Endpoint {
    case main
    case user
    
}

extension Endpoint {
    var url: URL {
        switch self {
        case .main:
            return .endpoint("/main")
        case .user:
            return .endpoint("/user/")
        }
    }
}

private extension URL {
    static let baseURL = "http://43.201.132.71:8080"
    
    static func endpoint(_ endpoint: String) -> URL {
        guard let url = URL(string: baseURL + endpoint) else { return URL(string: "")! }
        
        return url
    }
    
}


//struct  SearchRequest: BaseRequestProtocol {
//    let term: String
//    let entity: String
//
//    var url: String {
//        return "https://itunes.apple.com/search"
//    }
//    var method: HTTPMethod {
//        return .get
//    }
//
//    var parameters: Parameters {
//        let parameter = ["term": self.term,
//                         "entity": self.entity] as [String: Any]
//
//        return parameter
//    }
//
//    var headers: HTTPHeaders {
//        return [KeyParameters.contentTypeKey: KeyParametersValues.contentTypeKey]
//    }
//}
//struct KeyParameters {
//    static var contentTypeKey = "Content-Type"
//}
//struct KeyParametersValues {
//    static var contentTypeKey = "application/json"
//}
