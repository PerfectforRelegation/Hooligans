import Foundation
import Domain

enum BoardListModels {
    // MARK: - Usecases
    enum BoardList {
        struct Request{
            
        }
        
        struct Response {
//            var BoardList: [Board]?
//            var isError: Bool
//            var message: String?
        }
        
        struct ViewModel {
//            var posts: [Board]
        }
    }
    
    enum PostContents {
        struct Request {
//            var count: Int
        }

        struct Response {
//            var postContents: [Post]?
//            var isError: Bool
//            var message: String?
        }

        struct ViewModel {
//            var postContents: [Post]
        }
    }
}
