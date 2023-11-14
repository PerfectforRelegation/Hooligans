
import Foundation

protocol BoardDetailPresentationLogic: AnyObject {
    func presentationBoardDetail(response: BoardDetailModels.Content.Response)
}

final class BoardDetailPresenter {
    weak var viewController: BoardDetailViewController?
}

extension BoardDetailPresenter: BoardDetailPresentationLogic {

    func presentationBoardDetail(response: BoardDetailModels.Content.Response) {

        guard let boardDetail = response.boardDetail else { return }

        let viewModel = BoardDetailModels.Content.ViewModel(boardDetail: boardDetail)

        viewController?.displayBoardContent(viewModel: viewModel)
    }
}
