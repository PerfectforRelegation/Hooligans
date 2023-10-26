
import Foundation
import UIKit

protocol BoardListRoutingLogic {
    func routeToBoardDetail()
    func routeToBoardWrite()
    func routeToBoardSearch()
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

    func routeToBoardSearch() {
        if let viewController = viewController as? UIViewController {
            let boardSearchViewController = BoardSearchViewController()
            viewController.navigationController?.pushViewController(boardSearchViewController, animated: true)
        }
    }
}
