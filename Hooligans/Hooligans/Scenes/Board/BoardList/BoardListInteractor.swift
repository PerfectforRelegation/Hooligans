
import Foundation

protocol BoardListDataStore {
    var users: [User]? { get set }
    var boardList: [Board]? { get set }
    var postList: [Post]? {get set}
}

protocol BoardListBusinessLogic {
    func fetchBoardList(request: BoardListModels.BoardList.Request)
    func postList(request: BoardListModels.PostContents.Request)
}

class BoardListInteractor: BoardListDataStore, BoardListBusinessLogic {
    var presenter: BoardListPresentationLogic?
    var worker: BoardListWorker?

    var users: [User]?
    var boardList: [Board]?
    var postList: [Post]?

    // 서버에게 데이터 요청
    func fetchBoardList(request: BoardListModels.BoardList.Request) {
        worker = BoardListWorker()
        worker?.fetchBoardList { response in
            self.presenter?.presentationBoardList(response: BoardListModels.BoardList.Response(BoardList: response.BoardList, isError: false,message: "Fields may not be empty"))
        }
    }

    // 서버에게 데이터 요청
    func postList(request: BoardListModels.PostContents.Request) {
//        worker = BoardListWorker()
//        worker?.postList({ response in
//            self.presenter?.presentationUser(response: BoardListModels.PostContents.Response(postContents: response.postContents, isError: false, message: "Fields may not be empty"))
//        })
    }
}
