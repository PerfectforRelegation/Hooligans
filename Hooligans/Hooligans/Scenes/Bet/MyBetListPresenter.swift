//
//  MyBetListPresenter.swift
//  Hooligans
//
//  Created by 정명곤 on 11/2/23.
//

import Foundation

protocol MyBetListPresentationLogic: AnyObject {
    func presentationMyBetList(response: BetListModels.MyBetList.Response)
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
    
}
