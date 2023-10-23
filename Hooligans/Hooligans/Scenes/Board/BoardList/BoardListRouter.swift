
import Foundation
import UIKit

protocol BoardListRoutingLogic {
    func routeToBoardDetail()
    func routeToBoardWrite()
}

protocol BoardDataPassing {
    var dataStore: BoardListDataStore? {get}
}

final class BoardListRouter: BoardListRoutingLogic {
    weak var viewController: BoardListDisplayLogic?
    var dataStore: BoardListDataStore?

    func routeToBoardDetail() {
        if let viewController = viewController as? UIViewController {
            let boardDetailViewController = BoardDetailViewController()
            viewController.navigationController?.pushViewController(boardDetailViewController, animated: true)
        }
    }

    func routeToBoardWrite() {
        if let viewController = viewController as? UIViewController {
            let boardWriteViewController = BoardWriteViewController()
            viewController.navigationController?.pushViewController(boardWriteViewController, animated: true)
        }
    }
}
