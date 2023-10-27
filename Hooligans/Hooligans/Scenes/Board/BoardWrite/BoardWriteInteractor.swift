
import Foundation

protocol BoardWriteDataStore {
    var users: [User]? { get set }
}

protocol BoardWriteBusinessLogic {

}

class BoardWriteInteractor: BoardWriteDataStore, BoardWriteBusinessLogic {

    var presenter: BoardWritePresentationLogic?
    var worker: BoardWriteWorker?

    var users: [User]?



//    // 서버에게 데이터 요청
//    func postList(request: BoardWriteModels.PostContents.Request) {
//        worker = BoardWriteWorker()
//        worker?.postList({ response in
//            self.presenter?.presentationUser(response: BoardWriteModels.PostContents.Response(postContents: response.postContents, isError: false, message: "Fields may not be empty"))
//        })
//    }
}
