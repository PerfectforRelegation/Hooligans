
import Foundation
import Combine

protocol BoardListWorkerLogic {
    func fetchBoardList(_ response: @escaping (BoardListModels.BoardList.Response) -> Void)

    func postList(_ response: @escaping (BoardListModels.PostContents.Response) -> Void)
}

class BoardListWorker: BoardListWorkerLogic {

    let apiManager = BoardService()
    var cancellables = Set<AnyCancellable>()

    // api manager를 통해서 서버에게 요청후 돌아온 응답 처리 과정
    func fetchBoardList(_ response: @escaping (BoardListModels.BoardList.Response) -> Void) {
        apiManager.fetchBoardList().sink { result in
            switch result {
            case .finished:
                print("fetch board list finished")
            case .failure(let error):
                response(BoardListModels.BoardList.Response(isError: true, message: error.localizedDescription))
            }
        } receiveValue: { data in
            response(BoardListModels.BoardList.Response(BoardList: data, isError: false))
        }
        .store(in: &cancellables)
    }

    func postList(_ response: @escaping (BoardListModels.PostContents.Response) -> Void) {
//        apiManager.postList { result in
//            switch result {
//            case .success(let postContents):
//                   print(postContents)
//                response(BoardListModels.PostContents.Response(postContents: postContents, isError: false, message: nil))
//            case .failure(let error):
//                    response(BoardListModels.PostContents.Response(isError:true, message: error.localizedDescription))
//                }
//            }
    }
}
