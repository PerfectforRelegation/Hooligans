
import Foundation

protocol BoardListPresentationLogic: AnyObject {
    func presentationBoardList(response: BoardListModels.BoardList.Response)
}

final class BoardListPresenter {
    weak var viewController: BoardListDisplayLogic?
}

extension BoardListPresenter: BoardListPresentationLogic {

    func presentationBoardList(response: BoardListModels.BoardList.Response) {

        guard let boardList = response.BoardList else { return }

        let viewModel = BoardListModels.BoardList.ViewModel(posts: boardList)

        viewController?.displayBoardList(viewModel: viewModel)
    }
}
