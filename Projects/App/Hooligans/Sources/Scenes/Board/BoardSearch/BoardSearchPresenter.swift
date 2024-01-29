
import Foundation

protocol BoardSearchPresentationLogic: AnyObject {
    func presentationUser(response: BoardSearchModels.PostContents.Response)
}

final class BoardSearchPresenter {
    weak var viewController: BoardSearchDisplayLogic?
}

extension BoardSearchPresenter: BoardSearchPresentationLogic {

    func presentationUser(response: BoardSearchModels.PostContents.Response) {

        guard let postContents = response.postContents else { return }

        let viewModel = BoardSearchModels.PostContents.ViewModel(postContents: postContents)

        //viewController?.displayA(viewModel: viewModel)
    }
}
