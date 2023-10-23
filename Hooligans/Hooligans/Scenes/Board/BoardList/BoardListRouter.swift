
import Foundation
import UIKit

protocol BoardListRoutingLogic {
    func routeToBoardDetail()
}

protocol BoardDataPassing {
    var dataStore: BoardListDataStore? {get}
}

final class BoardListRouter: BoardListRoutingLogic {
    weak var viewController: BoardListDisplayLogic?
    var dataStore: BoardListDataStore?

    func routeToBoardDetail() {
        guard let viewController = viewController as? UIViewController else {
            return
        }

        let boardDetailViewController = BoardDetailViewController()
        viewController.navigationController?.pushViewController(boardDetailViewController, animated: true)
    }

}
