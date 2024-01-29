
import Foundation

protocol BoardWritePresentationLogic: AnyObject {
    func presentationUploadPost(response: BoardWriteModels.UploadPost.Response)
}

final class BoardWritePresenter: BoardWritePresentationLogic {
    weak var viewController: BoardWriteViewController?
    
    func presentationUploadPost(response: BoardWriteModels.UploadPost.Response) {
        print("good")
    }
    
}

