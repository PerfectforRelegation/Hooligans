
import Foundation

protocol BoardListDataStore {
    var users: [User]? { get set }
    var boardList: [Board]? { get set }
    var postList: [Post]? {get set}
}

protocol BoardListBusinessLogic {
    //func fetchUsers(request: SigninModels.Users.Request)
    func postList(request: BoardListModels.PostContents.Request)
}

class BoardListInteractor: BoardListDataStore, BoardListBusinessLogic {

    var presenter: BoardListPresentationLogic?
    var worker: BoardListWorker?

    var users: [User]?
    var boardList: [Board]?
    var postList: [Post]?

    // 서버에게 데이터 요청
//    func fetchUsers(request: SigninModels.Users.Request) {
//        worker = SigninWorker()
//        worker?.fetchUser({ response in
//            self.presenter?.presentationUser(response: SigninModels.Users.Response(users: response.users, isError: false, message: "Fields may not be empty"))
//        })
//    }

    // 서버에게 데이터 요청
    func postList(request: BoardListModels.PostContents.Request) {
        worker = BoardListWorker()
        worker?.postList({ response in
            self.presenter?.presentationUser(response: BoardListModels.PostContents.Response(postContents: response.postContents, isError: false, message: "Fields may not be empty"))
        })
    }
}
