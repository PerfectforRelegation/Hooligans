
import Foundation

enum BoardListModels {
    // MARK: Usecases
    enum PostContents {
        struct Request {
            var count: Int
        }

        struct Response {
            var postContents: [Post]?
            var isError: Bool
            var message: String?
        }

        struct ViewModel {
            var postContents: [Post]
        }
    }
}
