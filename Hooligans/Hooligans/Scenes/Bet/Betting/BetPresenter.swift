//
//  BetPresenter.swift
//  Hooligans
//
//  Created by 정명곤 on 11/2/23.
//

import Foundation

protocol BetPresentationLogic: AnyObject {
    func BetResultPresentation(response: BetModels.Betting.Response)
}

final class BetPresenter {
    weak var viewController: BetViewController?
}

extension BetPresenter: BetPresentationLogic {
    func BetResultPresentation(response: BetModels.Betting.Response) {
        guard let point = response.point else { return }
        let viewModel = BetModels.Betting.ViewModel(point: point)
        viewController?.displayComplete()
    }
}
