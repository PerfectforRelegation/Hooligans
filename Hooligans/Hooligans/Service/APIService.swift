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

    let requestBoardList = get(url: Endpoint.boardList.url)

    let requestPostList = get(url: Endpoint.postList.url)
    
    // 직접적으로 서버에게 api 요청, JSON 형태의 응답을 구조체(struct, 여기선 Board)로 디코딩(decode)
    func fetchUsers(completion: @escaping (Result<[User], APIError>) -> Void) {

            // 엔드포인트 작성 후 적용
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
    
    func fetchLeagueTable(completion: @escaping (Result<LeagueTable, APIError>) -> Void) {
        
        session.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                return completion(.failure(.data))
            }
            
            guard let table = try? JSONDecoder().decode(LeagueTable.self, from: data) else {
                print(data.description)
                return completion(.failure(.decodingJSON))
            }
            
            completion(.success(table))
            
        }.resume()
    }
    
    func boardList(completion: @escaping (Result<[Board], APIError>) -> Void) {

            // 엔드포인트 작성 후 적용
            session.dataTask(with: Endpoint.boardList.url) { data, response, error in

            guard let data = data else {
                return completion(.failure(.data))
            }

            guard let boardList = try? JSONDecoder().decode([Board].self, from: data) else {
                print(data.description)
                return completion(.failure(.decodingJSON))
            }

            completion(.success(boardList))

        }.resume()

    }


    func postList(completion: @escaping (Result<[Post], APIError>) -> Void) {

            // 엔드포인트 작성 후 적용
            session.dataTask(with: Endpoint.postList.url) { data, response, error in

            guard let data = data else {
                return completion(.failure(.data))
            }

            guard let postList = try? JSONDecoder().decode([Post].self, from: data) else {
                print(data.description)
                return completion(.failure(.decodingJSON))
            }

            completion(.success(postList))

        }.resume()

    }
}
