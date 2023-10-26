
import Foundation

protocol BoardSearchDataStore {
    var users: [User]? { get set }
    var boardList: [Board]? { get set }
    var postList: [Post]? {get set}
}

protocol BoardSearchBusinessLogic {
    //func fetchUsers(request: SigninModels.Users.Request)
    func postList(request: BoardListModels.PostContents.Request)
}

class BoardSearchInteractor: BoardSearchDataStore, BoardSearchBusinessLogic {

    var presenter: BoardSearchPresentationLogic?
    var worker: BoardSearchWorker?

    var users: [User]?
    var boardList: [Board]?
    var postList: [Post]?

    // 서버에게 데이터 요청
    func postList(request: BoardListModels.PostContents.Request) {
        worker = BoardSearchWorker()
        worker?.postList({ response in
            self.presenter?.presentationUser(response: BoardSearchModels.PostContents.Response(postContents: response.postContents, isError: false, message: "Fields may not be empty"))
        })
    }
}
