//
//  MyBetListPresenter.swift
//  Hooligans
//
//  Created by 정명곤 on 11/2/23.
//

import Foundation

protocol MyBetListPresentationLogic: AnyObject {
    func presentationMyBetList(response: BetListModels.MyBetList.Response)
    func presentationReward(response: BetListModels.Reward.Response)
}

final class MyBetListPresenter {
    weak var viewController: MyBetListViewController?
}

extension MyBetListPresenter: MyBetListPresentationLogic {
    
    func presentationMyBetList(response: BetListModels.MyBetList.Response) {
        guard let myBetList = response.myBetList else { return }
        let viewModel = BetListModels.MyBetList.ViewModel(betList: myBetList)
        viewController?.displayMyBetList(viewModel: viewModel)
    }
    
    func presentationReward(response: BetListModels.Reward.Response) {
        guard let point = response.myPoint else { return }
        let viewModel = BetListModels.Reward.ViewModel(point: point)
        print("getReward")
    }
    
}
