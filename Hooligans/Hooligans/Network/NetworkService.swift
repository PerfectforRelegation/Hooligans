//
//  NetworkService.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/14.
//

import Foundation
import Combine
import UIKit

enum NetworkError: Error {
    case invalidRequest
    case unknownError(message: String)
}

enum NetworkMethod: String {
    case get
    case post
    case put
    case patch
    case delete
}

final class NetworkService {
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func handleResponse(data: Data?, response: URLResponse?) -> UIImage? {
        guard
            let data,
            let image = UIImage(data: data),
            let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            return nil
        }
        
        return image
    }
    
    func request() -> AnyPublisher<UIImage?, Error> {
        
        return session.dataTaskPublisher(for: URL(string: "https://resources.premierleague.com/premierleague/badges/rb/t43.svg")!)
            .print()
            .map(handleResponse)
            .mapError({ failure in
                failure
            })
            .eraseToAnyPublisher()
    }
}

struct RequestBuilder {
    let url: URL?
    let method: NetworkMethod = .get
    let body: Data?
    let headers: [String: String]?

    func create() -> URLRequest? {
        guard let url = url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue.uppercased()
        if let body = body {
            request.httpBody = body
        }
        if let headers = headers {
            request.allHTTPHeaderFields = headers
        }
        return request
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
