import Foundation
import Combine

enum APIError: Error {
    case data
    case decodingJSON
}

enum HTTPMethod {
    case get
    case post
    case put
}

func get(url: URL) -> URLRequest {
    var request = URLRequest(url: url)
    request.httpMethod = "GET"

    return request
}



class APIService {
    let session = URLSession(configuration: .default)
    
    let request = get(url: Endpoint.leagueTable.url)
    
    var cancelBag = Set<AnyCancellable>()
    
    
    func fetchUsers(completion: @escaping (Result<[User], APIError>) -> Void) {
        
            session.dataTask(with: Endpoint.userList.url) { data, response, error in
                
            guard let data = data else {
                return completion(.failure(.data))
            }
            
            guard let users = try? JSONDecoder().decode([User].self, from: data) else {
                print(data.description)
                return completion(.failure(.decodingJSON))
            }
            
            completion(.success(users))
            
        }.resume()
        
    }
    
    func fetchLeagueTable() -> AnyPublisher<LeagueTable, Error> {
        
        let url = Endpoint.leagueTable.url
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: LeagueTable.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
        
        //        session.dataTask(with: request) { data, response, error in
        //
        //            guard let data = data else {
//                return completion(.failure(.data))
//            }
//
//            guard let table = try? JSONDecoder().decode(LeagueTable.self, from: data) else {
//                print(String(data: data, encoding: String.Encoding.utf8))
//                print("decoding Error")
//                return completion(.failure(.decodingJSON))
//            }
//
//            completion(.success(table))
//
//        }.resume()
    }
}
