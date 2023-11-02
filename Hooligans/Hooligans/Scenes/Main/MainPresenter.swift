//
//  MainPresenter.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/14.
//

import Foundation

protocol MainPresentationLogic: AnyObject {
    func presentationMainSource(response: MainModels.Main.Response)
}

final class MainPresenter {
    weak var viewController: MainDisplayLogic?
}

extension MainPresenter: MainPresentationLogic {
    func presentationMainSource(response: MainModels.Main.Response) {
        guard let mainSource = response.main else { return }
        
        let viewModel = MainModels.Main.ViewModel(mainSource: mainSource)
        
        viewController?.displaySomething(viewModel: viewModel)
    }
    
}
