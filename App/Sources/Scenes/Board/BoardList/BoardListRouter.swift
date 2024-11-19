
import Foundation
import UIKit

protocol BoardListRoutingLogic {
    func routeToBoardDetail(board: Board)
    func routeToBoardWrite()
    func routeToBoardSearch()
}

protocol BoardDataPassing {
    var dataStore: BoardListDataStore? { get }
}

final class BoardListRouter: BoardListRoutingLogic {
    weak var viewController: BoardListViewController?
    var dataStore: BoardListDataStore?

    func routeToBoardWrite() {
        
    }

    func routeToBoardDetail(board: Board) {
        let detailviewController = BoardDetailViewController(board: board)
        viewController?.navigationController?.pushViewController(detailviewController, animated: true)
    }

    func routeToBoardSearch() {
        if let viewController = viewController as? UIViewController {
            let boardSearchViewController = BoardSearchViewController()
            viewController.navigationController?.pushViewController(boardSearchViewController, animated: true)
        }
    }
}
