import Foundation

enum APIError: Error {
    case data
    case decodingJSON
}

class APIService {
    let session = URLSession(configuration: .default)
    
    func fetchUsers(completion: @escaping (Result<[User], APIError>) -> Void) {
        
            session.dataTask(with: Endpoint.user.url) { data, response, error in
            
            guard let data = data else {
                return completion(.failure(.data))
            }
            
            guard let users = try? JSONDecoder().decode([User].self, from: data) else {
                return completion(.failure(.decodingJSON))
            }
            
            completion(.success(users))
            
        }.resume()
        
    }
}
