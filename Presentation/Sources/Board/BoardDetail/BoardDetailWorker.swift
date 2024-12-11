
import Foundation
import Combine

protocol BoardDetailWorkerLogic {
    func fetchBoardDetail(id: Int, _ response: @escaping (BoardDetailModels.Content.Response) -> Void)
}

class BoardDetailWorker: BoardDetailWorkerLogic {

    var cancellables = Set<AnyCancellable>()

    func fetchBoardDetail(id: Int, _ response: @escaping (BoardDetailModels.Content.Response) -> Void) {
        
    }
}
