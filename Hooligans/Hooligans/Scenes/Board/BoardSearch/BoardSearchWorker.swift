
import Foundation

protocol BoardSearchWorkerLogic {

    func postList(_ response: @escaping (BoardSearchModels.PostContents.Response) -> Void)
}

class BoardSearchWorker: BoardSearchWorkerLogic {

//    let apiManager = APIService()

    func postList(_ response: @escaping (BoardSearchModels.PostContents.Response) -> Void) {
//        apiManager.postList { result in
//            switch result {
//            case .success(let postContents):
//                   print(postContents)
//                response(BoardSearchModels.PostContents.Response(postContents: postContents, isError: false, message: nil))
//            case .failure(let error):
//                    response(BoardSearchModels.PostContents.Response(isError:true, message: error.localizedDescription))
//                }
//            }
    }
}
