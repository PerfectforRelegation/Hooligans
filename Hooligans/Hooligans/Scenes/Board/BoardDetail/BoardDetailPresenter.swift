
import Foundation

protocol BoardDetailPresentationLogic: AnyObject {
    func presentationUser(response: BoardDetailModels.PostContents.Response)
}

final class BoardDetailPresenter {
    weak var viewController: BoardDetailDisplayLogic?
}

extension BoardDetailPresenter: BoardDetailPresentationLogic {

    func presentationUser(response: BoardDetailModels.PostContents.Response) {

        guard let postContents = response.postContents else { return }

        let viewModel = BoardDetailModels.PostContents.ViewModel(postContents: postContents)

        //viewController?.displayA(viewModel: viewModel)
    }
}
