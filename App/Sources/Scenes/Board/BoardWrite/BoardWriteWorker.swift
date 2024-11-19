
import Foundation
import Combine

protocol BoardWriteWorkerLogic {
    func addPost(title: String, content: String, _ response: @escaping (BoardWriteModels.UploadPost.Response) -> Void)
}

class BoardWriteWorker: BoardWriteWorkerLogic {

    let apiManager = BoardService()
    var cancellables = Set<AnyCancellable>()

    // api manager를 통해서 서버에게 요청후 돌아온 응답 처리 과정
    func addPost(title: String, content: String, _ response: @escaping (BoardWriteModels.UploadPost.Response) -> Void) {
    apiManager.addBoard(title: title, content: content).sink { result in
        switch result {
        case .finished:
            print("add Post finished")
        case .failure(_):
            response(BoardWriteModels.UploadPost.Response(isError: true, message: "Error"))
        }
    } receiveValue: { data in
        response(BoardWriteModels.UploadPost.Response(uploadPost: data, isError: false, message: nil))
    }
    .store(in: &cancellables)
}

}
