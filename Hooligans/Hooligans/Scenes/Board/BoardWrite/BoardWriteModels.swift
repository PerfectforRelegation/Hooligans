
import Foundation

enum BoardWriteModels {
    // MARK: Usecases
    enum UploadPost {
        struct Request {
            var title: String
            var content: String
        }

        struct Response {
            var uploadPost: Board?
            var isError: Bool
            var message: String?
        }

        struct ViewModel {
            var uploadPost: Board
        }
    }
}

