
import Foundation
import Domain


class BoardListInteractor {
    var worker: BoardListWorker?

    var users: [User]?
    var boardList: [Board]?
    var postList: [Post]?

    // 서버에게 데이터 요청
    func fetchBoardList(request: BoardListModels.BoardList.Request) {
        worker = BoardListWorker()
        worker?.fetchBoardList { response in
//            self.presenter?.presentationBoardList(response: BoardListModels.BoardList.Response(BoardList: response.BoardList, isError: false, message: "Fields may not be empty"))
        }
    }
}
