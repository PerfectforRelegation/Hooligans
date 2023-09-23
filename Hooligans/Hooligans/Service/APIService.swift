import Foundation

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
    
    let request = get(url: Endpoint.userList.url)
    
    
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
}
