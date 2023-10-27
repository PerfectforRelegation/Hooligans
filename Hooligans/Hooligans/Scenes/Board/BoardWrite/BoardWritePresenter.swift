
import Foundation

protocol BoardWritePresentationLogic: AnyObject {
    func presentationUser(response: BoardWriteModels.PostContents.Response)
}

final class BoardWritePresenter {
    weak var viewController: BoardWriteDisplayLogic?
}

