
import Foundation
import Combine

protocol BoardDetailWorkerLogic {
    func fetchBoardDetail(id: Int, _ response: @escaping (BoardDetailModels.Content.Response) -> Void)
}

class BoardDetailWorker: BoardDetailWorkerLogic {

    let apiManager = BoardService()
    var cancellables = Set<AnyCancellable>()

    func fetchBoardDetail(id: Int, _ response: @escaping (BoardDetailModels.Content.Response) -> Void) {
        apiManager.fetchBoardDetail(id: id).sink { result in
            switch result {
            case .finished:
                print("fetch board list finished")
            case .failure(let error):
                response(BoardDetailModels.Content.Response(isError: true, message: error.localizedDescription))
            }
        } receiveValue: { data in
            response(BoardDetailModels.Content.Response(boardDetail: data, isError: false))
        }
        .store(in: &cancellables)
    }
}
