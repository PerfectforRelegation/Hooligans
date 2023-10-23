//
//  ChatListPresenter.swift
//  Hooligans
//
//  Created by 정명곤 on 10/22/23.
//

import Foundation

protocol ChatListPresentationLogic: AnyObject {
    func presentFixtureList(response: ChatListModels.FixtureList.Response)
}

final class ChatListPresenter {
    weak var viewController: ChatListViewController?
}

extension ChatListPresenter: ChatListPresentationLogic {
    func presentFixtureList(response: ChatListModels.FixtureList.Response) {
        guard let fixtureResponse = response.fixtureListResponse else { return }
        
        let viewModel = ChatListModels.FixtureList.ViewModel(league: fixtureResponse.league, fixtures: fixtureResponse.fixtures)
        
        viewController?.displayFixtureList(viewModel: viewModel)
    }
    
}
