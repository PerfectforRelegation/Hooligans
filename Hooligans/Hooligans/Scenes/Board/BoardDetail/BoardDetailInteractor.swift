
import Foundation

protocol BoardDetailDataStore {
    var users: [User]? { get set }
    var boardList: [Board]? { get set }
    var postList: [Post]? {get set}
}

protocol BoardDetailBusinessLogic {
    //func fetchUsers(request: SigninModels.Users.Request)
    func postList(request: BoardDetailModels.PostContents.Request)
}

class BoardDetailInteractor: BoardDetailDataStore, BoardDetailBusinessLogic {

    var presenter: BoardDetailPresentationLogic?
    var worker: BoardDetailWorker?

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
    func postList(request: BoardDetailModels.PostContents.Request) {
        worker = BoardDetailWorker()
        worker?.postList({ response in
            self.presenter?.presentationUser(response: BoardDetailModels.PostContents.Response(postContents: response.postContents, isError: false, message: "Fields may not be empty"))
        })
    }
}
