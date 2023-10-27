
import Foundation

protocol BoardListWorkerLogic {
//    func fetchUser(_ response: @escaping (SigninModels.BoardContents.Response) -> Void)

    func postList(_ response: @escaping (BoardListModels.PostContents.Response) -> Void)
}

class BoardListWorker: BoardListWorkerLogic {

    let apiManager = LeagueService()

    // api manager를 통해서 서버에게 요청후 돌아온 응답 처리 과정
//    func fetchUser(_ response: @escaping (SigninModels.Users.Response) -> Void) {
//        apiManager.fetchUsers { result in
//            switch result {
//            case .success(let users):
//                print(users)
//                response(SigninModels.Users.Response(users: users, isError: false, message: nil))
//            case .failure(let error):
//                response(SigninModels.Users.Response(isError: true, message: error.localizedDescription))
//            }
//        }
//    }

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
