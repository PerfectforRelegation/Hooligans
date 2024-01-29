//
//  BetListPresenter.swift
//  Hooligans
//
//  Created by 정명곤 on 11/2/23.
//

import Foundation

protocol BetListPresentationLogic: AnyObject {
    func presentationBetList(response: BetListModels.BetList.Response)
}

final class BetListPresenter {
    weak var viewController: BetListViewController?
}

extension BetListPresenter: BetListPresentationLogic {
    func presentationBetList(response: BetListModels.BetList.Response) {
        guard let betList = response.betList else { return }
        let viewModel = BetListModels.BetList.ViewModel(betList: betList)
        viewController?.displayBetList(viewModel: viewModel)
    }
    
}
