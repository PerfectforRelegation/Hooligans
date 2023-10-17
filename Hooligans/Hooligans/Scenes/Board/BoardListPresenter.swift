
import Foundation

protocol BoardListPresentationLogic: AnyObject {
    func presentationUser(response: BoardListModels.PostContents.Response)
}

final class BoardListPresenter {
    weak var viewController: BoardListDisplayLogic?
}

extension BoardListPresenter: BoardListPresentationLogic {

    func presentationUser(response: BoardListModels.PostContents.Response) {

        guard let postContents = response.postContents else { return }

        let viewModel = BoardListModels.PostContents.ViewModel(postContents: postContents)

        viewController?.displayA(viewModel: viewModel)
    }
}
