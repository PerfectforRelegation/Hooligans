
import Foundation
import Domain

enum BoardDetailModels {
    // MARK: Usecases
    enum Content {
        struct Request {

        }

        struct Response {
            var boardDetail: Board?
            var isError: Bool
            var message: String?
        }

        struct ViewModel {
            var boardDetail: Board
        }
    }
}

