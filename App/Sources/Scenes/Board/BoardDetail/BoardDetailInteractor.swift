
import Foundation

protocol BoardDetailDataStore {
    
}

protocol BoardDetailBusinessLogic {
    func fetchBoardDetail(id: Int, request: BoardDetailModels.Content.Request)
}

class BoardDetailInteractor: BoardDetailDataStore, BoardDetailBusinessLogic {
    var presenter: BoardDetailPresentationLogic?
    var worker: BoardDetailWorker?

    var postList: [Post]?

    // 서버에게 데이터 요청
    func fetchBoardDetail(id: Int, request: BoardDetailModels.Content.Request) {
        worker = BoardDetailWorker()
        worker?.fetchBoardDetail(id: id) { response in
            self.presenter?.presentationBoardDetail(response: BoardDetailModels.Content.Response(boardDetail: response.boardDetail, isError: false))
        }
    }
}
