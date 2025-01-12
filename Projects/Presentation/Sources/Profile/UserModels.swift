import Foundation
import Domain


enum UserModels {
    enum Users {
        struct Request {
            var count: Int
        }
        
        struct Response {
            var users: [User]?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel {
            var users: [User]
            
        }
    }
}
