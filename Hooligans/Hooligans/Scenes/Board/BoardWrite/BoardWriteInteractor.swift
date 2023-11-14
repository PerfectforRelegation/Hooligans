
import Foundation

protocol BoardWriteDataStore {
    
}

protocol BoardWriteBusinessLogic {
    func addPost(request: BoardWriteModels.UploadPost.Request)
}

class BoardWriteInteractor: BoardWriteDataStore, BoardWriteBusinessLogic {
    var presenter: BoardWritePresentationLogic?
    var worker: BoardWriteWorker?

    func addPost(request: BoardWriteModels.UploadPost.Request) {
        worker = BoardWriteWorker()
        worker?.addPost(title: request.title, content: request.content) { response in
            self.presenter?.presentationUploadPost(response: response)
        }
    }
}
